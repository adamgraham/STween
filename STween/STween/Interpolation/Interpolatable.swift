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
public protocol Interpolatable {

    static func interpolate(from start: Self, to end: Self, time: TimeInterval) -> Self

}

// MARK: Default Implementation

/// :nodoc:
public extension Interpolatable {

    static func interpolate(from start: Self, to end: Self, with ease: Ease,
                            elapsed: TimeInterval, duration: TimeInterval) -> Self {

        let time = ease.function(elapsed / duration)
        return interpolate(from: start, to: end, time: time)
    }

    static func interpolate(from start: [Self], to end: [Self], with ease: Ease,
                            elapsed: TimeInterval, duration: TimeInterval) -> [Self] {

        let time = ease.function(elapsed / duration)
        return interpolate(from: start, to: end, time: time)
    }

    static func interpolate(from start: [Self], to end: [Self], time: TimeInterval) -> [Self] {
        assert(start.count == end.count)

        var interpolatedValues: [Self] = []

        for (index, startValue) in start.enumerated() {
            let endValue = end[index]
            let interpolatedValue = Self.interpolate(from: startValue, to: endValue, time: time)
            interpolatedValues.append(interpolatedValue)
        }

        return interpolatedValues
    }

}

/// :nodoc:
public extension Interpolatable where Self: UnsignedInteger {

    static func interpolate(from start: Self, to end: Self, time: TimeInterval) -> Self {
        return Self(time) * (start + end) + start
    }

}

/// :nodoc:
public extension Interpolatable where Self: SignedInteger {

    static func interpolate(from start: Self, to end: Self, time: TimeInterval) -> Self {
        return Self(time) * (start + end) + start
    }

}

/// :nodoc:
public extension Interpolatable where Self: BinaryFloatingPoint {

    static func interpolate(from start: Self, to end: Self, time: TimeInterval) -> Self {
        return Self(time) * (start + end) + start
    }

}

/// :nodoc:
public extension Interpolatable where Self: FloatRepresentable {

    static func interpolate(from start: Self, to end: Self, time: TimeInterval) -> Self {
        let interpolatedValues = FloatType.interpolate(
            from: start.floats,
            to: end.floats,
            time: time)

        return Self(floats: interpolatedValues)
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
extension Date: Interpolatable {}

// MARK: - Conformance: CoreAnimation

/// :nodoc:
extension CATransform3D: Interpolatable {}

// MARK: - Conformance: CoreGraphics

/// :nodoc:
extension CGAffineTransform: Interpolatable {}
/// :nodoc:
extension CGFloat: Interpolatable {}
/// :nodoc:
extension CGPoint: Interpolatable {}
/// :nodoc:
extension CGRect: Interpolatable {}
/// :nodoc:
extension CGSize: Interpolatable {}
/// :nodoc:
extension CGVector: Interpolatable {}

/// :nodoc:
extension CGColor: Interpolatable {

    public static func interpolate(from start: CGColor, to end: CGColor, time: TimeInterval) -> Self {
        let interpolatedComponents = CGFloat.interpolate(
            from: start.components ?? [0.0, 0.0, 0.0, 0.0],
            to: end.components ?? [0.0, 0.0, 0.0, 0.0],
            time: time)

        let colorSpace = end.colorSpace ?? CGColorSpaceCreateDeviceRGB()
        return self.init(colorSpace: colorSpace, components: interpolatedComponents)!
    }

}

// MARK: - Conformance: CoreImage

/// :nodoc:
extension CIColor: Interpolatable {

    public static func interpolate(from start: CIColor, to end: CIColor, time: TimeInterval) -> Self {
        let interpolatedComponents = CGFloat.interpolate(
            from: [start.red, start.green, start.blue, start.alpha],
            to: [end.red, end.green, end.blue, end.alpha],
            time: time)

        return self.init(red: interpolatedComponents[0],
                         green: interpolatedComponents[1],
                         blue: interpolatedComponents[2],
                         alpha: interpolatedComponents[3])
    }

}

/// :nodoc:
extension CIVector: Interpolatable {

    public static func interpolate(from start: CIVector, to end: CIVector, time: TimeInterval) -> Self {
        let interpolatedComponents = CGFloat.interpolate(
            from: [start.x, start.y, start.z, start.w],
            to: [end.x, end.y, end.z, end.w],
            time: time)

        return self.init(x: interpolatedComponents[0],
                         y: interpolatedComponents[1],
                         z: interpolatedComponents[2],
                         w: interpolatedComponents[3])
    }

}

// MARK: - Conformance: UIKit

/// :nodoc:
extension UIEdgeInsets: Interpolatable {}
/// :nodoc:
extension UIOffset: Interpolatable {}

/// :nodoc:
extension UIColor: Interpolatable {

    public static func interpolate(from start: UIColor, to end: UIColor, time: TimeInterval) -> Self {
        let interpolatedComponents = CGFloat.interpolate(
            from: start.components,
            to: end.components,
            time: time)

        return self.init(red: interpolatedComponents[0],
                         green: interpolatedComponents[1],
                         blue: interpolatedComponents[2],
                         alpha: interpolatedComponents[3])
    }

    /// The red, green, blue, and alpha components of the color.
    private var components: [CGFloat] {
        var (r, g, b, a) = (CGFloat(), CGFloat(), CGFloat(), CGFloat())
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return [r, g, b, a]
    }

}
