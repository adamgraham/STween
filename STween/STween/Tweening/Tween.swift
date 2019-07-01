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

    /// An animation closure that is invoked every time a tween is updated. These closures
    /// interpolate new values of properties and apply them back to a target instance.
    typealias Animation = (TimeInterval) -> Void

    /// The `Ease` used to interpolate values.
    var ease: Ease { get set }

    /// The tween's current state, i.e., active, paused, etc.
    var state: TweenState { get }

    // MARK: Time Properties

    /// The amount of seconds before the tween starts updating after being started.
    ///
    /// Assigning this will not take effect until the tween is started. If the tween has already
    /// been started, it must be restarted before taking effect.
    var delay: TimeInterval { get set }

    /// The amount of seconds the tween takes to complete.
    var duration: TimeInterval { get set }

    /// The amount of seconds the tween has been active.
    ///
    /// The elapsed time is reset when the tween is started.
    /// If the tween is completed, the elapsed time is the same as the duration.
    var elapsed: TimeInterval { get }

    // MARK: Callback Properties

    /// Callbacks are invoked upon completion of many different events, such as when a tween
    /// has finished animating.
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

    // MARK: State Control

    /// Increases the tween's elapsed time and invokes all animation closures. These closures
    /// interpolate new values of properties and apply them back to the target instance(s). The
    /// tween will be completed if its elapsed time has reached or exceeded its duration.
    ///
    /// If the tween is in a `delayed` state, the elapsed delay is updated instead; otherwise, the
    /// tween can only be updated if in an `active` state.
    ///
    /// - parameter deltaTime: The amount of seconds passed since the last update.
    /// - returns: `true` if the tween is successfully updated.
    @discardableResult
    func update(by deltaTime: TimeInterval) -> Bool

    /// Starts the tween for updates, putting it in an `active` state from its beginning values.
    /// The tween can only be started if it's in a `new` or `inactive` state.
    /// - returns: `true` if the tween is successfully started.
    @discardableResult
    func start() -> Bool

    /// Stops the tween from updating, putting it in an `inactive` state. The tween can only be
    /// stopped if it's in an `active`, `delayed`, or `paused` state.
    /// - returns: `true` if the tween is successfully stopped.
    @discardableResult
    func stop() -> Bool

    /// Stops the tween, then immediately starts it over again from the beginning. The tween
    /// can only be restarted if it's *not* in a `killed` state.
    /// - returns: `true` if the tween is successfully restarted.
    @discardableResult
    func restart() -> Bool

    /// Pauses the tween, maintaining its current progress. The tween can only be paused if
    /// it's in an `active` or `delayed` state.
    /// - returns: `true` if the tween is successfully paused.
    @discardableResult
    func pause() -> Bool

    /// Resumes the tween, continuing where it left off before being paused. The tween can
    /// only be resumed if it's in a `paused` state.
    /// - returns: `true` if the tween is successfully resumed.
    @discardableResult
    func resume() -> Bool

    /// Completes updates on the tween, jumping to its ending values if not already there.
    /// The tween can only be completed if it's *not* already in a `complete` state and *not* in a
    /// `killed` state. The tween will automatically be killed if
    /// `Defaults.autoKillCompletedTweens` is `true`.
    /// - returns: `true` if the tween is successfully completed.
    @discardableResult
    func complete() -> Bool

    /// Kills the tween in place, halting at its current values, and removes it from `Tweener`'s
    /// list of tracked tweens. The tween can only be killed if it's *not* already in a `killed` state.
    /// - returns: `true` if the tween is successfully killed.
    @discardableResult
    func kill() -> Bool

    /// Revives the tween, putting it in a `new` state, and re-adds it to `Tweener`'s list of
    /// tracked tweens. The tween can only be revived if it's in a `killed` state.
    /// - returns: `true` if the tween is successfully revived.
    @discardableResult
    func revive() -> Bool

}

extension Tween {

    // MARK: Computed Properties

    /// The percentage of the tween's `elapsed` time in relation to its `duration` specified in
    /// the range [0, 1].
    public var percentComplete: Double {
        return clamp(value: self.elapsed / self.duration, lower: 0.0, upper: 1.0)
    }
    
}
