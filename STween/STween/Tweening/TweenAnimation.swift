//
//  TweenAnimation.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A class to animate properties on a `Tweenable` object via easing 
/// functions and interpolation.
internal final class TweenAnimation<TargetProperty: TweenableProperty>: Tween {

    internal typealias Target = TargetProperty.Target

    // MARK: Core Properties

    /// The object or data structure that properties are animated on.
    internal let target: Target

    /// The array of properties being animated.
    internal let targetProperties: [TargetProperty]

    /// An array of values used to interpolate each property every update cycle.
    private var interpolationValues = [InterpolationValues<TargetProperty>]()

    // MARK: Animation & State Properties

    internal var ease = Defaults.ease

    internal var reversed = Defaults.reversed
    
    internal private(set) var state = TweenState.new

    // MARK: Time Properties

    /// The internal timer of `self` used to keep track of total elapsed time and
    /// fire update cycles.
    private lazy var timer: TweenTimer = TweenTimer(delegate: self)
    
    internal var delay = Defaults.delay

    /// The amount of time, in seconds, `self` has been delayed.
    private var delayElapsed = 0.0

    internal var duration: TimeInterval

    internal var elapsed: TimeInterval {
        switch self.state {
        case .completed:
            return self.duration
        case .delayed:
            return 0.0
        default:
            return self.timer.elapsed
        }
    }

    // MARK: Callback Properties

    internal var onUpdate: Callback?
    internal var onStart: Callback?
    internal var onStop: Callback?
    internal var onRestart: Callback?
    internal var onPause: Callback?
    internal var onResume: Callback?
    internal var onComplete: Callback?
    internal var onKill: Callback?
    internal var onReset: Callback?

    // MARK: Initialization Methods

    /**
     An initializer to create a `TweenAnimation` with a target object or data 
     structure, an array of properties to be animated, and a duration.
     
     - Parameters:
        - target: The object or data structure that properties are updated on.
        - properties: An array of properties to be animated on the `target`.
        - duration: The total amount of time, in seconds, the animation will run.
     */
    internal init(target: Target,
                  properties: [TargetProperty],
                  duration: TimeInterval) {

        self.target = target
        self.duration = duration
        self.targetProperties = properties
    }

}

extension TweenAnimation {

    // MARK: Tweening Methods

    /**
     A method to update all of `self`'s target properties by interpolating
     new values. `self` will be completed if its elapsed time has
     reached or exceeded its duration.

     **Note:** `self` can only be updated if in an active state.
     
     - Returns: `true` if `self` is successfully updated.
     */
    @discardableResult internal func update() -> Bool {
        guard self.state.canUpdate else {
            return false
        }

        updateProperties()
        self.onUpdate?()

        if self.elapsed >= self.duration {
            complete()
        }

        return true
    }

    /**
     A method to interpolate all of `self`'s target properties, based on its
     current state, and assign the interpolated values to the target.
     */
    private func updateProperties() {
        let ease = self.ease
        let elapsed = self.elapsed
        let duration = self.duration

        self.interpolationValues.forEach {
            let interpolatedValue = $0.interpolate(with: ease, elapsed: elapsed, duration: duration)
            interpolatedValue.apply(to: self.target)
        }
    }

    /**
     A method to store all the necessary data needed to interpolate each
     target property. If `self` is reversed, the start and end value will be
     flipped with each other.
     */
    private func storeStartingAndEndingValues() {
        self.interpolationValues = self.targetProperties.map {
            let start = $0.value(from: self.target)
            let end = $0

            if !self.reversed {
                return InterpolationValues(start: start, end: end)
            } else {
                return InterpolationValues(start: end, end: start)
            }
        }
    }

}

extension TweenAnimation {

    // MARK: State Control Methods

    @discardableResult internal func start() -> Bool {
        guard self.state.canStart else {
            return false
        }

        guard self.delayElapsed >= self.delay else {
            startDelay()
            return false
        }

        // Set state
        self.state = .active

        // Store property values
        storeStartingAndEndingValues()

        if self.reversed {
            updateProperties()
        }

        // Update timer
        self.timer.reset()
        self.timer.start()

        // Callback event
        self.onStart?()

        return true
    }

    @discardableResult internal func stop() -> Bool {
        guard self.state.canStop else {
            return false
        }

        // Set state
        self.state = .inactive

        // Update timer
        self.timer.stop()
        self.timer.reset()
        self.delayElapsed = 0.0

        // Callback event
        self.onStop?()

        return true
    }

    @discardableResult internal func restart() -> Bool {
        guard self.state.canRestart else {
            return false
        }

        stop()
        self.onRestart?()
        start()

        return true
    }

    @discardableResult internal func pause() -> Bool {
        guard self.state.canPause else {
            return false
        }

        // Update state
        self.state = .paused

        // Update timer
        self.timer.stop()

        // Callback event
        self.onPause?()

        return true
    }

    @discardableResult internal func resume() -> Bool {
        guard self.state.canResume else {
            return false
        }

        // Update state
        if self.delayElapsed >= self.delay {
            self.state = .active
        } else {
            self.state = .delayed
        }

        // Update timer
        self.timer.start()

        // Callback event
        self.onResume?()

        return true
    }

    @discardableResult internal func complete() -> Bool {
        guard self.state.canComplete else {
            return false
        }

        // Set state
        self.state = .completed

        // Update timer
        self.timer.stop()
        self.timer.elapsed = self.duration
        self.delayElapsed = 0.0

        // Update properties
        updateProperties()

        // Callback event
        self.onComplete?()

        // Kill, if necessary
        if Defaults.autoKillCompletedTweens {
            kill()
        }

        return true
    }

    @discardableResult internal func kill() -> Bool {
        guard self.state.canKill else {
            return false
        }

        // Set state
        self.state = .killed

        // Update timer
        self.timer.stop()

        // Remove from Tweener
        Tweener.remove(self)

        // Callback event
        self.onKill?()

        return true
    }

    @discardableResult internal func reset() -> Bool {
        guard self.state.canReset else {
            return false
        }

        // Set state
        self.state = .new

        // Default properties
        self.interpolationValues = []
        self.reversed = Defaults.reversed
        self.ease = Defaults.ease
        self.delay = Defaults.delay
        self.delayElapsed = 0.0
        
        // Update timer
        self.timer.stop()
        self.timer.reset()
        
        // Add to Tweener
        Tweener.add(self)
        
        // Callback event
        self.onReset?()
        clearAllCallbacks()

        return true
    }

}

extension TweenAnimation {

    // MARK: Callback Methods

    /// :nodoc:
    private func clearAllCallbacks() {
        self.onUpdate = nil
        self.onStart = nil
        self.onStop = nil
        self.onRestart = nil
        self.onPause = nil
        self.onResume = nil
        self.onComplete = nil
        self.onKill = nil
        self.onReset = nil
    }
    
}

extension TweenAnimation {

    // MARK: Delay Methods

    /// :nodoc:
    private func startDelay() {
        guard self.state != .delayed else {
            return
        }

        // Set state
        self.state = .delayed
        self.delayElapsed = 0.0

        // Update timer
        self.timer.reset()
        self.timer.start()
    }

    /// :nodoc:
    private func updateDelay(by elapsed: TimeInterval) {
        self.delayElapsed = elapsed

        if self.delayElapsed >= self.delay {
            self.state = .inactive
            start()
        }
    }

}

extension TweenAnimation: TweenTimerDelegate {

    // MARK: TweenTimerDelegate

    internal func tweenTimer(_ timer: TweenTimer, didUpdateWithElapsedTime elapsed: TimeInterval) {
        switch self.state {
        case .delayed:
            updateDelay(by: elapsed)
        default:
            update()
        }
    }

}
