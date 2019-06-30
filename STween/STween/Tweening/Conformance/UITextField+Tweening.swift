//
//  UITextField+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import Foundation
import UIKit

/// Provides tweening animation functionality to `UITextField`.
extension UITextField {

    /// The properties of `UITextField` that can be animated with a tween.
    public struct TweenPropertyDerived: TweenableProperty {

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
        public static func textColor(_ value: UIColor) -> TweenPropertyDerived {
            return .init(get: { $0.textColor ?? .clear }, set: { $0.textColor = $1 }, value: value)
        }

        /// The `minimumFontSize` property of `UITextField`.
        public static func minimumFontSize(_ value: CGFloat) -> TweenPropertyDerived {
            return .init(get: { $0.minimumFontSize }, set: { $0.minimumFontSize = $1 }, value: value)
        }

    }

}

/// :nodoc:
public extension TweenAnimator where Target == UITextField {

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    func to(_ properties: UITextField.TweenPropertyDerived...) -> TweenAnimator<Target> {
        return to(properties)
    }

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    func from(_ properties: UITextField.TweenPropertyDerived...) -> TweenAnimator<Target> {
        return from(properties)
    }

}

/// :nodoc:
public extension UITextField {

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The `Tween` control for the animation.
    func tween(to properties: TweenPropertyDerived...) -> Tween {
        return Tweener.default.animate(self).to(properties)
    }

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The `Tween` control for the animation.
    func tween(from properties: TweenPropertyDerived...) -> Tween {
        return Tweener.default.animate(self).from(properties)
    }

}
