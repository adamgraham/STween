//
//  DoubleConvertible.swift
//  STween
//
//  Created by Adam Graham on 7/10/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide conversion functionality to a `Double` value.
internal protocol DoubleConvertible {

    /// The `Double` value of `self`.
    var toDouble: Double { get }

}

// MARK: - Helpers

extension Double {

    /// Initializes a `Double` value from a `DoubleConvertible` type.
    internal init(convertible: DoubleConvertible) {
        self = convertible.toDouble
    }

    /// Initializes a `Double` value from an `UnsignedInteger` type.
    internal init<U: UnsignedInteger>(_ unsignedInteger: U) {
        self = Double(UInt64(unsignedInteger))
    }

    /// Initializes a `Double` value from an `SignedInteger` type.
    internal init<I: SignedInteger>(_ signedInteger: I) {
        self = Double(Int64(signedInteger))
    }

    /// Initializes a `Double` value from a `FloatingPoint` type.
    internal init<F: FloatingPoint>(_ floatingPoint: F) {
        #if arch(i386) || arch(x86_64)
        if let float80 = floatingPoint as? Float80 {
            self = Double(float80)
            return
        }
        #endif
        if let float64 = floatingPoint as? Float64 {
            self = Double(float64)
        } else if let float32 = floatingPoint as? Float32 {
            self = Double(float32)
        } else if let cgfloat = floatingPoint as? CGFloat {
            self = Double(cgfloat)
        } else {
            self = Double(floatingPoint as! Float)
        }
    }

}

// MARK: - Default Implementation

extension DoubleConvertible where Self: UnsignedInteger {

    internal var toDouble: Double {
        return Double(self)
    }

}

extension DoubleConvertible where Self: SignedInteger {

    internal var toDouble: Double {
        return Double(self)
    }
    
}

extension DoubleConvertible where Self: FloatingPoint {

    internal var toDouble: Double {
        return Double(self)
    }

}

// MARK: - Conformance

extension UInt: DoubleConvertible {}
extension UInt8: DoubleConvertible {}
extension UInt16: DoubleConvertible {}
extension UInt32: DoubleConvertible {}
extension UInt64: DoubleConvertible {}

extension Int: DoubleConvertible {}
extension Int8: DoubleConvertible {}
extension Int16: DoubleConvertible {}
extension Int32: DoubleConvertible {}
extension Int64: DoubleConvertible {}

extension Float32: DoubleConvertible {}
extension Float64: DoubleConvertible {}
extension CGFloat: DoubleConvertible {}

#if arch(i386) || arch(x86_64)
    extension Float80: DoubleConvertible {}
#endif
