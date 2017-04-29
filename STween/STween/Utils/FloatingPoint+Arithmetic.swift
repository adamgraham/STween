//
//  FloatingPoint+Arithmetic.swift
//  STween
//
//  Created by Adam Graham on 1/14/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

// MARK: - Global Functions

internal func cos<Number: FloatingPoint>(_ x: Number) -> Number {
    return Number(cos(Double(x)))
}

internal func sin<Number: FloatingPoint>(_ x: Number) -> Number {
    return Number(sin(Double(x)))
}

internal func pow<Number: FloatingPoint>(_ x: Number, _ y: Number) -> Number {
    return Number(pow(Double(x), Double(y)))
}

// MARK: - Extensions: Initializers

extension FloatingPoint {

    /// Initializes a `FloatingPoint` value from a `Double` value.
    internal init(_ v: Double) {
        #if arch(i386) || arch(x86_64)
        switch Self(0) {
        case is Float32:
            self = Float32(v) as! Self
        case is Float64:
            self = Float64(v) as! Self
        case is Float80:
            self = Float80(v) as! Self
        case is CGFloat:
            self = CGFloat(v) as! Self
        default:
            self = Self(IntMax(v)) // possible precision loss
        }
        #else
        switch Self(0) {
        case is Float32:
            self = Float32(v) as! Self
        case is Float64:
            self = Float64(v) as! Self
        case is CGFloat:
            self = CGFloat(v) as! Self
        default:
            self = Self(IntMax(v)) // possible precision loss
        }
        #endif
    }

}

// MARK: - Extensions: Type Properties

extension FloatingPoint {

    /// `Self(0)`
    internal static var zero: Self {
        return Self(0)
    }

    /// `Self.pi` * 2
    internal static var pi_double: Self {
        return Self.pi.double
    }

    /// `Self.pi` / 2
    internal static var pi_half: Self {
        return Self.pi.half
    }

}

// MARK: - Extensions: Instance Properties

extension FloatingPoint {

    /// `self` * 2
    internal var double: Self {
        return self * Self(2)
    }

    /// `self` / 2
    internal var half: Self {
        return self / Self(2)
    }
    
}
