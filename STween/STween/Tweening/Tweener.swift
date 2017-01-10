//
//  Tweener.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

public final class Tweener {

    // Prevent instantiation of the class.
    private init() {}

    // MARK: Properties

    /// An array of every instantiated `Tween`.
    fileprivate static var tweens = [Tween]()

    /// An array of every instantiated `Tween` that is waiting to be started.
    fileprivate static var queuedTweens = [Tween]()

    /// The timer object used to start any queued `Tween`s every frame.
    fileprivate static let queueTimer = Foundation.Timer.scheduledTimer(
        timeInterval: FrameRate.targetFrameDuration,
        target: Tweener.self,
        selector: #selector(Tweener.startQueuedTweens),
        userInfo: nil,
        repeats: true
    )

}

// MARK: - Factory Creation

extension Tweener {

    /**
     A method to instantiate a `Tween` that animates an array of properties on 
     a `Tweenable` target *to* their desired values from their current values, 
     with a given duration. The created tween will automatically be queued to
     start if `Defaults.autoStartTweens` is `true`.
     
     - Parameters:
        - target: The object or data structure that properties are animated on.
        - properties: The array of properties to be animated on the `target`.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    public static func to<Target: Tweenable>(target: Target, properties: [Target.PropertyType], duration: Foundation.TimeInterval, completion: Callback? = nil) -> Tween {
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
        - target: The object or data structure that properties are animated on.
        - properties: The array of properties to be animated on the `target`.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    public static func from<Target: Tweenable>(target: Target, properties: [Target.PropertyType], duration: Foundation.TimeInterval, completion: Callback? = nil) -> Tween {
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

// MARK: - Tracking

extension Tweener {

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
        guard let index = self.tweens.index(where: { $0 === tween }),
            index >= 0 && index < self.tweens.count else {
                return
        }

        self.tweens.remove(at: index)
    }

}

// MARK: - Queueing

extension Tweener {

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

// MARK: - Global State Control

extension Tweener {

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
