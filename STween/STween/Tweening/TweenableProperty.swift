//
//  TweenableProperty.swift
//  STween
//
//  Created by Adam Graham on 1/23/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// A property that can be animated on a `Tweenable` type.
public protocol TweenableProperty {

    /// The `Tweenable` type of which the property can be retrieved from and applied to.
    associatedtype Target: Tweenable

    /// A closure to return the tween animation for an instance of the target. The tween
    /// animation is invoked every update cycle to interpolate a new value of the property and
    /// apply it back to the target instance.
    var animation: ((Target) -> Tween.Animation) { get }

}
