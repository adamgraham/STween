//
//  TweenAnimator.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// Maintains the state of a tween animation while invoking animation closures to
/// interpolate and update the properties of a `Tweenable` object.
internal final class TweenAnimator: Tween {

    // MARK: Animation & State Properties

    /// A weak reference to the `Tweener` instance that is tracking this tween.
    internal weak var tweener: Tweener?

    /// An array of animation closures that are invoked every update cycle.
    private var tweens: [Tween.Animation] = []

    internal var ease = Defaults.ease

    internal var reversed = Defaults.reversed
    
    internal private(set) var state = TweenState.new

    // MARK: Time Properties
    
    internal var delay = Defaults.delay
    /// The amount of seconds the tween has been delayed.
    private var delayElapsed: TimeInterval = 0.0

    internal var duration: TimeInterval
    internal var elapsed: TimeInterval = 0.0

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

    /// Initializes the animator to invoke an array of animation closures over a set duration.
    /// These animation closures interpolate a new value of a property and apply it back to a
    /// target object.
    ///
    /// - parameter tweens: The array of animation closures that are invoked every update cycle.
    /// - parameter duration: The amount of seconds the animation takes to complete.
    /// - parameter completion: An optional closure invoked when the animation is finished.
    internal init(_ tweens: [Tween.Animation], duration: TimeInterval, completion: Tween.Callback? = nil) {
        self.tweens = tweens
        self.duration = duration
        self.onComplete = completion
    }

}

extension TweenAnimator {

    // MARK: Tweening Methods

    @discardableResult
    public func update(by deltaTime: TimeInterval) -> Bool {
        guard self.state != .delayed else {
            updateDelay(by: deltaTime)
            return false
        }

        guard self.state.canUpdate else { return false }

        // Increase elapsed time
        self.elapsed += deltaTime

        // Invoke tweens for the current time
        tween(percent: self.percentComplete)
        self.onUpdate?(self)

        // Check if the animation is complete
        if self.elapsed >= self.duration {
            complete()
        }

        return true
    }

    /// Invokes all animation closures for the current time after applying an easing function.
    /// These animation closures interpolate a new value of a property and apply it back to a
    /// target object.
    /// - parameter percent: The percentage of the tween's elapsed time in relation to its duration.
    private func tween(percent: TimeInterval) {
        var percent = percent
        if self.reversed { percent = 1.0 - percent }
        let time = self.ease.function(percent)

        for tween in self.tweens {
            tween(time)
        }
    }

}

extension TweenAnimator {

    // MARK: Delay Methods

    /// Marks the tween as delayed, starting the delay timer from zero.
    /// The tween can only be delayed if it's *not* already in a `delayed` state.
    /// - returns: `true` if the tween is successfully marked as delayed.
    @discardableResult
    private func startDelay() -> Bool {
        guard self.state != .delayed else { return false }

        // Set state
        self.state = .delayed
        self.delayElapsed = 0.0

        return true
    }

    /// Updates the elapsed delay time and checks if the delay has finished.
    /// If the delay has finished, `start` will be invoked on the tween.
    /// - parameter deltaTime: The amount of seconds elapsed since the last update.
    private func updateDelay(by deltaTime: TimeInterval) {
        // Increase elapsed time
        self.delayElapsed += deltaTime

        // Check if the delay is complete
        if self.delayElapsed >= self.delay {
            self.state = .inactive
            self.delayElapsed = self.delay
            start()
        }
    }

}

extension TweenAnimator {

    // MARK: State Control Methods

    @discardableResult
    internal func start() -> Bool {
        guard self.state.canStart else { return false }
        guard self.delayElapsed >= self.delay else {
            return startDelay()
        }

        // Set state
        self.state = .active
        self.elapsed = 0.0

        // Apply initial updates
        tween(percent: 0.0)

        // Callback event
        self.onStart?(self)

        return true
    }

    @discardableResult
    internal func stop() -> Bool {
        guard self.state.canStop else { return false }

        // Set state
        self.state = .inactive

        // Update elapsed time
        self.elapsed = 0.0
        self.delayElapsed = 0.0

        // Callback event
        self.onStop?(self)

        return true
    }

    @discardableResult
    internal func restart() -> Bool {
        guard self.state.canRestart else { return false }

        stop()
        self.onRestart?(self)
        start()

        return true
    }

    @discardableResult
    internal func pause() -> Bool {
        guard self.state.canPause else { return false }

        // Set state
        self.state = .paused

        // Callback event
        self.onPause?(self)

        return true
    }

    @discardableResult
    internal func resume() -> Bool {
        guard self.state.canResume else { return false }

        // Set state
        if self.delayElapsed >= self.delay {
            self.state = .active
        } else {
            self.state = .delayed
        }

        // Callback event
        self.onResume?(self)

        return true
    }

    @discardableResult
    internal func complete() -> Bool {
        guard self.state.canComplete else { return false }

        // Set state
        self.state = .completed

        // Update elapsed time
        self.elapsed = self.duration
        self.delayElapsed = self.delay

        // Complete updates
        tween(percent: 1.0)

        // Callback event
        self.onComplete?(self)

        // Kill, if necessary
        if Defaults.autoKillCompletedTweens {
            kill()
        }

        return true
    }

    @discardableResult
    internal func kill() -> Bool {
        guard self.state.canKill else { return false }

        // Set state
        self.state = .killed

        // Remove from Tweener
        let tweener = self.tweener ?? Tweener.default
        tweener.untrack(self)

        // Callback event
        self.onKill?(self)

        return true
    }

    @discardableResult
    internal func revive() -> Bool {
        guard self.state.canRevive else { return false }

        // Set state
        self.state = .new
        
        // Update elapsed time
        self.elapsed = 0.0
        self.delayElapsed = 0.0
        
        // Add to Tweener
        let tweener = self.tweener ?? Tweener.default
        tweener.track(self)
        
        // Callback event
        self.onRevive?(self)

        return true
    }

}
