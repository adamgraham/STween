//
//  Interpolatable.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide interpolation functionality.
public protocol Interpolatable: Equatable {

    associatedtype Value = Self

    /**
     A class method to calculate the value between a starting and ending position at a
     specific point in time.

     - Parameters:
        - ease: The `Ease` used to interpolate values.
        - startValue: The start value passed to the `ease` function.
        - endValue: The end value passed to the `ease` function.
        - elapsed: The elapsed amount of time passed to the `ease` function.
        - duration: The duration of time passed to the `ease` function.

     - Returns: The value interpolated between the start and end value.
     */
    static func interpolate(from startValue: Value, to endValue: Value, with ease: Ease,
                            elapsed: TimeInterval, duration: TimeInterval) -> Value

}

// MARK: - Default Implementation

/// :nodoc:
extension Interpolatable where Self: UnsignedInteger {

    public static func interpolate(from startValue: Self, to endValue: Self, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        let start = Double(startValue)
        let end = Double(endValue)
        let value = ease.interpolate(from: start, to: end,
                                     elapsed: elapsed, duration: duration)

        return Self(value)
    }
    
}

/// :nodoc:
extension Interpolatable where Self: SignedInteger {

    public static func interpolate(from startValue: Self, to endValue: Self, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        let start = Double(startValue)
        let end = Double(endValue)
        let value = ease.interpolate(from: start, to: end,
                                     elapsed: elapsed, duration: duration)

        return Self(value)
    }
    
}

/// :nodoc:
extension Interpolatable where Self: InterpolatableNumber {

    public static func interpolate(from startValue: Self, to endValue: Self, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Self {

        return ease.interpolate(from: startValue, to: endValue,
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

    public static func interpolate(from startValue: Date, to endValue: Date, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> Date {

        let timeInterval = ease.interpolate(from: startValue.timeIntervalSince1970,
                                            to: endValue.timeIntervalSince1970,
                                            elapsed: elapsed, duration: duration)

        return Date(timeIntervalSince1970: timeInterval)
    }
    
}

// MARK: - Conformance: CoreAnimation

/// :nodoc:
extension CATransform3D: Interpolatable, Equatable {

    public static func interpolate(from startValue: CATransform3D, to endValue: CATransform3D, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CATransform3D {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let m11 = interpolate(startValue.m11, endValue.m11)
        let m12 = interpolate(startValue.m12, endValue.m12)
        let m13 = interpolate(startValue.m13, endValue.m13)
        let m14 = interpolate(startValue.m14, endValue.m14)

        let m21 = interpolate(startValue.m21, endValue.m21)
        let m22 = interpolate(startValue.m22, endValue.m22)
        let m23 = interpolate(startValue.m23, endValue.m23)
        let m24 = interpolate(startValue.m24, endValue.m24)

        let m31 = interpolate(startValue.m31, endValue.m31)
        let m32 = interpolate(startValue.m32, endValue.m32)
        let m33 = interpolate(startValue.m33, endValue.m33)
        let m34 = interpolate(startValue.m34, endValue.m34)

        let m41 = interpolate(startValue.m41, endValue.m41)
        let m42 = interpolate(startValue.m42, endValue.m42)
        let m43 = interpolate(startValue.m43, endValue.m43)
        let m44 = interpolate(startValue.m44, endValue.m44)

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

    public static func interpolate(from startValue: CGAffineTransform, to endValue: CGAffineTransform, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGAffineTransform {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
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

/// :nodoc:
extension CGColor: Interpolatable {

    public static func interpolate(from startValue: CGColor, to endValue: CGColor, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGColor {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        var interpolatedComponents = [CGFloat]()

        for (index, endComponent) in (endValue.components ?? []).enumerated() {
            let startComponent = startValue.components?[index] ?? 0.0
            let interpolatedComponent = interpolate(startComponent, endComponent)
            interpolatedComponents.append(interpolatedComponent)
        }

        return CGColor(colorSpace: endValue.colorSpace ?? startValue.colorSpace ?? CGColorSpaceCreateDeviceRGB(),
                       components: interpolatedComponents) ?? endValue
    }
    
}

/// :nodoc:
extension CGFloat: Interpolatable {}

/// :nodoc:
extension CGPoint: Interpolatable {

    public static func interpolate(from startValue: CGPoint, to endValue: CGPoint, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGPoint {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(startValue.x, endValue.x)
        let y = interpolate(startValue.y, endValue.y)

        return CGPoint(x: x, y: y)
    }

}

/// :nodoc:
extension CGRect: Interpolatable {

    public static func interpolate(from startValue: CGRect, to endValue: CGRect, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGRect {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(startValue.origin.x, endValue.origin.x)
        let y = interpolate(startValue.origin.y, endValue.origin.y)
        let width = interpolate(startValue.size.width, endValue.size.width)
        let height = interpolate(startValue.size.height, endValue.size.height)

        return CGRect(x: x, y: y, width: width, height: height)
    }
    
}

/// :nodoc:
extension CGSize: Interpolatable {

    public static func interpolate(from startValue: CGSize, to endValue: CGSize, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGSize {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let width = interpolate(startValue.width, endValue.width)
        let height = interpolate(startValue.height, endValue.height)

        return CGSize(width: width, height: height)
    }

}

/// :nodoc:
extension CGVector: Interpolatable {

    public static func interpolate(from startValue: CGVector, to endValue: CGVector, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGVector {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let dx = interpolate(startValue.dx, endValue.dx)
        let dy = interpolate(startValue.dy, endValue.dy)

        return CGVector(dx: dx, dy: dy)
    }

}

// MARK: - Conformance: CoreImage

/// :nodoc:
extension CIColor: Interpolatable {

    public static func interpolate(from startValue: CIColor, to endValue: CIColor, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CIColor {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let red = interpolate(startValue.red, endValue.red)
        let green = interpolate(startValue.green, endValue.green)
        let blue = interpolate(startValue.blue, endValue.blue)
        let alpha = interpolate(startValue.alpha, endValue.alpha)

        return CIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}

/// :nodoc:
extension CIVector: Interpolatable {

    public static func interpolate(from startValue: CIVector, to endValue: CIVector, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CIVector {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(startValue.x, endValue.x)
        let y = interpolate(startValue.y, endValue.y)
        let z = interpolate(startValue.z, endValue.z)
        let w = interpolate(startValue.w, endValue.w)

        return CIVector(x: x, y: y, z: z, w: w)
    }

}

// MARK: - Conformance: UIKit

/// :nodoc:
extension UIColor: Interpolatable {

    public static func interpolate(from startValue: UIColor, to endValue: UIColor, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIColor {

        let rgba = RGBA.interpolate(from: startValue.rgba, to: endValue.rgba, with: ease,
                                    elapsed: elapsed, duration: duration)
        return rgba.color
    }
    
}

/// :nodoc:
extension UIEdgeInsets: Interpolatable {

    public static func interpolate(from startValue: UIEdgeInsets, to endValue: UIEdgeInsets, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIEdgeInsets {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let top = interpolate(startValue.top, endValue.top)
        let left = interpolate(startValue.left, endValue.left)
        let bottom = interpolate(startValue.bottom, endValue.bottom)
        let right = interpolate(startValue.right, endValue.right)

        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }

}

/// :nodoc:
extension UIOffset: Interpolatable {

    public static func interpolate(from startValue: UIOffset, to endValue: UIOffset, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIOffset {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let horizontal = interpolate(startValue.horizontal, endValue.horizontal)
        let vertical = interpolate(startValue.vertical, endValue.vertical)

        return UIOffset(horizontal: horizontal, vertical: vertical)
    }
    
}

// MARK: - Conformance: Internal

/// :nodoc:
extension RGBA: Interpolatable {

    internal static func interpolate(from startValue: RGBA, to endValue: RGBA, with ease: Ease,
                                     elapsed: TimeInterval, duration: TimeInterval) -> RGBA {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(from: start, to: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let red = interpolate(startValue.red, endValue.red)
        let green = interpolate(startValue.green, endValue.green)
        let blue = interpolate(startValue.blue, endValue.blue)
        let alpha = interpolate(startValue.alpha, endValue.alpha)

        return RGBA(red: red, green: green, blue: blue, alpha: alpha)
    }

}
