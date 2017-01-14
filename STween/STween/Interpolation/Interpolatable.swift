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
                            elapsed: TimeInterval,
                            duration: TimeInterval) -> Self


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
                            elapsed: TimeInterval,
                            duration: TimeInterval) -> Self

}

// MARK: - Default Implementation

extension Interpolatable {

    public static func interpolate(with ease: Ease,
                                   values: InterpolationValues<Self>,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> Self {

        return Self.interpolate(with: ease, startValue: values.start, endValue: values.end,
                                elapsed: elapsed, duration: duration)
    }

}

// MARK: - Conformance

extension UInt: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: UInt, endValue: UInt,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> UInt {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension Int: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: Int, endValue: Int,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> Int {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension Double: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: Double, endValue: Double,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> Double {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension Float: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: Float, endValue: Float,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> Float {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension CGFloat: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGFloat, endValue: CGFloat,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> CGFloat {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}

extension CGPoint: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGPoint, endValue: CGPoint,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> CGPoint {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let x = interpolate(startValue.x, endValue.x)
        let y = interpolate(startValue.y, endValue.y)

        return CGPoint(x: x, y: y)
    }

}

extension CGSize: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGSize, endValue: CGSize,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> CGSize {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let width = interpolate(startValue.width, endValue.width)
        let height = interpolate(startValue.height, endValue.height)

        return CGSize(width: width, height: height)
    }

}

extension CGRect: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGRect, endValue: CGRect,
                                   elapsed: TimeInterval,
                                   duration: TimeInterval) -> CGRect {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: elapsed, duration: duration)
        }

        let x = interpolate(startValue.origin.x, endValue.origin.x)
        let y = interpolate(startValue.origin.y, endValue.origin.y)
        let width = interpolate(startValue.size.width, endValue.size.width)
        let height = interpolate(startValue.size.height, endValue.size.height)
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}
