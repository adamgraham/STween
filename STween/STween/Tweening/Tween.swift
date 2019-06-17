//
//  Tween.swift
//  STween
//
//  Created by Adam Graham on 8/27/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// A handle that provides state control and customization of a tween animation.
public protocol Tween: AnyObject {

    // MARK: Animation & State Properties

    /// The `Ease` used to interpolate values.
    var ease: Ease { get set }

    /// The state of animating *to* the target property values (`false`) or *from* the target
    /// property values (`true`).
    ///
    /// Assigning this will not take effect until the tween is started. If the tween has already
    /// been started, it must be restarted before taking effect.
    var reversed: Bool { get set }

    /// The tween's current state, i.e., active, paused, etc.
    var state: TweenState { get }

    // MARK: Time Properties

    /// The amount of seconds before the tween starts updating after being started.
    ///
    /// Assigning this will not take effect until the tween is started. If the tween has already
    /// been started, it must be restarted before taking effect.
    var delay: TimeInterval { get set }

    /// The amount of seconds the tween takes to complete.
    ///
    /// Assigning this while the tween is active may cause undesired behavior.
    var duration: TimeInterval { get set }

    /// The amount of seconds the tween has been active.
    ///
    /// The elapsed time is reset when the tween is started.
    /// If the tween is completed, the elapsed time is the same as the duration.
    var elapsed: TimeInterval { get }

    // MARK: Callback Properties

    /// The method signature of a "callback" closure. Callbacks are invoked upon completion
    /// of many different events, such as when a tween has finished animating.
    typealias Callback = (Tween) -> Void

    /// The callback invoked every time the tween is updated.
    var onUpdate: Callback? { get set }

    /// The callback invoked when the tween is started.
    var onStart: Callback? { get set }

    /// The callback invoked when the tween is stopped.
    var onStop: Callback? { get set }

    /// The callback invoked when the tween is restarted.
    var onRestart: Callback? { get set }

    /// The callback invoked when the tween is paused.
    var onPause: Callback? { get set }

    /// The callback invoked when the tween is resumed.
    var onResume: Callback? { get set }

    /// The callback invoked when the tween is completed.
    var onComplete: Callback? { get set }

    /// The callback invoked when the tween is killed.
    var onKill: Callback? { get set }

    /// The callback invoked when the tween is revived.
    var onRevive: Callback? { get set }

    // MARK: Tweening Methods

    /**
     Increases the tween's elapsed time and updates all target properties of the tween after
     interpolating new values.

     The tween can only be updated if it's in an `active` state.
     If it's in a `delayed` state, the tween's elapsed delay will be increased instead.
     The tween will be completed if its elapsed time has reached or exceeded its duration.

     - Parameter deltaTime: The amount of seconds passed since the last update.
     - Returns: `true` if the tween is successfully updated.
     */
    @discardableResult func update(by deltaTime: TimeInterval) -> Bool

    // MARK: State Control Methods

    /**
     Starts the tween for updates, putting it in an `active` state from its beginning values.

     The tween can only be started if it's in a `new` or `inactive` state.

     - Returns: `true` if the tween is successfully started.
     */
    @discardableResult func start() -> Bool

    /**
     Stops the tween from updating, putting it in an `inactive` state.

     The tween can only be stopped if it's in an `active`, `delayed`, or `paused` state.

     - Returns: `true` if the tween is successfully stopped.
     */
    @discardableResult func stop() -> Bool

    /**
     Stops the tween, then immediately starts it over again from the beginning.

     The tween can only be restarted if it's *not* in a `killed` state.

     - Returns: `true` if the tween is successfully restarted.
     */
    @discardableResult func restart() -> Bool

    /**
     Pauses the tween, maintaining its current progress.

     The tween can only be paused if it's in an `active` or `delayed` state.

     - Returns: `true` if the tween is successfully paused.
     */
    @discardableResult func pause() -> Bool

    /**
     Resumes the tween, continuing where it left off before being paused.

     The tween can only be resumed if it's in a `paused` state.

     - Returns: `true` if the tween is successfully resumed.
     */
    @discardableResult func resume() -> Bool

    /**
     Completes updates on the tween, jumping to its ending values if not already there.

     The tween can only be completed if it's *not* already in a `complete` state and not in a
     `killed` state. The tween will automatically be killed if `Defaults.autoKillCompletedTweens`
     is `true`.

     - Returns: `true` if the tween is successfully completed.
     */
    @discardableResult func complete() -> Bool

    /**
     Kills the tween in place, halting at its current values, and removes it from `Tweener`'s
     list of tracked tweens.

     The tween can only be killed if it's *not* already in a `killed` state.

     - Returns: `true` if the tween is successfully killed.
     */
    @discardableResult func kill() -> Bool

    /**
     Revives the tween, putting it in a `new` state, and re-adds it to `Tweener`'s list of tracked
     tweens.

     The tween can only be revived if it's in a `killed` state.

     - Returns: `true` if the tween is successfully revived.
     */
    @discardableResult func revive() -> Bool

}

extension Tween {

    // MARK: Computed Properties

    /// The percentage of the tween's `elapsed` time in relation to its `duration` specified in a
    /// range of `0.0` to `1.0`.
    public var percentComplete: Double {
        return clamp(value: self.elapsed / self.duration, lower: 0.0, upper: 1.0)
    }
    
}
