//
//  TweenAnimation.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A class to animate properties on a `Tweenable` object via interpolation
/// and easing algorithms.
internal final class TweenAnimation<TweenableTarget: Tweenable>: Tween {

    // MARK: Core Properties

    /// The object or data structure that properties are animated on.
    internal let target: TweenableTarget

    /// The array of properties being animated.
    internal let targetProperties: [TweenableTarget.TweenProperty]

    /// An array of values used to interpolate each property every update cycle.
    fileprivate var interpolationValues = [InterpolationValues<TweenableTarget.TweenProperty>]()

    /// A dictionary storing the callbacks for each change of state.
    fileprivate var callbacks = [TweenStateChange: Callback?]()

    // MARK: Animation & State Properties

    internal var ease = Defaults.ease

    internal var reversed = Defaults.reversed
    
    internal fileprivate(set) var state = TweenState.new

    // MARK: Time Properties

    /// The internal timer of `self` used to keep track of total elapsed time and
    /// fire update cycles. The rate at which the timer updates is based on
    /// `FrameRate.targetFrameRate`.
    fileprivate lazy var timer: TweenTimer = TweenTimer(delegate: self)
    
    internal var delay = Defaults.delay

    internal var duration: TimeInterval

    internal var elapsed: TimeInterval {
        return self.state == .completed ? self.duration : self.timer.elapsed
    }

    // MARK: Initialization Methods

    /**
     An initializer to create a `TweenAnimation` with a target object or data 
     structure, an array of properties to be animated, and a duration.
     
     - Parameters:
        - target: The object or data structure that properties are updated on.
        - properties: An array of properties to be animated on the `target`.
        - duration: The total amount of time, in seconds, the animation will run.
     */
    internal init(target: TweenableTarget,
                  properties: [TweenableTarget.TweenProperty],
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
        callback(invoke: .update)

        if self.elapsed >= self.duration {
            complete()
        }

        return true
    }

    /**
     A method to interpolate all of `self`'s target properties, based on its
     current state, and assign the interpolated values to the target.
     */
    fileprivate func updateProperties() {
        let ease = self.ease
        let elapsed = self.elapsed
        let duration = self.duration

        for values in self.interpolationValues {
            do {
                try self.target.interpolate(with: ease, values: values, elapsed: elapsed, duration: duration)
            } catch let error {
                if let stringConvertible = error as? CustomStringConvertible {
                    print(stringConvertible.description)
                } else {
                    print("ERROR: \(error.localizedDescription)")
                }
            }
        }
    }

    /**
     A method to store all the necessary data needed to interpolate each
     target property. If `self` is reversed, the start and end value will be
     flipped with each other.
     */
    fileprivate func storeStartingAndEndingValues() {
        self.interpolationValues.removeAll()

        for property in self.targetProperties {
            let values: InterpolationValues<TweenableTarget.TweenProperty>

            if !self.reversed {
                values = InterpolationValues(start: self.target.interpolationStartValue(for: property), end: property)
            } else {
                values = InterpolationValues(start: property, end: self.target.interpolationStartValue(for: property))
            }
            
            self.interpolationValues.append(values)
        }
    }

}

extension TweenAnimation {

    // MARK: State Control Methods

    /**
     A method to set `self` as active, starting from its beginning values.

     **Note:** `self` can only be started if in a new or inactive state.
     
     - Returns: `true` if `self` is successfully started.
     */
    @discardableResult internal func start() -> Bool {
        guard self.state.canStart else {
            return false
        }

        // Store property values
        storeStartingAndEndingValues()

        // Set state
        self.state = .active

        // Update timer
        self.timer.reset()
        self.timer.start()

        // Callback event
        callback(invoke: .start)

        return true
    }

    /**
     A method to set `self` as inactive, resetting to its beginning values.

     **Note:** `self` can only be stopped if in an active or paused state.
     
     - Returns: `true` if `self` is successfully stopped.
     */
    @discardableResult internal func stop() -> Bool {
        guard self.state.canStop else {
            return false
        }

        // Set state
        self.state = .inactive

        // Update timer
        self.timer.stop()
        self.timer.reset()

        // Callback event
        callback(invoke: .stop)

        return true
    }

    /**
     A method to stop `self`, then immediately start `self` from its beginning
     values.

     **Note:** `self` can only be restarted if in an active, paused, or completed 
     state.
     
     - Returns: `true` if `self` is successfully restarted.
     */
    @discardableResult internal func restart() -> Bool {
        guard self.state.canRestart else {
            return false
        }

        stop()

        // Callback event
        callback(invoke: .restart)

        start()

        return true
    }

    /**
     A method to set `self` as paused, maintaining its current values.

     **Note:** `self` can only be paused if in an active state.
     
     - Returns: `true` if `self` is successfully paused.
     */
    @discardableResult internal func pause() -> Bool {
        guard self.state.canPause else {
            return false
        }

        // Update state
        self.state = .paused

        // Update timer
        self.timer.stop()

        // Callback event
        callback(invoke: .pause)

        return true
    }

    /**
     A method to set `self` as active, maintaining its values from when it was
     paused.

     **Note:** `self` can only be resumed if in a paused state.
     
     - Returns: `true` if `self` is successfully resumed.
     */
    @discardableResult internal func resume() -> Bool {
        guard self.state.canResume else {
            return false
        }

        // Update state
        self.state = .active

        // Update timer
        self.timer.start()

        // Callback event
        callback(invoke: .resume)

        return true
    }

    /**
     A method to set `self` as completed, jumping to its ending values. `self`
     will be killed if `Defaults.autoKillCompletedTweens` is `true`.

     **Note:** `self` can only be completed if in an active or paused state.
     
     - Returns: `true` if `self` is successfully completed.
     */
    @discardableResult internal func complete() -> Bool {
        guard self.state.canComplete else {
            return false
        }

        // Set state
        self.state = .completed

        // Update timer
        self.timer.stop()
        self.timer.elapsed = self.duration

        // Update properties
        updateProperties()

        // Callback event
        callback(invoke: .complete)

        // Kill, if necessary
        if Defaults.autoKillCompletedTweens {
            kill()
        }

        return true
    }

    /**
     A method to set `self` as killed, haulting at its current values, and
     remove it from `Tweener`'s list of tracked tweens.

     **Note:** `self` can only be killed if *not* already in a killed state.
     
     - Returns: `true` if `self` is successfully killed.
     */
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
        callback(invoke: .kill)

        return true
    }

    /**
     A method to set `self` as new, resetting all properties to their default
     values, and re-adding `self` to `Tweener`'s list of tracked tweens. This is
     the only way to revive a killed `self`.

     **Note:** `self` can only be reset if *not* already in a new state.
     
     - Returns: `true` if `self` is successfully reset.
     */
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
        
        // Update timer
        self.timer.stop()
        self.timer.reset()
        
        // Add to Tweener
        Tweener.add(self)
        
        // Callback event
        callback(invoke: .reset)
        self.callbacks.removeAll()

        return true
    }

}

extension TweenAnimation {

    // MARK: Invocation Methods

    @discardableResult internal func invoke(_ stateChange: TweenStateChange) -> Bool {
        switch stateChange {
        case .start:
            return start()
        case .stop:
            return stop()
        case .restart:
            return restart()
        case .pause:
            return pause()
        case .resume:
            return resume()
        case .complete:
            return complete()
        case .kill:
            return kill()
        case .reset:
            return reset()
        case .update:
            return update()
        }
    }

}

extension TweenAnimation {

    // MARK: Callback Methods

    internal func callback(get stateChange: TweenStateChange) -> Callback? {
        return self.callbacks[stateChange] ?? nil
    }

    internal func callback(set stateChange: TweenStateChange, value: Callback?) {
        self.callbacks[stateChange] = value
    }

    internal func callback(clear stateChange: TweenStateChange) {
        callback(set: stateChange, value: nil)
    }

    /**
     A method to invoke the callback assigned to a change of state.

     - Parameters:
        - stateChange: The change of state to which its callback will be
                       invoked.
     */
    fileprivate func callback(invoke stateChange: TweenStateChange) {
        callback(get: stateChange)?()
    }
    
}

extension TweenAnimation: TweenTimerDelegate {

    // MARK: TweenTimerDelegate

    internal func tweenTimer(_ timer: TweenTimer, didUpdateWithElapsedTime elapsed: TimeInterval) {
        update()
    }

}
