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

    /// The type of `TweenableProperty` that can be animated on this object.
    associatedtype TweenProperty: TweenableProperty where TweenProperty.Target == Self

    /**
     Animates a tweenable property from its current value *to* a desired value.

     - Parameters:
        - properties: The properties to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: An optional closure invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult
    func tween(to properties: TweenProperty..., duration: TimeInterval, completion: Tween.Callback?) -> Tween

    /**
     Animates a tweenable property *from* a desired value to its current value.

     - Parameters:
        - properties: The properties to animate.
        - duration: The amount of seconds the animation takes to complete.
        - completion: An optional closure invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    @discardableResult
    func tween(from properties: TweenProperty..., duration: TimeInterval, completion: Tween.Callback?) -> Tween

}

/// :nodoc:
public extension Tweenable {

    // MARK: Default Implementation

    @discardableResult
    func tween(to properties: TweenProperty..., duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(tweens: properties.map { $0.animation(self) },
                                       duration: duration,
                                       completion: completion)
    }

    @discardableResult
    func tween(from properties: TweenProperty..., duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(reversedTweens: properties.map { $0.animation(self) },
                                       duration: duration,
                                       completion: completion)
    }

}
