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
                            elapsed: TimeInterval, duration: TimeInterval) -> Self


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
                            elapsed: TimeInterval, duration: TimeInterval) -> Self

}

// MARK: - Default Implementation

extension Interpolatable {

    public static func interpolate(with ease: Ease,
                                   values: InterpolationValues<Self>,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        return Self.interpolate(with: ease, startValue: values.start, endValue: values.end,
                                elapsed: elapsed, duration: duration)
    }

}

extension Interpolatable where Self: UnsignedInteger {

    public static func interpolate(with ease: Ease,
                                   startValue: Self, endValue: Self,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        let start = Double(unsignedInteger: startValue)
        let end = Double(unsignedInteger: endValue)
        let value = ease.interpolate(startValue: start, endValue: end,
                                     elapsed: elapsed, duration: duration)

        return Self(UIntMax(value))
    }
    
}

extension Interpolatable where Self: SignedInteger {

    public static func interpolate(with ease: Ease,
                                   startValue: Self, endValue: Self,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        let start = Double(signedInteger: startValue)
        let end = Double(signedInteger: endValue)
        let value = ease.interpolate(startValue: start, endValue: end,
                                     elapsed: elapsed, duration: duration)

        return Self(IntMax(value))
    }
    
}

extension Interpolatable where Self: FloatingPoint {

    public static func interpolate(with ease: Ease,
                                   startValue: Self, endValue: Self,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        return ease.interpolate(startValue: startValue, endValue: endValue,
                                elapsed: Self(elapsed), duration: Self(duration))
    }

}

// MARK: - Conformance

extension UInt: Interpolatable {}
extension UInt8: Interpolatable {}
extension UInt16: Interpolatable {}
extension UInt32: Interpolatable {}
extension UInt64: Interpolatable {}

extension Int: Interpolatable {}
extension Int8: Interpolatable {}
extension Int16: Interpolatable {}
extension Int32: Interpolatable {}
extension Int64: Interpolatable {}

extension Float32: Interpolatable {}
extension Float64: Interpolatable {}
extension Float80: Interpolatable {}

extension CGFloat: Interpolatable {}
extension CGPoint: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGPoint, endValue: CGPoint,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGPoint {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(startValue.x, endValue.x)
        let y = interpolate(startValue.y, endValue.y)

        return CGPoint(x: x, y: y)
    }

}

extension CGSize: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGSize, endValue: CGSize,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGSize {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let width = interpolate(startValue.width, endValue.width)
        let height = interpolate(startValue.height, endValue.height)

        return CGSize(width: width, height: height)
    }

}

extension CGRect: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGRect, endValue: CGRect,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGRect {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(startValue.origin.x, endValue.origin.x)
        let y = interpolate(startValue.origin.y, endValue.origin.y)
        let width = interpolate(startValue.size.width, endValue.size.width)
        let height = interpolate(startValue.size.height, endValue.size.height)
        
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}

extension CGAffineTransform: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGAffineTransform, endValue: CGAffineTransform,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGAffineTransform {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let a = interpolate(startValue.a, endValue.a)
        let b = interpolate(startValue.b, endValue.b)
        let c = interpolate(startValue.c, endValue.c)
        let d = interpolate(startValue.d, endValue.d)
        let tx = interpolate(startValue.tx, endValue.tx)
        let ty = interpolate(startValue.ty, endValue.ty)

        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }

}

extension UIEdgeInsets: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: UIEdgeInsets, endValue: UIEdgeInsets,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIEdgeInsets {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let top = interpolate(startValue.top, endValue.top)
        let left = interpolate(startValue.left, endValue.left)
        let bottom = interpolate(startValue.bottom, endValue.bottom)
        let right = interpolate(startValue.right, endValue.right)

        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

}

extension RGBA: Interpolatable {

    internal static func interpolate(with ease: Ease,
                                     startValue: RGBA, endValue: RGBA,
                                     elapsed: TimeInterval, duration: TimeInterval) -> RGBA {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let red = interpolate(startValue.red, endValue.red)
        let green = interpolate(startValue.green, endValue.green)
        let blue = interpolate(startValue.blue, endValue.blue)
        let alpha = interpolate(startValue.alpha, endValue.alpha)

        return RGBA(red: red, green: green, blue: blue, alpha: alpha)
    }

}
