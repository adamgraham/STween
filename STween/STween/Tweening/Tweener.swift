//
//  Tweener.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation
import QuartzCore

/// A singleton, factory class to create, queue, and manage `Tween` animations.
public final class Tweener {

    // MARK: Instance

    /// The default, single instance of `Tweener`.
    public static let `default` = Tweener()

    // Prevent outside instantiation of the singleton.
    private init() {}

    // MARK: Properties

    /// An array of every instantiated tween.
    private var tweens = [Tween]() {
        didSet {
            self.tweenTimer.isPaused = self.tweens.isEmpty
        }
    }

    /// The timer used to update all active tweens.
    private lazy var tweenTimer: CADisplayLink = {
        let selector = #selector(self.startQueuedTweens)
        let timer = CADisplayLink(target: self, selector: selector)
        timer.add(to: .main, forMode: RunLoop.Mode.default)
        timer.isPaused = true
        return timer
    }()

    /// An array of every instantiated tween that is waiting to be started.
    private var queuedTweens = [Tween]() {
        didSet {
            self.queueTimer.isPaused = self.queuedTweens.isEmpty
        }
    }

    /// The timer used to start any queued tweens.
    private lazy var queueTimer: CADisplayLink = {
        let selector = #selector(self.startQueuedTweens)
        let timer = CADisplayLink(target: self, selector: selector)
        timer.add(to: .main, forMode: RunLoop.Mode.default)
        timer.isPaused = true
        return timer
    }()

}

extension Tweener {

    // MARK: Factory Creation

    /**
     Creates a `Tween` that animates an array of properties on a `Tweenable` type *to*
     desired values from its current values over a set duration.

     The created tween will automatically be queued to start if
     `Defaults.autoStartTweens` is `true`.
     
     - Parameters:
        - target: The object on which properties are animated.
        - properties: The array of properties to be animated.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult public func animate<Property: TweenableProperty>(
        _ target: Property.Target, to properties: [Property],
        duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {

        let tween = TweenAnimation(target: target, properties: properties, duration: duration)
        tween.reversed = false
        tween.onComplete = completion

        add(tween)

        if Defaults.autoStartTweens {
            queue(tween)
        }

        return tween
    }

    /**
     Creates a `Tween` that animates an array of properties on a `Tweenable` type *from*
     desired values to its current values over a set duration.

     The created tween will automatically be queued to start if
     `Defaults.autoStartTweens` is `true`.
     
     - Parameters:
        - target: The object on which properties are animated.
        - properties: The array of properties to be animated.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).
     
     - Returns: The `Tween` control for the animation.
     */
    @discardableResult public func animate<Property: TweenableProperty>(
        _ target: Property.Target, from properties: [Property],
        duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {

        let tween = TweenAnimation(target: target, properties: properties, duration: duration)
        tween.reversed = true
        tween.onComplete = completion

        add(tween)

        if Defaults.autoStartTweens {
            queue(tween)
        }

        return tween
    }

}

extension Tweener {

    // MARK: Tracking

    /// The number of tweens crrently being tracked.
    public var count: Int {
        return self.tweens.count
    }

    /**
     Adds a tween to the list of tracked tweens.
     
     - Parameters:
        - tween: The `Tween` to be added.
     */
    internal func add(_ tween: Tween) {
        guard self.tweens.firstIndex(where: { $0 === tween }) == nil else {
            return
        }

        self.tweens.append(tween)
    }

    /**
     Removes a tween from the list of tracked tweens.
     
     - Parameters:
        - tween: The `Tween` to be removed.
     */
    internal func remove(_ tween: Tween) {
        if let index = self.tweens.firstIndex(where: { $0 === tween }),
            index >= 0 && index < self.tweens.count {
                self.tweens.remove(at: index)
        }

        if let index = self.queuedTweens.firstIndex(where: { $0 === tween }),
            index >= 0 && index < self.queuedTweens.count {
                self.queuedTweens.remove(at: index)
        }
    }

    /**
     Checks if a tween is being tracked.

     - Parameters:
        - tween: The `Tween` to be checked.
     
     - Returns: `true` if the tween is contained in the list of tracked tweens.
     */
    internal func contains(_ tween: Tween) -> Bool {
        return self.tweens.contains(where: { $0 === tween })
    }

}

extension Tweener {

    // MARK: Queueing

    /// The number of tweens currently queued to start.
    internal var queuedCount: Int {
        return self.queuedTweens.count
    }

    /**
     Queues a tween to be started.

     Tweens are started one frame after being created in order for all necessarily properties
     to be applied before starting.
     
     - Parameters:
        - tween: The `Tween` to be queued.
     */
    internal func queue(_ tween: Tween) {
        guard self.queuedTweens.firstIndex(where: { $0 === tween }) == nil else {
            return
        }

        self.queuedTweens.append(tween)
    }

    /**
     Starts all queued tweens by invoking `start` on each one – putting the tweens in an
     `active` state and removing them from the list of queued tweens.
     */
    @objc internal func startQueuedTweens() {
        self.queuedTweens.forEach {
            $0.start()
        }

        self.queuedTweens.removeAll()
    }

}

extension Tweener {

    // MARK: Global State Control

    /// Invokes `update` on all currently tracked tweens.
    public func updateAll(by deltaTime: TimeInterval) {
        self.tweens.forEach {
            $0.update(by: deltaTime)
        }
    }

    /// Invokes `start` on all currently tracked tweens.
    public func startAll() {
        self.tweens.forEach {
            $0.start()
        }
    }

    /// Invokes `stop` on all currently tracked tweens.
    public func stopAll() {
        self.tweens.forEach {
            $0.stop()
        }
    }

    /// Invokes `stop` on all currently tracked tweens.
    public func restartAll() {
        self.tweens.forEach {
            $0.restart()
        }
    }

    /// Invokes `pause` on all currently tracked tweens.
    public func pauseAll() {
        self.tweens.forEach {
            $0.pause()
        }
    }

    /// Invokes `resume` on all currently tracked tweens.
    public func resumeAll() {
        self.tweens.forEach {
            $0.resume()
        }
    }

    /// Invokes `complete` on all currently tracked tweens.
    public func completeAll() {
        self.tweens.forEach {
            $0.complete()
        }
    }

    /// Invokes `kill` on all currently tracked tweens.
    public func killAll() {
        self.tweens.forEach {
            $0.kill()
        }
    }

}
