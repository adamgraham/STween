//
//  InterpolationMethod.swift
//  STween
//
//  Created by Adam Graham on 7/7/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An enum to describe the method of interpolaton that determines how a 
 value or object is converted or broken-down such that it can be
 interpolated.
 */
public enum InterpolationMethod {

    /**
     A case to denote that all values are converted to and from a
     `Swift.Double` during interpolation.
     
     - Throws: `InterpolationError.valueConversionFailure` if a value cannot 
                be converted to a `Swift.Double`.
     */
    case doubleConversion

    /**
     A case to denote a custom way of interpolating values. This should be
     used when a value, by itself, cannot be convered to a `Swift.Double`.

     For example, a `CoreGraphics.CGPoint` cannot, by itself, be converted 
     to a `Swift.Double`, so a custom method is used to interpolate its `x` and 
     `y` property individually and return a new `CoreGraphics.CGPoint` with 
     the interpolated values.
     
     **Note:** Exceptions must be handled manually.
     */
    case custom(method: InterpolationMethodSignature)

}

/**
 A typealias for the method signature of an interpolation method. 
 Interpolation methods calculate the value between a start and end value 
 at a specific point in time.

 - Parameters:
    - ease: The `Ease` used to interpolate values.
    - startValue: The start value passed to the `ease` algorithm.
    - endValue: The end value passed to the `ease` algorithm.
    - elapsed: The elapsed amount of time passed to the `ease` algorithm.
    - duration: The duration of time passed to the `ease` algorithm.

 - Throws: `InterpolationError.valueNotConvertible` if `startValue` or
           `endValue` fails to convert to an expected type.

 - Returns: The value interpolated between the `startValue` and `endValue`.
 */
public typealias InterpolationMethodSignature =
    (_ ease: Ease,
     _ startValue: InterpolationValue,
     _ endValue: InterpolationValue,
     _ elapsed: Foundation.TimeInterval,
     _ duration: Foundation.TimeInterval) throws -> InterpolationValue
