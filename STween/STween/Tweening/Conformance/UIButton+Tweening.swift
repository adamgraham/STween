//
//  UIButton+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import Foundation
import UIKit

/// Provides tweening animation functionality to `UIButton`.
extension UIButton {

    /// The properties of `UIButton` that can be animated with a tween.
    public struct TweenPropertyDerived: TweenableProperty {

        public let animation: (UIButton) -> Tween.Animation

        private init<T: Interpolatable>(get: @escaping (UIButton) -> T,
                                        set: @escaping (UIButton, T) -> Void,
                                        value endValue: T) {

            self.animation = { (target: UIButton) in
                let startValue = get(target)
                return { (time: TimeInterval) in
                    set(target, T.interpolate(from: startValue, to: endValue, time: time))
                }
            }
        }

        /// The `contentEdgeInsets` property of `UIButton`.
        public static func contentEdgeInsets(_ value: UIEdgeInsets) -> TweenPropertyDerived {
            return .init(get: { $0.contentEdgeInsets }, set: { $0.contentEdgeInsets = $1 }, value: value)
        }

        /// The `titleEdgeInsets` property of `UIButton`.
        public static func titleEdgeInsets(_ value: UIEdgeInsets) -> TweenPropertyDerived {
            return .init(get: { $0.titleEdgeInsets }, set: { $0.titleEdgeInsets = $1 }, value: value)
        }

        /// The `imageEdgeInsets` property of `UIButton`.
        public static func imageEdgeInsets(_ value: UIEdgeInsets) -> TweenPropertyDerived {
            return .init(get: { $0.imageEdgeInsets }, set: { $0.imageEdgeInsets = $1 }, value: value)
        }

        /// The `titleColor` property of `UIButton`.
        public static func titleColor(_ value: UIColor, state: UIControl.State) -> TweenPropertyDerived {
            return .init(get: { $0.titleColor(for: state) ?? .clear }, set: { $0.setTitleColor($1, for: state) }, value: value)
        }

        /// The `titleShadowColor` property of `UIButton`.
        public static func titleShadowColor(_ value: UIColor, state: UIControl.State) -> TweenPropertyDerived {
            return .init(get: { $0.titleShadowColor(for: state) ?? .clear }, set: { $0.setTitleShadowColor($1, for: state) }, value: value)
        }

        /// The `tintColor` property of `UIButton`.
        @available(iOS 5.0, *)
        public static func tintColor(_ value: UIColor) -> TweenPropertyDerived {
            return .init(get: { $0.tintColor }, set: { $0.tintColor = $1 }, value: value)
        }

    }

}

/// Provides tweening animation functionality to `UIButton`.
public extension UIButton {

    @discardableResult
    func tween(to properties: TweenPropertyDerived..., duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(self, to: properties, duration: duration, completion: completion)
    }

    @discardableResult
    func tween(from properties: TweenPropertyDerived..., duration: TimeInterval, completion: Tween.Callback? = nil) -> Tween {
        return Tweener.default.animate(self, from: properties, duration: duration, completion: completion)
    }

}
