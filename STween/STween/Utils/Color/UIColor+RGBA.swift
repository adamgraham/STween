//
//  UIColor+RGBA.swift
//  STween
//
//  Created by Adam Graham on 6/20/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import CoreGraphics
import UIKit

/// An extension to provide `UIColor` instances with additional computed properties to
/// retrieve color components.
extension UIColor {

    /// The red, green, blue, and alpha components of `self`.
    internal var components: (
        red: CGFloat,
        green: CGFloat,
        blue: CGFloat,
        alpha: CGFloat) {

        var red: CGFloat = 0.0
        var green: CGFloat = 0.0
        var blue: CGFloat = 0.0
        var alpha: CGFloat = 0.0

        self.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        return (red: red, green: green, blue: blue, alpha: alpha)
    }

    /// The value of the red component of `self`.
    internal var red: CGFloat {
        return self.components.red
    }

    /// The value of the green component of `self`.
    internal var green: CGFloat {
        return self.components.green
    }

    /// The value of the blue component of `self`.
    internal var blue: CGFloat {
        return self.components.blue
    }

    /// The value of the alpha component of `self`.
    internal var alpha: CGFloat {
        return self.components.alpha
    }

    /// The `RGBA` representation of `self`.
    internal var rgba: RGBA {
        let components = self.components
        return RGBA(red: components.red,
                    green: components.green,
                    blue: components.blue,
                    alpha: components.alpha)
    }

}
