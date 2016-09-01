//
//  RGBA.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A struct to represent an RGBA color i.e. red, green, blue, and alpha.
internal struct RGBA {

    /// The value of the red component of `self`.
    internal let red: CoreGraphics.CGFloat
    /// The value of the green component of `self`.
    internal let green: CoreGraphics.CGFloat
    /// The value of the blue component of `self`.
    internal let blue: CoreGraphics.CGFloat
    /// The value of the alpha component of `self`.
    internal let alpha: CoreGraphics.CGFloat

    /// The `UIKit.UIColor` equivalant of `self`.
    internal var color: UIKit.UIColor {
        return UIKit.UIColor(red: self.red,
                             green: self.green,
                             blue: self.blue,
                             alpha: self.alpha)
    }

}

// MARK: - Equatable

/**
 An epsilon value used to compare floating-point values in order to avoid
 floating-point precision errors.
 */
fileprivate let epsilon = CoreGraphics.CGFloat(CoreGraphics.FLT_EPSILON)

extension RGBA: Swift.Equatable {

    internal static func ==(lhs: RGBA, rhs: RGBA) -> Bool {
        return abs(lhs.red   - rhs.red)   <= epsilon &&
               abs(lhs.green - rhs.green) <= epsilon &&
               abs(lhs.blue  - rhs.blue)  <= epsilon &&
               abs(lhs.alpha - rhs.alpha) <= epsilon
    }

}

// MARK: - CustomStringConvertible

extension RGBA: Swift.CustomStringConvertible {

    /// A textual representation of `self`.
    internal var description: Swift.String {
        return "Red: \(self.red), Green: \(self.green), Blue: \(self.blue), Alpha: \(self.alpha)"
    }

}
