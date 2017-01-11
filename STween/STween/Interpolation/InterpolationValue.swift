//
//  InterpolationValue.swift
//  STween
//
//  Created by Adam Graham on 7/7/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to define a type that can be interpolated.

}

// MARK: - Helpers

extension InterpolationValue {
public protocol InterpolationValue: Serializable, Deserializable {

    /**
     A method to calculate the value between `self` and an end value at a 
     specific point in time.
     
     - Parameters:
        - ease: The `Ease` used to interpolate values.
        - endValue: The end value passed to the `ease` algorithm.
        - elapsed: The elapsed amount of time passed to the `ease` algorithm.
        - duration: The duration of time passed to the `ease` algorithm.

     - Throws: `InterpolationError.valueNotConvertible` if `self` or `endValue` 
                fails to convert to an expected type.

     - Returns: The value interpolated between `self` and `endValue`.
     */
    internal final func interpolate(with ease: Ease,
                                    endValue: InterpolationValue,
                                    elapsed: Foundation.TimeInterval,
                                    duration: Foundation.TimeInterval) throws -> InterpolationValue {

        return try Self.interpolate(with: ease,
                                    startValue: self,
                                    endValue: endValue,
                                    elapsed: elapsed,
                                    duration: duration)
    }

}

// MARK: - Conformance

extension Swift.UInt: InterpolationValue {

}

extension Swift.Int: InterpolationValue {

}

extension Swift.Double: InterpolationValue {

}

extension Swift.Float: InterpolationValue {

}

extension CoreGraphics.CGFloat: InterpolationValue {

}

extension CoreGraphics.CGPoint: InterpolationValue {

}

extension CoreGraphics.CGSize: InterpolationValue {

}

extension CoreGraphics.CGRect: InterpolationValue {
    
}
