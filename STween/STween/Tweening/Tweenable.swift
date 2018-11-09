//
//  Tweenable.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A type that can animate tweenable properties on itself.
public protocol Tweenable {

    // MARK: Methods

    /**
     A method to animate *to* a tweenable property value of `self`.

     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<TweenProperty: TweenableProperty>(
        to property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.Target == Self

    /**
     A method to animate *to* an array of tweenable property values on `self`.

     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<TweenProperty: TweenableProperty>(
        to properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.Target == Self

    /**
     A method to animate *from* a tweenable property value of `self`.

     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<TweenProperty: TweenableProperty>(
        from property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.Target == Self

    /**
     A method to animate *from* an array of tweenable property values on `self`.

     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<TweenProperty: TweenableProperty>(
        from properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.Target == Self

}

/// :nodoc:
extension Tweenable {

    // MARK: Default Implementation

    @discardableResult public func tween<TweenProperty: TweenableProperty>(
        to property: TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.Target == Self {

            return Tweener.default.animate(self, to: [property],
                                           duration: duration,
                                           completion: completion)
    }

    @discardableResult public func tween<TweenProperty: TweenableProperty>(
        to properties: [TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.Target == Self {

            return Tweener.default.animate(self, to: properties,
                                           duration: duration,
                                           completion: completion)
    }

    @discardableResult public func tween<TweenProperty: TweenableProperty>(
        from property: TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.Target == Self {

            return Tweener.default.animate(self, from: [property],
                                           duration: duration,
                                           completion: completion)
    }

    @discardableResult public func tween<TweenProperty: TweenableProperty>(
        from properties: [TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween
        where TweenProperty.Target == Self {

            return Tweener.default.animate(self, from: properties,
                                           duration: duration,
                                           completion: completion)
    }

}
