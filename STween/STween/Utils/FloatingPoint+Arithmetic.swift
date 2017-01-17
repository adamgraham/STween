//
//  FloatingPoint+Arithmetic.swift
//  STween
//
//  Created by Adam Graham on 1/14/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

// MARK: - Global Functions

internal func cos<T: FloatingPoint>(_ x: T) -> T {
    return T(cos(Double(floatingPoint: x)))
}

internal func sin<T: FloatingPoint>(_ x: T) -> T {
    return T(sin(Double(floatingPoint: x)))
}

internal func pow<T: FloatingPoint>(_ x: T, _ y: T) -> T {
    return T(pow(Double(floatingPoint: x), Double(floatingPoint: y)))
}

// MARK: - Extensions: Initializers

extension FloatingPoint {

    init(_ v: Double) {
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
            // possible precision loss
            self = Self(IntMax(v))
        }
    }

}

// MARK: - Extensions: Type Properties

extension FloatingPoint {

    internal static var zero: Self {
        return Self(0)
    }

    internal static var pi_double: Self {
        return Self.pi.double
    }

    internal static var pi_half: Self {
        return Self.pi.half
    }

}

// MARK: - Extensions: Instance Properties

extension FloatingPoint {

    internal var double: Self {
        return self * Self(2)
    }

    internal var half: Self {
        return self / Self(2)
    }
    
}
