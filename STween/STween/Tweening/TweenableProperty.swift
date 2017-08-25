//
//  TweenableProperty.swift
//  STween
//
//  Created by Adam Graham on 1/23/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// A protocol to describe a tweenable property.
public protocol TweenableProperty: Interpolatable where Value == Self {

    associatedtype Target: Tweenable

    // MARK: Methods

    /**
     A method to retrieve the value of `self` from an object.
     
     - Parameters:
        - object: The object from which a value will be retrieved.

     - Returns: The value of `self` from the `object`.
     */
    func value(from object: Target) -> Self.Value

    /**
     A method to apply the value of `self` to an object.
     
     - Parameters:
        - object: The object to which a value will be applied.
     */
    func apply(to object: Target)

}
