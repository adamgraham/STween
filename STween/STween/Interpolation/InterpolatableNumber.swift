//
//  InterpolatableNumber.swift
//  STween
//
//  Created by Adam Graham on 10/5/18.
//  Copyright © 2018 Adam Graham. All rights reserved.
//

import CoreGraphics

/// A floating-point type that is used to interpolate numerical values.
public protocol InterpolatableNumber: FloatingPoint {

    /// A set of constant values that are used to optimize interpolation functions.
    static var const: InterpolatableNumberConstants<Self> { get }

    /**
     Calculates an interpolatable number raised to a given power.

     - Parameters:
        - x: The base number that is raised to the power of some exponent.
        - y: The exponent that is raised against the base number.

     - Returns: The value of the base number (`x`) raised to the exponent (`y`).
     */
    static func pow(_ x: Self, _ y: Self) -> Self

    /// The cosine of `self`.
    var cos: Self { get }
    /// The sine of `self`.
    var sin: Self { get }

    init(_ x: Double)

}

/// A set of constant values that are used to optimize interpolation functions.
public struct InterpolatableNumberConstants<Number: InterpolatableNumber> {

    // MARK: Whole Numbers

    /// A constant value of `0`.
    public let zero = Number(0)
    /// A constant value of `1`.
    public let one = Number(1)
    /// A constant value of `2`.
    public let two = Number(2)
    /// A constant value of `3`.
    public let three = Number(3)
    /// A constant value of `4`.
    public let four = Number(4)
    /// A constant value of `5`.
    public let five = Number(5)
    /// A constant value of `6`.
    public let six = Number(6)
    /// A constant value of `7`.
    public let seven = Number(7)
    /// A constant value of `8`.
    public let eight = Number(8)
    /// A constant value of `9`.
    public let nine = Number(9)
    /// A constant value of `10`.
    public let ten = Number(10)

    // MARK: Vulgar Fractions

    /// A constant value of `0.1`.
    public let ⅒ = Number(1) / Number(10)
    /// A constant value of `0.11111111111`.
    public let ⅑ = Number(1) / Number(9)
    /// A constant value of `0.125`.
    public let ⅛ = Number(1) / Number(8)
    /// A constant value of `0.14285714285`.
    public let ⅐ = Number(1) / Number(7)
    /// A constant value of `0.16666666666`.
    public let ⅙ = Number(1) / Number(6)
    /// A constant value of `0.2`.
    public let ⅕ = Number(1) / Number(5)
    /// A constant value of `0.25`.
    public let ¼ = Number(1) / Number(4)
    /// A constant value of `0.33333333333`.
    public let ⅓ = Number(1) / Number(3)
    /// A constant value of `0.375`.
    public let ⅜ = Number(3) / Number(8)
    /// A constant value of `0.4`.
    public let ⅖ = Number(2) / Number(5)
    /// A constant value of `0.5`.
    public let ½ = Number(1) / Number(2)
    /// A constant value of `0.6`.
    public let ⅗ = Number(3) / Number(5)
    /// A constant value of `0.625`.
    public let ⅝ = Number(5) / Number(8)
    /// A constant value of `0.66666666666`.
    public let ⅔ = Number(2) / Number(3)
    /// A constant value of `0.75`.
    public let ¾ = Number(3) / Number(4)
    /// A constant value of `0.8`.
    public let ⅘ = Number(4) / Number(5)
    /// A constant value of `0.83333333333`.
    public let ⅚ = Number(5) / Number(6)
    /// A constant value of `0.875`.
    public let ⅞ = Number(7) / Number(8)

    // MARK: Mathematical Constants

    /// A constant value of ~`3.14159265359` (1π).
    public let pi = Number.pi
    /// A constant value of ~`6.28318530718` (2π).
    public let tau = Number.pi * Number(2)

}

// MARK: - Default Implementation

extension InterpolatableNumber {

    /// Twice the value of `self`.
    internal var double: Self {
        return self * Self.const.two
    }

    /// Half the value of `self`.
    internal var half: Self {
        return self * Self.const.½
    }

}

// MARK: - Conformance

extension Float32: InterpolatableNumber {

    public static let const = InterpolatableNumberConstants<Float32>()

    public static func pow(_ x: Float32, _ y: Float32) -> Float32 {
        return STween.pow(x, y)
    }

    public var cos: Float32 { return STween.cos(self) }
    public var sin: Float32 { return STween.sin(self) }

}

extension Float64: InterpolatableNumber {

    public static let const = InterpolatableNumberConstants<Float64>()

    public static func pow(_ x: Float64, _ y: Float64) -> Float64 {
        return STween.pow(x, y)
    }

    public var cos: Float64 { return STween.cos(self) }
    public var sin: Float64 { return STween.sin(self) }

}

extension Float80: InterpolatableNumber {

    public static let const = InterpolatableNumberConstants<Float80>()

    public static func pow(_ x: Float80, _ y: Float80) -> Float80 {
        return STween.pow(x, y)
    }

    public var cos: Float80 { return STween.cos(self) }
    public var sin: Float80 { return STween.sin(self) }

}

extension CGFloat: InterpolatableNumber {

    public static let const = InterpolatableNumberConstants<CGFloat>()

    public static func pow(_ x: CGFloat, _ y: CGFloat) -> CGFloat {
        return STween.pow(x, y)
    }

    public var cos: CGFloat { return STween.cos(self) }
    public var sin: CGFloat { return STween.sin(self) }

}

// MARK: - Global Functions

/**
 Calculates the cosine of an interpolatable number.

 - Parameters:
    - x: The interpolatable number of which the cosine is calculated.

 - Returns: The cosine of the interpolatable number.
 */
public func cos<Number: InterpolatableNumber>(_ x: Number) -> Number {
    return x.cos
}

/**
 Calculates the sine of an interpolatable number.

 - Parameters:
    - x: The interpolatable number of which the sine is calculated.

 - Returns: The sine of the interpolatable number.
 */
public func sin<Number: InterpolatableNumber>(_ x: Number) -> Number {
    return x.sin
}

/**
 Calculates an interpolatable number raised to a given power.

 - Parameters:
    - x: The base number that is raised to the power of some exponent.
    - y: The exponent that is raised against the base number.

 - Returns: The value of the base number (`x`) raised to the exponent (`y`).
 */
public func pow<Number: InterpolatableNumber>(_ x: Number, _ y: Number) -> Number {
    return Number.pow(x, y)
}
