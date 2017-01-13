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

    static func +(lhs: Self, rhs: Double) -> Self
    static func -(lhs: Self, rhs: Double) -> Self
    static func *(lhs: Self, rhs: Double) -> Self
    static func /(lhs: Self, rhs: Double) -> Self

    static func +(lhs: Double, rhs: Self) -> Self
    static func -(lhs: Double, rhs: Self) -> Self
    static func *(lhs: Double, rhs: Self) -> Self
    static func /(lhs: Double, rhs: Self) -> Self

}

// MARK: - Conformance

extension UInt: Arithmetic {

    internal static var identity: UInt {
        return 0
    }


    internal static prefix func -(value: UInt) -> UInt {
        return value * 1
    }

    internal static prefix func +(value: UInt) -> UInt {
        return value * 1
    }


    internal static func +(lhs: UInt, rhs: Double) -> UInt {
        let value = Double(lhs) + rhs
        return value < 0.0 ? 0 : UInt(value)
    }

    internal static func -(lhs: UInt, rhs: Double) -> UInt {
        let value = Double(lhs) - rhs
        return value < 0.0 ? 0 : UInt(value)
    }

    internal static func *(lhs: UInt, rhs: Double) -> UInt {
        let value = Double(lhs) * rhs
        return value < 0.0 ? 0 : UInt(value)
    }

    internal static func /(lhs: UInt, rhs: Double) -> UInt {
        let value = Double(lhs) / rhs
        return value < 0.0 ? 0 : UInt(value)
    }


    internal static func +(lhs: Double, rhs: UInt) -> UInt {
        let value = lhs + Double(rhs)
        return value < 0.0 ? 0 : UInt(value)
    }

    internal static func -(lhs: Double, rhs: UInt) -> UInt {
        let value = lhs - Double(rhs)
        return value < 0.0 ? 0 : UInt(value)
    }

    internal static func *(lhs: Double, rhs: UInt) -> UInt {
        let value = lhs * Double(rhs)
        return value < 0.0 ? 0 : UInt(value)
    }

    internal static func /(lhs: Double, rhs: UInt) -> UInt {
        let value = lhs / Double(rhs)
        return value < 0.0 ? 0 : UInt(value)
    }

}

extension Int: Arithmetic {

    internal static var identity: Int {
        return 0
    }


    internal static prefix func -(value: Int) -> Int {
        return value * -1
    }

    internal static prefix func +(value: Int) -> Int {
        return value * 1
    }


    internal static func +(lhs: Int, rhs: Double) -> Int {
        return Int(Double(lhs) + rhs)
    }

    internal static func -(lhs: Int, rhs: Double) -> Int {
        return Int(Double(lhs) - rhs)
    }

    internal static func *(lhs: Int, rhs: Double) -> Int {
        return Int(Double(lhs) * rhs)
    }

    internal static func /(lhs: Int, rhs: Double) -> Int {
        return Int(Double(lhs) / rhs)
    }


    internal static func +(lhs: Double, rhs: Int) -> Int {
        return Int(lhs + Double(rhs))
    }

    internal static func -(lhs: Double, rhs: Int) -> Int {
        return Int(lhs - Double(rhs))
    }

    internal static func *(lhs: Double, rhs: Int) -> Int {
        return Int(lhs * Double(rhs))
    }

    internal static func /(lhs: Double, rhs: Int) -> Int {
        return Int(lhs / Double(rhs))
    }

}

extension Double: Arithmetic {

    internal static var identity: Double {
        return 0.0
    }

}

extension Float: Arithmetic {

    internal static var identity: Float {
        return 0.0
    }


    internal static func +(lhs: Float, rhs: Double) -> Float {
        return Float(Double(lhs) + rhs)
    }

    internal static func -(lhs: Float, rhs: Double) -> Float {
        return Float(Double(lhs) - rhs)
    }

    internal static func *(lhs: Float, rhs: Double) -> Float {
        return Float(Double(lhs) * rhs)
    }

    internal static func /(lhs: Float, rhs: Double) -> Float {
        return Float(Double(lhs) / rhs)
    }


    internal static func +(lhs: Double, rhs: Float) -> Float {
        return Float(lhs + Double(rhs))
    }

    internal static func -(lhs: Double, rhs: Float) -> Float {
        return Float(lhs - Double(rhs))
    }

    internal static func *(lhs: Double, rhs: Float) -> Float {
        return Float(lhs * Double(rhs))
    }

    internal static func /(lhs: Double, rhs: Float) -> Float {
        return Float(lhs / Double(rhs))
    }

}

extension CGFloat: Arithmetic {

    internal static var identity: CGFloat {
        return 0.0
    }


    internal static func +(lhs: CGFloat, rhs: Double) -> CGFloat {
        return CGFloat(Double(lhs) + rhs)
    }

    internal static func -(lhs: CGFloat, rhs: Double) -> CGFloat {
        return CGFloat(Double(lhs) - rhs)
    }

    internal static func *(lhs: CGFloat, rhs: Double) -> CGFloat {
        return CGFloat(Double(lhs) * rhs)
    }

    internal static func /(lhs: CGFloat, rhs: Double) -> CGFloat {
        return CGFloat(Double(lhs) / rhs)
    }


    internal static func +(lhs: Double, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs + Double(rhs))
    }

    internal static func -(lhs: Double, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs - Double(rhs))
    }

    internal static func *(lhs: Double, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs * Double(rhs))
    }

    internal static func /(lhs: Double, rhs: CGFloat) -> CGFloat {
        return CGFloat(lhs / Double(rhs))
    }

}
