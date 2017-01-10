//
//  Tween.swift
//  STween
//
//  Created by Adam Graham on 8/27/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide control and customization of a tween animation.
public protocol Tween: class {

    // MARK: Animation & State Properties

    /// The `Ease` represented by `self`.
    var ease: Ease { get set }

    /**
     The state of `self` animating *to* the target property values (`false`) or
     *from* the target property values (`true`).

     **Note:** Has no effect once `self` is started.
     */
    var reversed: Swift.Bool { get set }

    /// The current state of `self` i.e. active, paused, etc.
    var state: TweenState { get }

    // MARK: Time Properties

    /**
     The amount of time, in seconds, before `self` starts updating after 
     starting.

     **Note:** Assigning has no effect once `self` is started.
     */
    var delay: Foundation.TimeInterval { get set }

    /**
     The total amount of time, in seconds, `self` is set to run.

     **Note:** Assigning while `self` is active may cause undesired behavior.
     */
    var duration: Foundation.TimeInterval { get set }

    /**
     The amount of time, in seconds, `self` has been active.

     **Note:** Elapsed time is reset when `self` is stopped or restarted, but not
     paused. If `self` is completed, the elapsed time is the same as `self`'s
     duration.
     */
    var elapsed: Foundation.TimeInterval { get }

    // MARK: Invocation Methods

    /**
     A method to invoke a change of state on `self`.
     
     - Parameters:
        - stateChange: The change of state to be invoked on `self`.
     
     - Returns: `true` if the state of `self` is changed successfully.
     */
    @discardableResult func invoke(_ stateChange: TweenStateChange) -> Swift.Bool

    // MARK: Callback Methods

    /**
     A method to retrieve the callback assigned to a change of state.
     
     - Parameters:
        - stateChange: The change of state from which a callback will be
                       retrieved.
     
     - Returns: The callback retrieved from the `stateChange`.
     */
    func callback(get stateChange: TweenStateChange) -> Callback?

    /**
     A method to assign a callback to a change of state.
     
     - Parameters:
        - stateChange: The change of state to which a callback will be
                       assigned.
        - value: The callback to be assigned to the `stateChange`.
     */
    func callback(set stateChange: TweenStateChange, value: Callback?)

    /**
     A method to unassign the callback assigned to a change of state.
     
     - Parameters:
        - stateChange: The change of state from which a callback will be
                       unassigned.
     */
    func callback(clear stateChange: TweenStateChange)

}

// MARK: - Helpers

extension Tween {

    /**
     The percentage of `self`'s `elapsed` time over `self`'s `duration` of time,
     in the range of `0.0` to `1.0`.
     */
    var percentComplete: Swift.Double {
        return clamp(value: self.elapsed / self.duration, lower: 0.0, upper: 1.0)
    }
    
}
