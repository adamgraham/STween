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
    fileprivate static var tweens = [Tween]()

    /// An array of every instantiated `Tween` that is waiting to be started.
    fileprivate static var queuedTweens = [Tween]()

    /// The timer object used to start any queued `Tween`s every frame.
    fileprivate static let queueTimer = Timer.scheduledTimer(
        timeInterval: FrameRate.targetFrameDuration,
        target: Tweener.self,
        selector: #selector(Tweener.startQueuedTweens),
        userInfo: nil,
        repeats: true
    )

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
    @discardableResult public static func to<Target: Tweenable>(_ properties: [Target.TweenProperty], on target: Target, duration: TimeInterval, completion: Callback? = nil) -> Tween {
        let tween = TweenAnimation(target: target, properties: properties, duration: duration)
        tween.reversed = false
        tween.callback(set: .complete, value: completion)

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
    @discardableResult public static func from<Target: Tweenable>(_ properties: [Target.TweenProperty], on target: Target, duration: TimeInterval, completion: Callback? = nil) -> Tween {
        let tween = TweenAnimation(target: target, properties: properties, duration: duration)
        tween.reversed = true
        tween.callback(set: .complete, value: completion)

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

        self.queuedTweens.append(tween)
    }

    /**
     A method to start all queued tweens by invoking 
     `TweenStateChange.start` on each one. This puts the tween in an 
     active state and removes it from the list of queued tweens.
     */
    @objc internal static func startQueuedTweens() {
        for tween in self.queuedTweens {
            tween.invoke(.start)
        }

        self.queuedTweens.removeAll()
    }

}

extension Tweener {

    // MARK: Global State Control

    /**
     A method to invoke a change of state on all tracked tweens. An optional
     callback will be invoked after all the tweens have changed state.

     - Parameters:
        - stateChange: The change of state to be invoked on each tween.
        - completion: An optional callback invoked after all the tweens have
                      changed state.
     */
    public static func invokeStateChangeOnAllTweens(_ stateChange: TweenStateChange, completion: Callback? = nil) {
        for tween in self.tweens {
            tween.invoke(stateChange)
        }

        completion?()
    }

}
