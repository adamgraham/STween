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

    /**
     Animates a tweenable property from its current value *to* a desired value.

     - Parameters:
        - property: The property to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<Property: TweenableProperty>(
        to property: Property, duration: TimeInterval, completion: Tween.Callback?) -> Tween
        where Property.Target == Self

    /**
     Animates an array of tweenable properties from its current values *to* desired values.

     - Parameters:
        - properties: The array of properties to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<Property: TweenableProperty>(
        to properties: [Property], duration: TimeInterval, completion: Tween.Callback?) -> Tween
        where Property.Target == Self

    /**
     Animates a tweenable property *from* a desired value to its current value.

     - Parameters:
        - property: The property to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<Property: TweenableProperty>(
        from property: Property, duration: TimeInterval, completion: Tween.Callback?) -> Tween
        where Property.Target == Self

    /**
     Animates an array of tweenable properties *from* desired values to its current values.

     - Parameters:
        - properties: The array of properties to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: The callback invoked when the animation is finished (optional).

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult func tween<Property: TweenableProperty>(
        from properties: [Property], duration: TimeInterval, completion: Tween.Callback?) -> Tween
        where Property.Target == Self

}

/// :nodoc:
extension Tweenable {

    // MARK: Default Implementation

    @discardableResult public func tween<Property: TweenableProperty>(
        to property: Property, duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween
        where Property.Target == Self {

            return Tweener.default.animate(self, to: [property],
                                           duration: duration,
                                           completion: completion)
    }

    @discardableResult public func tween<Property: TweenableProperty>(
        to properties: [Property], duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween
        where Property.Target == Self {

            return Tweener.default.animate(self, to: properties,
                                           duration: duration,
                                           completion: completion)
    }

    @discardableResult public func tween<Property: TweenableProperty>(
        from property: Property, duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween
        where Property.Target == Self {

            return Tweener.default.animate(self, from: [property],
                                           duration: duration,
                                           completion: completion)
    }

    @discardableResult public func tween<Property: TweenableProperty>(
        from properties: [Property], duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween
        where Property.Target == Self {

            return Tweener.default.animate(self, from: properties,
                                           duration: duration,
                                           completion: completion)
    }

}
