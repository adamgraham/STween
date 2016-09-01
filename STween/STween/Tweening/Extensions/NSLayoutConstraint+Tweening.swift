//
//  NSLayoutConstraint+Tweening.swift
//  STween
//
//  Created by Adam Graham on 8/28/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

// MARK: - TweenableProperty

/**
 An enum to describe the properties that can be animated with a tween 
 on a `UIKit.NSLayoutConstraint`.
 */
public enum NSLayoutConstraintTweenableProperty: TweenableProperty {

    /// A case to denote the `constant` property of a `UIKit.NSLayoutConstraint`.
    case constant(CoreGraphics.CGFloat)

    public var interpolationValue: InterpolationValue {
        switch self {
        case let .constant(value as InterpolationValue):
            return value
        }
    }

}

// MARK: - Tweenable

extension UIKit.NSLayoutConstraint: Tweenable {

    public typealias PropertyType = NSLayoutConstraintTweenableProperty

    public func tweenableValue(get property: NSLayoutConstraintTweenableProperty) -> InterpolationValue {
        switch property {
        case .constant:
            return self.constant
        }
    }

    public func tweenableValue(set property: NSLayoutConstraintTweenableProperty, newValue: InterpolationValue) throws {
        switch property {
        case .constant:
            self.constant = try newValue.deserialize()
        }
    }
    
}
