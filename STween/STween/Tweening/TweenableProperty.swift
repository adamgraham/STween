//
//  TweenableProperty.swift
//  STween
//
//  Created by Adam Graham on 1/23/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// A property that can be animated on a `Tweenable` type.
public protocol TweenableProperty: Interpolatable where Value == Self {

    associatedtype Target: Tweenable

    // MARK: Methods

    /**
     Gets the value of the property from an object.
     
     - Parameters:
        - object: The object from which the value is retrieved.

     - Returns: The value retrieved from the `object`.
     */
    func value(from object: Target) -> Self.Value

    /**
     Sets the value of the property on an object.
     
     - Parameters:
        - object: The object to which the value is applied.
     */
    func apply(to object: Target)

}
