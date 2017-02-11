//
//  UITextField+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UITextField`.
extension UITextField {

    public typealias TweenProperty = UITextFieldTweenProperty
    
}

/// An enum to describe the properties that can be animated with a tween
/// on a `UITextField`.
public enum UITextFieldTweenProperty: TweenableProperty {

    /// A case to denote the `textColor` property of a `UITextField`.
    case textColor(UIColor)
    /// A case to denote the `minimumFontSize` property of a `UITextField`.
    case minimumFontSize(CGFloat)

    public func value<T: Tweenable>(from object: T) throws -> UITextFieldTweenProperty {
        guard let textField = object as? UITextField else {
            throw TweenError.objectNotConvertible(object, to: UITextField.self)
        }

        switch self {
        case .textColor:
            return .textColor(textField.textColor ?? UIColor.clear)
        case .minimumFontSize:
            return .minimumFontSize(textField.minimumFontSize)
        }
    }

    public func apply<T: Tweenable>(to object: T) throws {
        guard let textField = object as? UITextField else {
            throw TweenError.objectNotConvertible(object, to: UITextField.self)
        }

        switch self {
        case let .textColor(value):
            textField.textColor = value
        case let .minimumFontSize(value):
            textField.minimumFontSize = value
        }
    }

    public static func interpolate(from startValue: UITextFieldTweenProperty, to endValue: UITextFieldTweenProperty, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UITextFieldTweenProperty {

        switch (startValue, endValue) {
        case let (.textColor(start), .textColor(end)):
            return .textColor(UIColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.minimumFontSize(start), .minimumFontSize(end)):
            return .minimumFontSize(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        default:
            return startValue
        }
    }

}
