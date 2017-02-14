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

    // MARK: Tweening Methods

    /**
     A method to create an animation of `self` to a tweenable property with a
     given duration.
     
     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween(to property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween

    /**
     A method to create an animation of `self` to an array of tweenable 
     properties with a given duration.
     
     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween(to properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween

    /**
     A method to create an animation of `self` from a tweenable property with a
     given duration.

     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween(from property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween

    /**
     A method to create an animation of `self` from an array of tweenable
     properties with a given duration.

     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween(from properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween

    // MARK: Property Methods

    /**
     A method to retrieve the value on `self` of a tweenable property.
     
     - Parameters:
        - property: The property of which a value on `self` is to be retrieved.
     
     - Returns: The value on `self` of the tweenable `property`.
     */
    func value(of property: TweenProperty) -> TweenProperty

    /**
     A method to apply the value of a tweenable property on `self`.
     
     - Parameters:
        - property: The property to be applied to `self`.
     */
    func apply(_ property: TweenProperty)

}

extension Tweenable {

    // MARK: Default Implementation

    @discardableResult public final func tween(to property: TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.animate(self, to: [property], duration: duration, completion: completion)
    }

    @discardableResult public final func tween(to properties: [TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.animate(self, to: properties, duration: duration, completion: completion)
    }

    @discardableResult public final func tween(from property: TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.animate(self, from: [property], duration: duration, completion: completion)
    }

    @discardableResult public final func tween(from properties: [TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.animate(self, from: properties, duration: duration, completion: completion)
    }

}
