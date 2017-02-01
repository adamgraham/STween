//
//  Tweenable.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide tweening animation functionality.
public protocol Tweenable {

    associatedtype TweenProperty: TweenableProperty

    /**
     A method to create an animation of a tweenable property on `self` with a 
     given duration.
     
     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    func tween(_ property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween

    /**
     A method to create an animation of an array of tweenable properties on 
     `self` with a given duration.
     
     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    func tween(_ properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween

}

extension Tweenable {

    // MARK: Default Implementation

    /**
     A method to create an animation of a tweenable property on `self` with a
     given duration.

     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    public final func tween(_ property: TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.to([property], on: self, duration: duration, completion: completion)
    }

    /**
     A method to create an animation of an array of tweenable properties on
     `self` with a given duration.

     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    public final func tween(_ properties: [TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.to(properties, on: self, duration: duration, completion: completion)
    }

}
