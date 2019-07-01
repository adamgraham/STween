//
//  TweenAnimator.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// Maintains the state of a tween animation while invoking animation closures to
/// interpolate and update the properties of `Tweenable` targets.
public final class TweenAnimator<Target: Tweenable>: Tween {

    // MARK: Animation & State Properties

    /// A weak reference to the `Tweener` instance that is tracking this tween.
    internal weak var tweener: Tweener?

    /// An array of target instances to which the animated properties are applied.
    internal var targets: [Target] = []

    /// An array of animation closures that are invoked every update cycle.
    internal var tweens: [(animate: Tween.Animation, reversed: Bool)] = []

    public private(set) var state = TweenState.new

    public var ease = Defaults.ease

    // MARK: Time Properties
    
    public var delay = Defaults.delay
    /// The amount of seconds the tween has been delayed.
    private var delayElapsed: TimeInterval = 0.0

    public var duration = Defaults.duration
    public var elapsed: TimeInterval = 0.0

    // MARK: Callback Properties

    public var onUpdate: Callback?
    public var onStart: Callback?
    public var onStop: Callback?
    public var onRestart: Callback?
    public var onPause: Callback?
    public var onResume: Callback?
    public var onComplete: Callback?
    public var onKill: Callback?
    public var onRevive: Callback?

    // MARK: Initialization

    /// Initializes the animator with an array of target instances on which properties can be
    /// animated.
    /// - parameter targets: The target instances on which properties can be animated.
    internal init(targets: Target...) {
        self.targets = targets
    }

}

extension TweenAnimator {

    // MARK: Tweening

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    public func to(_ properties: Target.TweenProperty...) -> TweenAnimator<Target> {
        return to(properties)
    }

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    internal func to(_ properties: [Target.TweenProperty]) -> TweenAnimator<Target> {
        self.targets.forEach { target in
            let tweens = properties.map { ($0.animation(target), false) }
            self.tweens.append(contentsOf: tweens)
        }
        return self
    }

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    public func to<PropType: TweenableProperty>(_ properties: PropType...) -> TweenAnimator<Target>
        where PropType.Target == Target {
            return to(properties)
    }

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    internal func to<PropType: TweenableProperty>(_ properties: [PropType]) -> TweenAnimator<Target>
        where PropType.Target == Target {
            self.targets.forEach { target in
                let tweens = properties.map { ($0.animation(target), false) }
                self.tweens.append(contentsOf: tweens)
            }
            return self
    }

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    public func from(_ properties: Target.TweenProperty...) -> TweenAnimator<Target> {
        return from(properties)
    }

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    internal func from(_ properties: [Target.TweenProperty]) -> TweenAnimator<Target> {
        self.targets.forEach { target in
            let tweens = properties.map { ($0.animation(target), true) }
            self.tweens.append(contentsOf: tweens)
        }
        return self
    }

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    public func from<PropType: TweenableProperty>(_ properties: PropType...) -> TweenAnimator<Target>
        where PropType.Target == Target {
            return from(properties)
    }

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    internal func from<PropType: TweenableProperty>(_ properties: [PropType]) -> TweenAnimator<Target>
        where PropType.Target == Target {
            self.targets.forEach { target in
                let tweens = properties.map { ($0.animation(target), true) }
                self.tweens.append(contentsOf: tweens)
            }
            return self
    }

}

private extension TweenAnimator {

    // MARK: Delaying

    /// Marks the tween as delayed, starting the delay timer from zero.
    /// The tween can only be delayed if it's *not* already in a `delayed` state.
    /// - returns: `true` if the tween is successfully marked as delayed.
    func startDelay() {
        self.state = .delayed
        self.delayElapsed = 0.0
    }

    /// Updates the elapsed delay time and checks if the delay has finished.
    /// If the delay has finished, `start` will be invoked on the tween.
    /// - parameter deltaTime: The amount of seconds elapsed since the last update.
    func updateDelay(by deltaTime: TimeInterval) {
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

public extension TweenAnimator {

    // MARK: State Control

    /// Invokes all animation closures for the current time after applying an easing function.
    /// These animation closures interpolate a new value of a property and apply it back to the
    /// target instance(s).
    /// - parameter percent: The percentage of the tween's elapsed time in relation to its duration.
    private func tween(percent: TimeInterval) {
        let time = self.ease.function(percent)
        let timeReversed = self.ease.function(1.0 - percent)

        self.tweens.forEach { tween in
            if tween.reversed { tween.animate(timeReversed) }
            else { tween.animate(time) }
        }
    }

    @discardableResult
    func update(by deltaTime: TimeInterval) -> Bool {
        guard self.state != .delayed else {
            updateDelay(by: deltaTime)
            return true
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

    @discardableResult
    func start() -> Bool {
        guard self.state.canStart else { return false }
        guard self.delayElapsed >= self.delay else {
            startDelay()
            return true
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
    func stop() -> Bool {
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
    func restart() -> Bool {
        guard self.state.canRestart else { return false }

        stop()
        self.onRestart?(self)
        start()

        return true
    }

    @discardableResult
    func pause() -> Bool {
        guard self.state.canPause else { return false }

        // Set state
        self.state = .paused

        // Callback event
        self.onPause?(self)

        return true
    }

    @discardableResult
    func resume() -> Bool {
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
    func complete() -> Bool {
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
    func kill() -> Bool {
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
    func revive() -> Bool {
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
