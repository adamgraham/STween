//
//  TweenAnimation.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// An animation that interpolates and updates properties on a `Tweenable` type
/// while maintaining state.
internal final class TweenAnimation<Property: TweenableProperty>: Tween {

    // MARK: Core Properties

    /// The target object on which properties are animated.
    internal let target: Property.Target

    /// The array of properties being animated.
    internal let targetProperties: [Property]

    /// An array of values used to interpolate each property every update cycle.
    private var interpolationValues: [(start: Property, end: Property)]?

    // MARK: Animation & State Properties

    internal var ease = Defaults.ease

    internal var reversed = Defaults.reversed
    
    internal private(set) var state = TweenState.new

    // MARK: Time Properties

    /// The animation timer that keeps track of total elapsed time and fires update cycles.
    private lazy var timer: TweenTimer = TweenTimer(delegate: self)
    
    internal var delay = Defaults.delay

    /// The amount of seconds the tween has been delayed.
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
    internal var onRevive: Callback?

    // MARK: Initialization

    /**
     Initializes a `TweenAnimation` to animate an array of properties on a target object over
     a set duration.
     
     - Parameters:
        - target: The object on which properties are animated.
        - properties: The array of properties to animate.
        - duration: The amount of seconds the animation takes to complete.
     */
    internal init(target: Property.Target, properties: [Property], duration: TimeInterval) {
        self.target = target
        self.duration = duration
        self.targetProperties = properties
    }

}

extension TweenAnimation {

    // MARK: Tweening Methods

    /**
     Updates all target properties of the tween by interpolating new values.

     The tween can only be updated if it's in an `active` state.

     The tween will be completed if its elapsed time has reached or exceeded its duration.
     
     - Returns: `true` if the tween is successfully updated.
     */
    @discardableResult internal func update() -> Bool {
        guard self.state.canUpdate else {
            return false
        }

        updateProperties()
        self.onUpdate?(self)

        if self.elapsed >= self.duration {
            complete()
        }

        return true
    }

    /**
     Interpolates new values for all target properties of the tween, based on its current state, and
     assigns the interpolated values to the target object.
     */
    private func updateProperties() {
        let ease = self.ease
        let elapsed = self.elapsed
        let duration = self.duration

        self.interpolationValues?.forEach {
            let interpolatedValue = Property.interpolate(from: $0.start, to: $0.end, with: ease, elapsed: elapsed, duration: duration)
            interpolatedValue.apply(to: self.target)
        }
    }

    /**
     Applies the end value of each target property to the target object.
     */
    private func completeUpdates() {
        if self.interpolationValues == nil {
            storeInterpolationValues()
        }

        self.interpolationValues?.forEach {
            $0.end.apply(to: self.target)
        }
    }

    /**
     Stores all the necessary data needed to interpolate each target property.

     If the tween is reversed, the start and end value will be flipped with each other.
     */
    private func storeInterpolationValues() {
        self.interpolationValues = self.targetProperties.map {
            let start = $0.value(from: self.target)
            let end = $0

            if self.reversed {
                return (end, start)
            }

            return (start, end)
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
            return startDelay()
        }

        // Set state
        self.state = .active

        // Store property values
        storeInterpolationValues()

        if self.reversed {
            updateProperties()
        }

        // Update timer
        self.timer.reset()
        self.timer.start()

        // Callback event
        self.onStart?(self)

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
        self.onStop?(self)

        return true
    }

    @discardableResult internal func restart() -> Bool {
        guard self.state.canRestart else {
            return false
        }

        stop()
        self.onRestart?(self)
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
        self.onPause?(self)

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
        self.onResume?(self)

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

        // Complete updates
        completeUpdates()

        // Callback event
        self.onComplete?(self)

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
        Tweener.default.remove(self)

        // Callback event
        self.onKill?(self)

        return true
    }

    @discardableResult internal func revive() -> Bool {
        guard self.state.canRevive else {
            return false
        }

        // Set state
        self.state = .new
        self.interpolationValues = nil
        
        // Update timer
        self.timer.stop()
        self.timer.reset()
        self.delayElapsed = 0.0
        
        // Add to Tweener
        Tweener.default.add(self)
        
        // Callback event
        self.onRevive?(self)

        return true
    }

}

extension TweenAnimation {

    // MARK: Delay Methods

    /**
     Marks the tween as delayed, starting the delay timer from zero.

     The tween can only be delayed if it's *not* already in a `delayed` state.

     - Returns: `true` if the tween is successfully marked as delayed.
     */
    @discardableResult private func startDelay() -> Bool {
        guard self.state != .delayed else {
            return false
        }

        // Set state
        self.state = .delayed
        self.delayElapsed = 0.0

        // Update timer
        self.timer.reset()
        self.timer.start()

        return true
    }

    /**
     Updates the elapsed delay time and checks if the delay has finished.

     If the delay has finished, `start` will be invoked on the tween.

     - Parameters:
        - elapsed: The amount of seconds elapsed since the start of the delay.
     */
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
