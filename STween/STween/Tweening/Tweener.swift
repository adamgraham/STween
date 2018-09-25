//
//  Tweener.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A static factory class to create, queue, and manage `Tween` animations.
public final class Tweener {

    // Prevent instantiation of the class.
    private init() {}

    // MARK: Properties

    /// An array of every instantiated `Tween`.
    private static var tweens = [Tween]()

    /// An array of every instantiated `Tween` that is waiting to be started.
    private static var queuedTweens = [Tween]()

    /// The timer object used to start any queued `Tween`s.
    private static let queueTimer = CADisplayLink(target: Tweener.self, selector: #selector(Tweener.startQueuedTweens))

    /// The state of the queue timer being active.
    private static var isQueueTimerRunning = false

}

extension Tweener {

    // MARK: Factory Creation

    /**
     A method to instantiate a `Tween` that animates an array of properties on 
     a `Tweenable` target *to* their desired values from their current values, 
     with a given duration. The created tween will automatically be queued to
     start if `Defaults.autoStartTweens` is `true`.
     
     - Parameters:
        - target: The object or data structure on which properties are animated.
        - properties: The array of properties to be animated on the `target`.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult public static func animate<TargetProperty: TweenableProperty>(
        _ target: TargetProperty.Target, to properties: [TargetProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween {

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
     A method to instantiate a `Tween` that animates an array of properties on
     a `Tweenable` target *from* their desired values to their current values, 
     with a given duration. The created tween will automatically be queued to
     start if `Defaults.autoStartTweens` is `true`.
     
     - Parameters:
        - target: The object or data structure on which properties are animated.
        - properties: The array of properties to be animated on the `target`.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    @discardableResult public static func animate<TargetProperty: TweenableProperty>(
        _ target: TargetProperty.Target, from properties: [TargetProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween {

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
    public static var count: Int {
        return self.tweens.count
    }

    /**
     A method to add a tween to the list of tracked tweens.
     
     - Parameters:
        - tween: The tween to be added to the list of tracked tweens.
     */
    internal static func add(_ tween: Tween) {
        guard self.tweens.index(where: { $0 === tween }) == nil else {
            return
        }

        self.tweens.append(tween)
    }

    /**
     A method to remove a tween from the list of tracked tweens.
     
     - Parameters:
        - tween: The tween to be removed from the list of tracked tweens.
     */
    internal static func remove(_ tween: Tween) {
        if let index = self.tweens.index(where: { $0 === tween }),
            index >= 0 && index < self.tweens.count {
                self.tweens.remove(at: index)
        }

        if let index = self.queuedTweens.index(where: { $0 === tween }),
            index >= 0 && index < self.queuedTweens.count {
                self.queuedTweens.remove(at: index)
        }
    }

    /**
     A method to check if a tween is in the list of tracked tweens.

     - Parameters:
        - tween: The tween to be checked if in the list of tracked tweens.
     
     - Returns: `true` if the `tween` is in the list of tracked tweens.
     */
    internal static func contains(_ tween: Tween) -> Bool {
        return self.tweens.contains(where: { $0 === tween })
    }

}

extension Tweener {

    // MARK: Queueing

    /// The number of tweens currently queued to start.
    internal static var queuedCount: Int {
        return self.queuedTweens.count
    }

    /**
     A method to queue a tween to be started. Tweens are started one frame 
     after being created in order for all necessarily properties to be applied 
     before starting.
     
     - Parameters:
        - tween: The tween to be queued for start.
     */
    internal static func queue(_ tween: Tween) {
        guard self.queuedTweens.index(where: { $0 === tween }) == nil else {
            return
        }

        if !self.isQueueTimerRunning {
            self.queueTimer.add(to: .main, forMode: .defaultRunLoopMode)
            self.isQueueTimerRunning = true
        }

        self.queuedTweens.append(tween)
    }

    /**
     A method to start all queued tweens by invoking `start` on each one.
     This puts the tween in an active state and removes it from the list of
     queued tweens.
     */
    @objc internal static func startQueuedTweens() {
        guard self.isQueueTimerRunning else {
            return
        }

        self.queuedTweens.forEach {
            $0.start()
        }

        self.queuedTweens.removeAll()
    }

}

extension Tweener {

    // MARK: Global State Control

    /**
     A method to kill all currently tracked tweens.
     */
    public static func killAll() {
        self.tweens.forEach {
            $0.kill()
        }
    }

}
