//
//  UITextField+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import CoreGraphics
import Foundation
import UIKit

/// Provides tweening animation functionality to `UITextField`.
extension UITextField {}

/// The properties of a `UITextField` that can be animated with a tween.
public enum UITextFieldTweenProperty: Equatable {

    /// The `textColor` property of a `UITextField`.
    case textColor(UIColor)
    /// The `minimumFontSize` property of a `UITextField`.
    case minimumFontSize(CGFloat)

}

extension UITextFieldTweenProperty: TweenableProperty {

    public func value(from object: UITextField) -> UITextFieldTweenProperty {
        switch self {
        case .textColor:
            return .textColor(object.textColor ?? UIColor.clear)
        case .minimumFontSize:
            return .minimumFontSize(object.minimumFontSize)
        }
    }

    public func apply(to object: UITextField) {
        switch self {
        case let .textColor(value):
            object.textColor = value
        case let .minimumFontSize(value):
            object.minimumFontSize = value
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
