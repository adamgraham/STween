//
//  Tweenable.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// A type that can animate tweenable properties on itself.
public protocol Tweenable {

    // MARK: Methods

    /**
     Animates a tweenable property from its current value *to* the desired value.

     - Parameters:
        - property: The property to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<TweenProperty: TweenableProperty>(
        to property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.Target == Self

    /**
     Animates an array of tweenable properties from its current values *to* the desired values.

     - Parameters:
        - properties: The array of properties to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<TweenProperty: TweenableProperty>(
        to properties: [TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.Target == Self

    /**
     Animates a tweenable property *from* the desired value to its current value.

     - Parameters:
        - property: The property to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<TweenProperty: TweenableProperty>(
        from property: TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween
        where TweenProperty.Target == Self

    /**
     Animates an array of tweenable properties *from* the desired values to its current values.

     - Parameters:
        - properties: The array of properties to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

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
