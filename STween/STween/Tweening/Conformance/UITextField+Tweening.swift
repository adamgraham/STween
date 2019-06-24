//
//  UITextField+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import Foundation
import UIKit

/// The properties of `UITextField` that can be animated with a tween.
public struct UITextFieldTweenProperty: TweenableProperty {

    public let animation: (UITextField) -> Tween.Animation

    private init<T: Interpolatable>(get: @escaping (UITextField) -> T,
                                    set: @escaping (UITextField, T) -> Void,
                                    value endValue: T) {

        self.animation = { (target: UITextField) in
            let startValue = get(target)
            return { (time: TimeInterval) in
                set(target, T.interpolate(from: startValue, to: endValue, time: time))
            }
        }
    }

    /// The `textColor` property of `UITextField`.
    public static func textColor(_ value: UIColor) -> UITextFieldTweenProperty {
        return .init(get: { $0.textColor ?? .clear }, set: { $0.textColor = $1 }, value: value)
    }

    /// The `minimumFontSize` property of `UITextField`.
    public static func minimumFontSize(_ value: CGFloat) -> UITextFieldTweenProperty {
        return .init(get: { $0.minimumFontSize }, set: { $0.minimumFontSize = $1 }, value: value)
    }

}

/// Provides tweening animation functionality to `UITextField`.
public extension UITextField {

    @discardableResult
    func tween(to property: UITextFieldTweenProperty, duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(tweens: [property.animation(self)],
                                       duration: duration,
                                       completion: completion)
    }

    @discardableResult
    func tween(to properties: [UITextFieldTweenProperty], duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(tweens: properties.map { $0.animation(self) },
                                       duration: duration,
                                       completion: completion)
    }

    @discardableResult
    func tween(from property: UITextFieldTweenProperty, duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(reversedTweens: [property.animation(self)],
                                       duration: duration,
                                       completion: completion)
    }

    @discardableResult
    func tween(from properties: [UITextFieldTweenProperty], duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(reversedTweens: properties.map { $0.animation(self) },
                                       duration: duration,
                                       completion: completion)
    }

}
