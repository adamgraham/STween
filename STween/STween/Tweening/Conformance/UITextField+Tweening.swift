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

    public func value(of property: UITextFieldTweenProperty) -> UITextFieldTweenProperty {
        switch property {
        case .textColor:
            return .textColor(self.textColor ?? UIColor.clear)
        case .minimumFontSize:
            return .minimumFontSize(self.minimumFontSize)
        }
    }

    public func apply(_ property: UITextFieldTweenProperty) {
        switch property {
        case let .textColor(value):
            self.textColor = value
        case let .minimumFontSize(value):
            self.minimumFontSize = value
        }
    }
    
}

/// An enum to describe the properties that can be animated with a tween
/// on a `UITextField`.
public enum UITextFieldTweenProperty: TweenableProperty {

    /// A case to denote the `textColor` property of a `UITextField`.
    case textColor(UIColor)
    /// A case to denote the `minimumFontSize` property of a `UITextField`.
    case minimumFontSize(CGFloat)

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
