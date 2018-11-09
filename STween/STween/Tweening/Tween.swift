//
//  Tween.swift
//  STween
//
//  Created by Adam Graham on 8/27/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// A protocol to provide control and customization of a tween animation.
public protocol Tween: class {

    // MARK: Animation & State Properties

    /// The `Ease` represented by `self`.
    var ease: Ease { get set }

    /// The state of `self` animating *to* the target property values (`false`) or *from* the
    /// target property values (`true`).
    ///
    /// **Note:** Assigning this will not take effect until `self` is started. If `self` has
    /// already been started, `self` must be restarted before taking effect.
    var reversed: Bool { get set }

    /// The current state of `self`, i.e., active, paused, etc.
    var state: TweenState { get }

    // MARK: Time Properties

    /// The amount of time, in seconds, before `self` starts updating after being started.
    ///
    /// **Note:** Assigning this will not take effect until `self` is started. If `self` has
    /// already been started, `self` must be restarted before taking effect.
    var delay: TimeInterval { get set }

    /// The total amount of time, in seconds, `self` is set to run.
    ///
    /// **Note:** Assigning this while `self` is active may cause undesired behavior.
    var duration: TimeInterval { get set }

    /// The amount of time, in seconds, `self` has been active.
    ///
    /// **Note:** Elapsed time is reset when `self` is stopped or restarted but not paused.
    /// If `self` is completed, the elapsed time is the same as `self`'s duration.
    var elapsed: TimeInterval { get }

    /// The percentage of `elapsed` time of `self` in relation to its `duration`.
    /// Returns within the range of `0.0` and `1.0`.
    var percentComplete: Double { get }

    // MARK: Callback Properties

    /// The callback invoked every time `self` is successfully updated.
    var onUpdate: Callback? { get set }

    /// The callback invoked when the state control method, `start`, is successful.
    var onStart: Callback? { get set }

    /// The callback invoked when the state control method, `stop`, is successful.
    var onStop: Callback? { get set }

    /// The callback invoked when the state control method, `restart`, is successful.
    var onRestart: Callback? { get set }

    /// The callback invoked when the state control method, `pause`, is successful.
    var onPause: Callback? { get set }

    /// The callback invoked when the state control method, `resume`, is successful.
    var onResume: Callback? { get set }

    /// The callback invoked when the state control method, `complete`, is successful.
    var onComplete: Callback? { get set }

    /// The callback invoked when the state control method, `kill`, is successful.
    var onKill: Callback? { get set }

    /// The callback invoked when the state control method, `reset`, is successful.
    var onReset: Callback? { get set }

    // MARK: State Control Methods

    /**
     A method to set `self` as active, starting from its beginning values.

     **Note:** `self` can only be started if in a new or inactive state.

     - Returns: `true` if `self` is successfully started.
     */
    @discardableResult func start() -> Bool

    /**
     A method to set `self` as inactive, resetting to its beginning values.

     **Note:** `self` can only be stopped if in an active or paused state.

     - Returns: `true` if `self` is successfully stopped.
     */
    @discardableResult func stop() -> Bool

    /**
     A method to stop `self`, then immediately start `self` from its beginning values.

     **Note:** `self` can only be restarted if in an active, paused, or completed state.

     - Returns: `true` if `self` is successfully restarted.
     */
    @discardableResult func restart() -> Bool

    /**
     A method to set `self` as paused, maintaining its current values.

     **Note:** `self` can only be paused if in an active state.

     - Returns: `true` if `self` is successfully paused.
     */
    @discardableResult func pause() -> Bool

    /**
     A method to set `self` as active, maintaining its values from when it was paused.

     **Note:** `self` can only be resumed if in a paused state.

     - Returns: `true` if `self` is successfully resumed.
     */
    @discardableResult func resume() -> Bool

    /**
     A method to set `self` as completed, jumping to its ending values. `self` will be killed if
     `Defaults.autoKillCompletedTweens` is `true`.

     **Note:** `self` can only be completed if in an active or paused state.

     - Returns: `true` if `self` is successfully completed.
     */
    @discardableResult func complete() -> Bool

    /**
     A method to set `self` as killed, haulting at its current values, and remove it from
     `Tweener`'s list of tracked tweens.

     **Note:** `self` can only be killed if *not* already in a killed state.

     - Returns: `true` if `self` is successfully killed.
     */
    @discardableResult func kill() -> Bool

    /**
     A method to set `self` as new, resetting all properties to their default values, and
     re-adding `self` to `Tweener`'s list of tracked tweens. This is the only way to revive a
     killed `self`.

     **Note:** `self` can only be reset if *not* already in a new state.

     - Returns: `true` if `self` is successfully reset.
     */
    @discardableResult func reset() -> Bool

}

extension Tween {

    // MARK: Default Implementation

    public var percentComplete: Double {
        return clamp(value: self.elapsed / self.duration, lower: 0.0, upper: 1.0)
    }
    
}
