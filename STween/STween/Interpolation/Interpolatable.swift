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

     - Returns: The value interpolated between the start and end value.
     */
    static func interpolate(with ease: Ease,
                            startValue: Self, endValue: Self,
                            elapsed: Foundation.TimeInterval,
                            duration: Foundation.TimeInterval) -> Self


    /**
     A class method to calculate the value between a set of values at a
     specific point in time.

     - Parameters:
        - ease: The `Ease` used to interpolate values.
        - values: The start and end value passed to the `ease` algorithm.
        - elapsed: The elapsed amount of time passed to the `ease` algorithm.
        - duration: The duration of time passed to the `ease` algorithm.

     - Returns: The value interpolated between `values.start` and `values.end`.
     */
    static func interpolate(with ease: Ease,
                            values: InterpolationValues<Self>,
                            elapsed: Foundation.TimeInterval,
                            duration: Foundation.TimeInterval) -> Self

}

// MARK: - Default Implementation

extension Interpolatable {

    public static func interpolate(with ease: Ease,
                                   values: InterpolationValues<Self>,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> Self {

        return Self.interpolate(with: ease, startValue: values.start, endValue: values.end,
                                elapsed: elapsed, duration: duration)
    }

}

// MARK: - Conformance

extension Swift.UInt: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: Swift.UInt, endValue: Swift.UInt,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> Swift.UInt {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension Swift.Int: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: Swift.Int, endValue: Swift.Int,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> Swift.Int {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension Swift.Double: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: Swift.Double, endValue: Swift.Double,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> Swift.Double {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension Swift.Float: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: Swift.Float, endValue: Swift.Float,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> Swift.Float {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension CoreGraphics.CGFloat: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CoreGraphics.CGFloat, endValue: CoreGraphics.CGFloat,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> CoreGraphics.CGFloat {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension CoreGraphics.CGPoint: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CoreGraphics.CGPoint, endValue: CoreGraphics.CGPoint,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> CoreGraphics.CGPoint {

        let interpolate: (CoreGraphics.CGFloat, CoreGraphics.CGFloat) -> CoreGraphics.CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let x = interpolate(startValue.x, endValue.x)
        let y = interpolate(startValue.y, endValue.y)

        return CoreGraphics.CGPoint(x: x, y: y)
    }

}

extension CoreGraphics.CGSize: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CoreGraphics.CGSize, endValue: CoreGraphics.CGSize,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> CoreGraphics.CGSize {

        let interpolate: (CoreGraphics.CGFloat, CoreGraphics.CGFloat) -> CoreGraphics.CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let width = interpolate(startValue.width, endValue.width)
        let height = interpolate(startValue.height, endValue.height)

        return CoreGraphics.CGSize(width: width, height: height)
    }

}

extension CoreGraphics.CGRect: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CoreGraphics.CGRect, endValue: CoreGraphics.CGRect,
                                   elapsed: Foundation.TimeInterval,
                                   duration: Foundation.TimeInterval) -> CoreGraphics.CGRect {

        let interpolate: (CoreGraphics.CGFloat, CoreGraphics.CGFloat) -> CoreGraphics.CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let x = interpolate(startValue.origin.x, endValue.origin.x)
        let y = interpolate(startValue.origin.y, endValue.origin.y)
        let width = interpolate(startValue.size.width, endValue.size.width)
        let height = interpolate(startValue.size.height, endValue.size.height)
        
        return CoreGraphics.CGRect(x: x, y: y, width: width, height: height)
    }
    
}
