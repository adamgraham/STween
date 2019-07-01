//
//  Tweenable.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A type that can animate tweenable properties on itself.
public protocol Tweenable {

    /// The type of `TweenableProperty` that can be animated on this object.
    associatedtype TweenProperty: TweenableProperty where TweenProperty.Target == Self

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The `Tween` control for the animation.
    @discardableResult
    func tween(to properties: TweenProperty...) -> Tween

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The `Tween` control for the animation.
    @discardableResult
    func tween(from properties: TweenProperty...) -> Tween

}

public extension Tweenable {

    // MARK: Default Implementation

    @discardableResult
    func tween(to properties: TweenProperty...) -> Tween {
        return Tweener.default.animate(self).to(properties)
    }

    @discardableResult
    func tween(from properties: TweenProperty...) -> Tween {
        return Tweener.default.animate(self).from(properties)
    }

}
