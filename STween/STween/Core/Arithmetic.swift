//
//  Arithmetic.swift
//  STween
//
//  Created by Adam Graham on 1/4/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

public protocol Arithmetic {

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

    public static var identity: Swift.UInt {
        return 0
    }


    public static prefix func -(value: Swift.UInt) -> Swift.UInt {
        return value * 1
    }

    public static prefix func +(value: Swift.UInt) -> Swift.UInt {
        return value * 1
    }


    public static func +(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = lhs.doubleValue + rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    public static func -(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = lhs.doubleValue - rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    public static func *(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = lhs.doubleValue * rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    public static func /(lhs: Swift.UInt, rhs: Swift.Double) -> Swift.UInt {
        let value = lhs.doubleValue / rhs
        return value < 0.0 ? 0 : Swift.UInt(value)
    }


    public static func +(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs + rhs.doubleValue
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    public static func -(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs - rhs.doubleValue
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    public static func *(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs * rhs.doubleValue
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

    public static func /(lhs: Swift.Double, rhs: Swift.UInt) -> Swift.UInt {
        let value = lhs / rhs.doubleValue
        return value < 0.0 ? 0 : Swift.UInt(value)
    }

}

extension Swift.Int: Arithmetic {

    public static var identity: Swift.Int {
        return 0
    }


    public static prefix func -(value: Swift.Int) -> Swift.Int {
        return value * -1
    }

    public static prefix func +(value: Swift.Int) -> Swift.Int {
        return value * 1
    }


    public static func +(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(lhs.doubleValue + rhs)
    }

    public static func -(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(lhs.doubleValue - rhs)
    }

    public static func *(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(lhs.doubleValue * rhs)
    }

    public static func /(lhs: Swift.Int, rhs: Swift.Double) -> Swift.Int {
        return Swift.Int(lhs.doubleValue / rhs)
    }


    public static func +(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs + rhs.doubleValue)
    }

    public static func -(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs - rhs.doubleValue)
    }

    public static func *(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs * rhs.doubleValue)
    }

    public static func /(lhs: Swift.Double, rhs: Swift.Int) -> Swift.Int {
        return Swift.Int(lhs / rhs.doubleValue)
    }

}

extension Swift.Double: Arithmetic {

    public static var identity: Swift.Double {
        return 0.0
    }

}

extension Swift.Float: Arithmetic {

    public static var identity: Swift.Float {
        return 0.0
    }


    public static func +(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(lhs.doubleValue + rhs)
    }

    public static func -(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(lhs.doubleValue - rhs)
    }

    public static func *(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(lhs.doubleValue * rhs)
    }

    public static func /(lhs: Swift.Float, rhs: Swift.Double) -> Swift.Float {
        return Swift.Float(lhs.doubleValue / rhs)
    }


    public static func +(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs + rhs.doubleValue)
    }

    public static func -(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs - rhs.doubleValue)
    }

    public static func *(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs * rhs.doubleValue)
    }

    public static func /(lhs: Swift.Double, rhs: Swift.Float) -> Swift.Float {
        return Swift.Float(lhs / rhs.doubleValue)
    }

}

extension CoreGraphics.CGFloat: Arithmetic {

    public static var identity: CoreGraphics.CGFloat {
        return 0.0
    }


    public static func +(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs.doubleValue + rhs)
    }

    public static func -(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs.doubleValue - rhs)
    }

    public static func *(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs.doubleValue * rhs)
    }

    public static func /(lhs: CoreGraphics.CGFloat, rhs: Swift.Double) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs.doubleValue / rhs)
    }


    public static func +(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs + rhs.doubleValue)
    }

    public static func -(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs - rhs.doubleValue)
    }

    public static func *(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs * rhs.doubleValue)
    }

    public static func /(lhs: Swift.Double, rhs: CoreGraphics.CGFloat) -> CoreGraphics.CGFloat {
        return CoreGraphics.CGFloat(lhs / rhs.doubleValue)
    }

}
