//
//  DoubleConvertible.swift
//  STween
//
//  Created by Adam Graham on 7/10/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide conversion functionality to a `Swift.Double` value.
internal protocol DoubleConvertible {

    /// The `Swift.Double` value of `self`.
    var doubleValue: Swift.Double { get }

}

// MARK: - Helpers

extension Swift.Double {

    /// Initializes a `Swift.Double` value from a `DoubleConvertible` type.
    internal init(convertible: DoubleConvertible) {
        self = convertible.doubleValue
    }

}

// MARK: - Conformance

extension Swift.UInt: DoubleConvertible {

    internal var doubleValue: Swift.Double {
        return Swift.Double(self)
    }

}

extension Swift.Int: DoubleConvertible {

    internal var doubleValue: Swift.Double {
        return Swift.Double(self)
    }
    
}

extension Swift.Double: DoubleConvertible {

    internal var doubleValue: Swift.Double {
        return self
    }

}

extension Swift.Float: DoubleConvertible {

    internal var doubleValue: Swift.Double {
        return Swift.Double(self)
    }
    
}

extension CoreGraphics.CGFloat: DoubleConvertible {

    internal var doubleValue: Swift.Double {
        return Swift.Double(self)
    }

}
