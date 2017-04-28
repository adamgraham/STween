//
//  Tweenable.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide tweening animation functionality.
public protocol Tweenable {

    // MARK: Methods

    /**
     A method to create an animation on `self` animating *to* a tweenable 
     property value.

     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult
    func tween<TweenProperty: TweenableProperty>(to property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty

    /**
     A method to create an animation on `self` animating *to* an array of 
     tweenable property values.

     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult
    func tween<TweenProperty: TweenableProperty>(to properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty

    /**
     A method to create an animation on `self` animating *from* a tweenable 
     property value.

     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult
    func tween<TweenProperty: TweenableProperty>(from property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty

    /**
     A method to create an animation on `self` animating *from* an array of 
     tweenable property values.

     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult
    func tween<TweenProperty: TweenableProperty>(from properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty

}

/// :nodoc:
extension Tweenable {

    // MARK: Default Implementation

    @discardableResult
    public final func tween<TweenProperty: TweenableProperty>(to property: TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty {

            return Tweener.animate(self, to: [property],
                                   duration: duration,
                                   completion: completion)
    }

    @discardableResult
    public final func tween<TweenProperty: TweenableProperty>(to properties: [TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty {

            return Tweener.animate(self, to: properties,
                                   duration: duration,
                                   completion: completion)
    }

    @discardableResult
    public final func tween<TweenProperty: TweenableProperty>(from property: TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty {

            return Tweener.animate(self, from: [property],
                                   duration: duration,
                                   completion: completion)
    }

    @discardableResult
    public final func tween<TweenProperty: TweenableProperty>(from properties: [TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.TweenableType == Self, TweenProperty.Value == TweenProperty {

            return Tweener.animate(self, from: properties,
                                   duration: duration,
                                   completion: completion)
    }

}
