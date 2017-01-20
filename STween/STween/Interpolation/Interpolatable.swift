//
//  Interpolatable.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide interpolation functionality.
public protocol Interpolatable {

    associatedtype InterpolationType

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
                            startValue: InterpolationType, endValue: InterpolationType,
                            elapsed: TimeInterval, duration: TimeInterval) -> InterpolationType

}

// MARK: - Default Implementation

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

// MARK: - Conformance: Primitive

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

// MARK: - Conformance: CoreGraphics

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

extension CGVector: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGVector, endValue: CGVector,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGVector {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let dx = interpolate(startValue.dx, endValue.dx)
        let dy = interpolate(startValue.dy, endValue.dy)

        return CGVector(dx: dx, dy: dy)
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

extension CGColor: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CGColor, endValue: CGColor,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CGColor {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
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

// MARK: - Conformance: CoreAnimation

extension CATransform3D: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CATransform3D, endValue: CATransform3D,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CATransform3D {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
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

}

// MARK: - Conformance: CoreImage

extension CIColor: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CIColor, endValue: CIColor,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CIColor {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let red = interpolate(startValue.red, endValue.red)
        let green = interpolate(startValue.green, endValue.green)
        let blue = interpolate(startValue.blue, endValue.blue)
        let alpha = interpolate(startValue.alpha, endValue.alpha)

        return CIColor(red: red, green: green, blue: blue, alpha: alpha)
    }

}

extension CIVector: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: CIVector, endValue: CIVector,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CIVector {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let x = interpolate(startValue.x, endValue.x)
        let y = interpolate(startValue.y, endValue.y)
        let z = interpolate(startValue.z, endValue.z)
        let w = interpolate(startValue.w, endValue.w)

        return CIVector(x: x, y: y, z: z, w: w)
    }

}

// MARK: - Conformance: UIKit

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

extension UIOffset: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: UIOffset, endValue: UIOffset,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIOffset {

        let interpolate: (CGFloat, CGFloat) -> CGFloat = { (start, end) in
            return ease.interpolate(startValue: start, endValue: end, elapsed: CGFloat(elapsed), duration: CGFloat(duration))
        }

        let horizontal = interpolate(startValue.horizontal, endValue.horizontal)
        let vertical = interpolate(startValue.vertical, endValue.vertical)

        return UIOffset(horizontal: horizontal, vertical: vertical)
    }
    
}

extension UIColor: Interpolatable {

    public static func interpolate(with ease: Ease,
                                   startValue: UIColor, endValue: UIColor,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIColor {

        let rgba = RGBA.interpolate(with: ease, startValue: startValue.rgba, endValue: endValue.rgba, elapsed: elapsed, duration: duration)
        return rgba.color
    }

}

// MARK: - Conformance: Internal

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
