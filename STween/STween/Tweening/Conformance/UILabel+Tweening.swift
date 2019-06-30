//
//  UILabel+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/2/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import Foundation
import UIKit

/// Provides tweening animation functionality to `UILabel`.
extension UILabel {

    /// The properties of `UILabel` that can be animated with a tween.
    public struct TweenPropertyDerived: TweenableProperty {

        public let animation: (UILabel) -> Tween.Animation

        private init<T: Interpolatable>(get: @escaping (UILabel) -> T,
                                        set: @escaping (UILabel, T) -> Void,
                                        value endValue: T) {

            self.animation = { (target: UILabel) in
                let startValue = get(target)
                return { (time: TimeInterval) in
                    set(target, T.interpolate(from: startValue, to: endValue, time: time))
                }
            }
        }

        /// The `textColor` property of `UILabel`.
        public static func textColor(_ value: UIColor) -> TweenPropertyDerived {
            return .init(get: { $0.textColor ?? .clear }, set: { $0.textColor = $1 }, value: value)
        }

        /// The `highlightedTextColor` property of `UILabel`.
        public static func highlightedTextColor(_ value: UIColor) -> TweenPropertyDerived {
            return .init(get: { $0.highlightedTextColor ?? .clear }, set: { $0.highlightedTextColor = $1 }, value: value)
        }

        /// The `shadowColor` property of `UILabel`.
        public static func shadowColor(_ value: UIColor) -> TweenPropertyDerived {
            return .init(get: { $0.shadowColor ?? .clear }, set: { $0.shadowColor = $1 }, value: value)
        }

        /// The `shadowOffset` property of `UILabel`.
        public static func shadowOffset(_ value: CGSize) -> TweenPropertyDerived {
            return .init(get: { $0.shadowOffset }, set: { $0.shadowOffset = $1 }, value: value)
        }

        /// The `minimumScaleFactor` property of `UILabel`.
        @available(iOS 6.0, *)
        public static func minimumScaleFactor(_ value: CGFloat) -> TweenPropertyDerived {
            return .init(get: { $0.minimumScaleFactor }, set: { $0.minimumScaleFactor = $1 }, value: value)
        }

        /// The `preferredMaxLayoutWidth` property of `UILabel`.
        @available(iOS 6.0, *)
        public static func preferredMaxLayoutWidth(_ value: CGFloat) -> TweenPropertyDerived {
            return .init(get: { $0.preferredMaxLayoutWidth }, set: { $0.preferredMaxLayoutWidth = $1 }, value: value)
        }

    }

}

/// :nodoc:
public extension TweenAnimator where Target == UILabel {

    /// Animates tweenable properties from the target's current values *to* the desired values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    func to(_ properties: UILabel.TweenPropertyDerived...) -> TweenAnimator<Target> {
        return to(properties)
    }

    /// Animates tweenable properties *from* desired values to the target's current values.
    /// - parameter properties: The properties to animate.
    /// - returns: The current `TweenAnimator` instance to allow for additional customization.
    @discardableResult
    func from(_ properties: UILabel.TweenPropertyDerived...) -> TweenAnimator<Target> {
        return from(properties)
    }

}

/// :nodoc:
public extension UILabel {

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
