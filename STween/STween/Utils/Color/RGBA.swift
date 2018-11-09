//
//  RGBA.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import CoreGraphics
import UIKit

/// A struct to represent an RGBA color, i.e., red, green, blue, and alpha.
internal struct RGBA {

    /// The value of the red component of `self`.
    internal let red: CGFloat
    /// The value of the green component of `self`.
    internal let green: CGFloat
    /// The value of the blue component of `self`.
    internal let blue: CGFloat
    /// The value of the alpha component of `self`.
    internal let alpha: CGFloat

    /// The `UIColor` equivalant of `self`.
    internal var color: UIColor {
        return UIColor(red: self.red,
                       green: self.green,
                       blue: self.blue,
                       alpha: self.alpha)
    }

}

// MARK: - Equatable

/// An epsilon value used to compare floating-point numbers in order to avoid precision
/// errors.
private let epsilon = CGFloat(Float.ulpOfOne)

extension RGBA: Equatable {

    internal static func ==(lhs: RGBA, rhs: RGBA) -> Bool {
        return abs(lhs.red   - rhs.red)   <= epsilon &&
               abs(lhs.green - rhs.green) <= epsilon &&
               abs(lhs.blue  - rhs.blue)  <= epsilon &&
               abs(lhs.alpha - rhs.alpha) <= epsilon
    }

}

// MARK: - CustomStringConvertible

extension RGBA: CustomStringConvertible {

    /// A textual representation of `self`.
    internal var description: String {
        return "Red: \(self.red), Green: \(self.green), Blue: \(self.blue), Alpha: \(self.alpha)"
    }

}
