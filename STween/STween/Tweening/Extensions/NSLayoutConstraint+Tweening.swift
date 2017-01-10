//
//  NSLayoutConstraint+Tweening.swift
//  STween
//
//  Created by Adam Graham on 8/28/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UIKit.NSLayoutConstraint`.
extension UIKit.NSLayoutConstraint: Tweenable {

    /**
     An enum to describe the properties that can be animated with a tween
     on a `UIKit.NSLayoutConstraint`.
     */
    public enum TweenProperty: TweenableProperty {

        /// A case to denote the `constant` property of a `UIKit.NSLayoutConstraint`.
        case constant(CoreGraphics.CGFloat)

        public var associatedValue: InterpolationValue {
            switch self {
            case let .constant(value as InterpolationValue):
                return value
            }
        }
        
    }

    public typealias PropertyType = NSLayoutConstraint.TweenProperty

    public func tweenableValue(get property: TweenProperty) -> InterpolationValue {
        switch property {
        case .constant:
            return self.constant
        }
    }

    public func tweenableValue(set property: TweenProperty, newValue: InterpolationValue) throws {
        switch property {
        case .constant:
            self.constant = try newValue.deserialize()
        }
    }
    
}
