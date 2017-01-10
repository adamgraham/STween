//
//  Interpolatable.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide interpolation functionality.
public protocol Interpolatable {

    /**
     A class method to calculate the value between a start and end value at a 
     specific point in time.
     
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
    static func interpolate(with ease: Ease,
                           startValue: InterpolationValue,
                             endValue: InterpolationValue,
                              elapsed: Foundation.TimeInterval,
                             duration: Foundation.TimeInterval) throws -> InterpolationValue

}

extension Interpolatable where Self: Arithmetic, Self: InterpolationValue {

    public static func interpolate(with ease: Ease,
                                   startValue: InterpolationValue,
                                   endValue: InterpolationValue,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) throws -> InterpolationValue {

        guard let _startValue = startValue as? Self else {
            throw InterpolationError.valueNotConvertible(value: startValue, to: Self.self)
        }

        guard let _endValue = endValue as? Self else {
            throw InterpolationError.valueNotConvertible(value: endValue, to: Self.self)
        }

        let value: Self = ease.interpolate(startValue: _startValue,
                                           endValue: _endValue,
                                           elapsed: elapsed,
                                           duration: duration)
        return value
    }

}

// MARK: - Conformance

extension Swift.UInt: Interpolatable {

}

extension Swift.Int: Interpolatable {

}

extension Swift.Double: Interpolatable {

}

extension Swift.Float: Interpolatable {

}

extension CoreGraphics.CGFloat: Interpolatable {

}

extension CoreGraphics.CGPoint: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: InterpolationValue,
                                   endValue: InterpolationValue,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) throws -> InterpolationValue {

        guard let _startValue = startValue as? CoreGraphics.CGPoint else {
            throw InterpolationError.valueNotConvertible(value: startValue, to: CoreGraphics.CGPoint.self)
        }

        guard let _endValue = endValue as? CoreGraphics.CGPoint else {
            throw InterpolationError.valueNotConvertible(value: endValue, to: CoreGraphics.CGPoint.self)
        }

        let interpolate: (CoreGraphics.CGFloat, CoreGraphics.CGFloat) -> CoreGraphics.CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let x = interpolate(_startValue.x, _endValue.x)
        let y = interpolate(_startValue.y, _endValue.y)

        return CoreGraphics.CGPoint(x: x, y: y)
    }

}

extension CoreGraphics.CGSize: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: InterpolationValue,
                                   endValue: InterpolationValue,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) throws -> InterpolationValue {

        guard let _startValue = startValue as? CoreGraphics.CGSize else {
            throw InterpolationError.valueNotConvertible(value: startValue, to: CoreGraphics.CGSize.self)
        }

        guard let _endValue = endValue as? CoreGraphics.CGSize else {
            throw InterpolationError.valueNotConvertible(value: endValue, to: CoreGraphics.CGSize.self)
        }

        let interpolate: (CoreGraphics.CGFloat, CoreGraphics.CGFloat) -> CoreGraphics.CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let width = interpolate(_startValue.width, _endValue.width)
        let height = interpolate(_startValue.height, _endValue.height)

        return CoreGraphics.CGSize(width: width, height: height)
    }
}

extension CoreGraphics.CGRect: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: InterpolationValue,
                                   endValue: InterpolationValue,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) throws -> InterpolationValue {

        guard let _startValue = startValue as? CoreGraphics.CGRect else {
            throw InterpolationError.valueNotConvertible(value: startValue, to: CoreGraphics.CGRect.self)
        }

        guard let _endValue = endValue as? CoreGraphics.CGRect else {
            throw InterpolationError.valueNotConvertible(value: endValue, to: CoreGraphics.CGRect.self)
        }

        let interpolate: (CoreGraphics.CGFloat, CoreGraphics.CGFloat) -> CoreGraphics.CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let x = interpolate(_startValue.origin.x, _endValue.origin.x)
        let y = interpolate(_startValue.origin.y, _endValue.origin.y)
        let width = interpolate(_startValue.size.width, _endValue.size.width)
        let height = interpolate(_startValue.size.height, _endValue.size.height)

        return CoreGraphics.CGRect(x: x, y: y, width: width, height: height)
    }

}
