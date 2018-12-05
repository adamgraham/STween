//
//  Interpolatable.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import CoreGraphics
import CoreImage
import Foundation
import QuartzCore
import UIKit

/// A type that can be interpolated from a start and end value.
public protocol Interpolatable: Equatable {

    /// :nodoc:
    associatedtype Value = Self

    /**
     Calculates the value between a start and end value at a specific point in time.

     - Parameters:
        - ease: The `Ease` used to interpolate values.
        - start: The start value passed to the `ease` function.
        - end: The end value passed to the `ease` function.
        - elapsed: The elapsed amount of time passed to the `ease` function.
        - duration: The duration of time passed to the `ease` function.

     - Returns: The value interpolated between the start and end value.
     */
    static func interpolate(from start: Value, to end: Value, with ease: Ease,
                            elapsed: TimeInterval, duration: TimeInterval) -> Value

}

// MARK: - Default Implementation

/// :nodoc:
extension Interpolatable where Self: UnsignedInteger {

    public static func interpolate(from start: Self, to end: Self, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        let value = ease.interpolate(from: Double(start), to: Double(end),
                                     elapsed: elapsed, duration: duration)

        return Self(value)
    }
    
}

/// :nodoc:
extension Interpolatable where Self: SignedInteger {

    public static func interpolate(from start: Self, to end: Self, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        let value = ease.interpolate(from: Double(start), to: Double(end),
                                     elapsed: elapsed, duration: duration)

        return Self(value)
    }
    
}

/// :nodoc:
extension Interpolatable where Self: InterpolatableNumber {

    public static func interpolate(from start: Self, to end: Self, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        return ease.interpolate(from: start, to: end,
                                elapsed: Self(elapsed), duration: Self(duration))
    }

}

// MARK: - Conformance: Swift

/// :nodoc:
extension UInt: Interpolatable {}
/// :nodoc:
extension UInt8: Interpolatable {}
/// :nodoc:
extension UInt16: Interpolatable {}
/// :nodoc:
extension UInt32: Interpolatable {}
/// :nodoc:
extension UInt64: Interpolatable {}

/// :nodoc:
extension Int: Interpolatable {}
/// :nodoc:
extension Int8: Interpolatable {}
/// :nodoc:
extension Int16: Interpolatable {}
/// :nodoc:
extension Int32: Interpolatable {}
/// :nodoc:
extension Int64: Interpolatable {}

/// :nodoc:
extension Float32: Interpolatable {}
/// :nodoc:
extension Float64: Interpolatable {}

#if arch(i386) || arch(x86_64)
/// :nodoc:
extension Float80: Interpolatable {}
#endif

/// :nodoc:
extension Date: Interpolatable {

    public static func interpolate(from start: Date, to end: Date, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Date {

        let timeInterval = ease.interpolate(from: start.timeIntervalSince1970,
                                            to: end.timeIntervalSince1970,
                                            elapsed: elapsed, duration: duration)

        return Date(timeIntervalSince1970: timeInterval)
    }
    
}

// MARK: - Conformance: CoreAnimation

/// :nodoc:
extension CATransform3D: Interpolatable, Equatable {

    public static func interpolate(from start: CATransform3D, to end: CATransform3D, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CATransform3D {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let m11 = interpolate(start.m11, end.m11)
        let m12 = interpolate(start.m12, end.m12)
        let m13 = interpolate(start.m13, end.m13)
        let m14 = interpolate(start.m14, end.m14)

        let m21 = interpolate(start.m21, end.m21)
        let m22 = interpolate(start.m22, end.m22)
        let m23 = interpolate(start.m23, end.m23)
        let m24 = interpolate(start.m24, end.m24)

        let m31 = interpolate(start.m31, end.m31)
        let m32 = interpolate(start.m32, end.m32)
        let m33 = interpolate(start.m33, end.m33)
        let m34 = interpolate(start.m34, end.m34)

        let m41 = interpolate(start.m41, end.m41)
        let m42 = interpolate(start.m42, end.m42)
        let m43 = interpolate(start.m43, end.m43)
        let m44 = interpolate(start.m44, end.m44)

        return CATransform3D(m11: m11, m12: m12, m13: m13, m14: m14,
                             m21: m21, m22: m22, m23: m23, m24: m24,
                             m31: m31, m32: m32, m33: m33, m34: m34,
                             m41: m41, m42: m42, m43: m43, m44: m44)
    }

    public static func ==(lhs: CATransform3D, rhs: CATransform3D) -> Bool {
        return lhs.m11 == rhs.m11 &&
               lhs.m12 == rhs.m12 &&
               lhs.m13 == rhs.m13 &&
               lhs.m14 == rhs.m14 &&
               lhs.m21 == rhs.m21 &&
               lhs.m22 == rhs.m22 &&
               lhs.m23 == rhs.m23 &&
               lhs.m24 == rhs.m24 &&
               lhs.m31 == rhs.m31 &&
               lhs.m32 == rhs.m32 &&
               lhs.m33 == rhs.m33 &&
               lhs.m34 == rhs.m34 &&
               lhs.m41 == rhs.m41 &&
               lhs.m42 == rhs.m42 &&
               lhs.m43 == rhs.m43 &&
               lhs.m44 == rhs.m44
    }
    
}

// MARK: - Conformance: CoreGraphics

/// :nodoc:
extension CGAffineTransform: Interpolatable {

    public static func interpolate(from start: CGAffineTransform, to end: CGAffineTransform, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGAffineTransform {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let a = interpolate(start.a, end.a)
        let b = interpolate(start.b, end.b)
        let c = interpolate(start.c, end.c)
        let d = interpolate(start.d, end.d)
        let tx = interpolate(start.tx, end.tx)
        let ty = interpolate(start.ty, end.ty)

        return CGAffineTransform(a: a, b: b, c: c, d: d, tx: tx, ty: ty)
    }
    
}

/// :nodoc:
extension CGColor: Interpolatable {

    public static func interpolate(from start: CGColor, to end: CGColor, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGColor {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        var interpolatedComponents = [CGFloat]()

        for (index, endComponent) in (end.components ?? []).enumerated() {
            let startComponent = start.components?[index] ?? 0.0
            let interpolatedComponent = interpolate(startComponent, endComponent)
            interpolatedComponents.append(interpolatedComponent)
        }

        return CGColor(colorSpace: end.colorSpace ?? start.colorSpace ?? CGColorSpaceCreateDeviceRGB(),
                       components: interpolatedComponents) ?? end
    }
    
}

/// :nodoc:
extension CGFloat: Interpolatable {}

/// :nodoc:
extension CGPoint: Interpolatable {

    public static func interpolate(from start: CGPoint, to end: CGPoint, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGPoint {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(start.x, end.x)
        let y = interpolate(start.y, end.y)

        return CGPoint(x: x, y: y)
    }

}

/// :nodoc:
extension CGRect: Interpolatable {

    public static func interpolate(from start: CGRect, to end: CGRect, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGRect {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(start.origin.x, end.origin.x)
        let y = interpolate(start.origin.y, end.origin.y)
        let width = interpolate(start.size.width, end.size.width)
        let height = interpolate(start.size.height, end.size.height)

        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}

/// :nodoc:
extension CGSize: Interpolatable {

    public static func interpolate(from start: CGSize, to end: CGSize, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGSize {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let width = interpolate(start.width, end.width)
        let height = interpolate(start.height, end.height)

        return CGSize(width: width, height: height)
    }

}

/// :nodoc:
extension CGVector: Interpolatable {

    public static func interpolate(from start: CGVector, to end: CGVector, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGVector {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let dx = interpolate(start.dx, end.dx)
        let dy = interpolate(start.dy, end.dy)

        return CGVector(dx: dx, dy: dy)
    }

}

// MARK: - Conformance: CoreImage

/// :nodoc:
extension CIColor: Interpolatable {

    public static func interpolate(from start: CIColor, to end: CIColor, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CIColor {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let red = interpolate(start.red, end.red)
        let green = interpolate(start.green, end.green)
        let blue = interpolate(start.blue, end.blue)
        let alpha = interpolate(start.alpha, end.alpha)

        return CIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}

/// :nodoc:
extension CIVector: Interpolatable {

    public static func interpolate(from start: CIVector, to end: CIVector, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CIVector {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(start.x, end.x)
        let y = interpolate(start.y, end.y)
        let z = interpolate(start.z, end.z)
        let w = interpolate(start.w, end.w)

        return CIVector(x: x, y: y, z: z, w: w)
    }

}

// MARK: - Conformance: UIKit

/// :nodoc:
extension UIColor: Interpolatable {

    public static func interpolate(from start: UIColor, to end: UIColor, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIColor {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let startComponents = start.components
        let endComponents = end.components

        let red = interpolate(startComponents.red, endComponents.red)
        let green = interpolate(startComponents.green, endComponents.green)
        let blue = interpolate(startComponents.blue, endComponents.blue)
        let alpha = interpolate(startComponents.alpha, endComponents.alpha)

        return UIColor(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}

private extension UIColor {

    /// The red, green, blue, and alpha components of the color.
    private var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red: red, green: green, blue: blue, alpha: alpha)
    }

}

/// :nodoc:
extension UIEdgeInsets: Interpolatable {

    public static func interpolate(from start: UIEdgeInsets, to end: UIEdgeInsets, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIEdgeInsets {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let top = interpolate(start.top, end.top)
        let left = interpolate(start.left, end.left)
        let bottom = interpolate(start.bottom, end.bottom)
        let right = interpolate(start.right, end.right)

        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

}

/// :nodoc:
extension UIOffset: Interpolatable {

    public static func interpolate(from start: UIOffset, to end: UIOffset, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIOffset {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let horizontal = interpolate(start.horizontal, end.horizontal)
        let vertical = interpolate(start.vertical, end.vertical)

        return UIOffset(horizontal: horizontal, vertical: vertical)
    }
    
}
