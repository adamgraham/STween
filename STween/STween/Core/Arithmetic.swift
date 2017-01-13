//
//  Arithmetic.swift
//  STween
//
//  Created by Adam Graham on 1/4/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/** 
 A protocol to provide arithmetic functions i.e. addition, subtraction,
 multiplication, division, etc.
 */
internal protocol Arithmetic {

    static var identity: Self { get }

    static prefix func +(value: Self) -> Self
    static prefix func -(value: Self) -> Self

    static func +(lhs: Self, rhs: Self) -> Self
    static func -(lhs: Self, rhs: Self) -> Self
    static func *(lhs: Self, rhs: Self) -> Self
    static func /(lhs: Self, rhs: Self) -> Self

    static func +(lhs: Self, rhs: Swift.Double) -> Self
    static func -(lhs: Self, rhs: Swift.Double) -> Self
    static func *(lhs: Self, rhs: Swift.Double) -> Self
    static func /(lhs: Self, rhs: Swift.Double) -> Self

    static func +(lhs: Swift.Double, rhs: Self) -> Self
    static func -(lhs: Swift.Double, rhs: Self) -> Self
    static func *(lhs: Swift.Double, rhs: Self) -> Self
    static func /(lhs: Swift.Double, rhs: Self) -> Self

}

// MARK: - Conformance

extension Swift.UInt: Arithmetic {

    internal static var identity: Swift.UInt {
        return 0
    }


    internal static prefix func -(value: Swift.UInt) -> Swift.UInt {
        return value * 1
    }

    internal static prefix func +(value: Swift.UInt) -> Swift.UInt {
        return value * 1
    }


    internal static func +(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = Swift.Double(lhs) + rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    internal static func -(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = Swift.Double(lhs) - rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    internal static func *(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = Swift.Double(lhs) * rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    internal static func /(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = Swift.Double(lhs) / rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }


    internal static func +(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs + Swift.Double(rhs)
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    internal static func -(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs - Swift.Double(rhs)
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    internal static func *(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs * Swift.Double(rhs)
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    internal static func /(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs / Swift.Double(rhs)
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

}

extension Swift.Int: Arithmetic {

    internal static var identity: Swift.Int {
        return 0
    }


    internal static prefix func -(value: Swift.Int) -> Swift.Int {
        return value * -1
    }

    internal static prefix func +(value: Swift.Int) -> Swift.Int {
        return value * 1
    }


    internal static func +(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(Swift.Double(lhs) + rhs)
    }

    internal static func -(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(Swift.Double(lhs) - rhs)
    }

    internal static func *(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(Swift.Double(lhs) * rhs)
    }

    internal static func /(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(Swift.Double(lhs) / rhs)
    }


    internal static func +(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs + Swift.Double(rhs))
    }

    internal static func -(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs - Swift.Double(rhs))
    }

    internal static func *(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs * Swift.Double(rhs))
    }

    internal static func /(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs / Swift.Double(rhs))
    }

}

extension Swift.Double: Arithmetic {

    internal static var identity: Swift.Double {
        return 0.0
    }

}

extension Swift.Float: Arithmetic {

    internal static var identity: Swift.Float {
        return 0.0
    }


    internal static func +(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(Swift.Double(lhs) + rhs)
    }

    internal static func -(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(Swift.Double(lhs) - rhs)
    }

    internal static func *(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(Swift.Double(lhs) * rhs)
    }

    internal static func /(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(Swift.Double(lhs) / rhs)
    }


    internal static func +(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs + Swift.Double(rhs))
    }

    internal static func -(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs - Swift.Double(rhs))
    }

    internal static func *(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs * Swift.Double(rhs))
    }

    internal static func /(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs / Swift.Double(rhs))
    }

}

extension CoreGraphics.CGFloat: Arithmetic {

    internal static var identity: CoreGraphics.CGFloat {
        return 0.0
    }


    internal static func +(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(Swift.Double(lhs) + rhs)
    }

    internal static func -(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(Swift.Double(lhs) - rhs)
    }

    internal static func *(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(Swift.Double(lhs) * rhs)
    }

    internal static func /(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(Swift.Double(lhs) / rhs)
    }


    internal static func +(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs + Swift.Double(rhs))
    }

    internal static func -(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs - Swift.Double(rhs))
    }

    internal static func *(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs * Swift.Double(rhs))
    }

    internal static func /(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs / Swift.Double(rhs))
    }

}
