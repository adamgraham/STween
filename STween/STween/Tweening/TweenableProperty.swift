//
//  TweenableProperty.swift
//  STween
//
//  Created by Adam Graham on 1/23/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// A protocol to describe a tweenable property.
public protocol TweenableProperty: Interpolatable {

    typealias Value = Self

    /**
     A method to retrieve the value of `self` from a tweenable object.
     
     - Parameters:
        - object: The tweenable object from which a value will be retrieved.
     
     - Throws: `TweenError.objectNotConvertible` if the `object` cannot be casted 
                to an expected type.

     - Returns: The value retrieved on the tweenable `object` for the property `self`.
     */
    func value<T: Tweenable>(from object: T) throws -> Self

    /**
     A method to apply the value of `self` to a tweenable object.

     - Parameters:
        - object: The tweenable object to which `self` will be applied.

     - Throws: `TweenError.objectNotConvertible` if the `object` cannot be casted 
                to an expected type.
     */
    func apply<T: Tweenable>(to object: T) throws

}
