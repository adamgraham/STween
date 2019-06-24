//
//  UIView+Tweening.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation
import UIKit

/// Provides tweening animation functionality to `UIView`.
extension UIView: Tweenable {

    /// The properties of `UIView` that can be animated with a tween.
    public struct TweenProperty: TweenableProperty {

        public let animation: (UIView) -> Tween.Animation

        private init<T: Interpolatable>(get: @escaping (UIView) -> T,
                                        set: @escaping (UIView, T) -> Void,
                                        value endValue: T) {

            self.animation = { (target: UIView) in
                let startValue = get(target)
                return { (time: TimeInterval) in
                    set(target, T.interpolate(from: startValue, to: endValue, time: time))
                }
            }
        }

        /// The `frame.origin.x` property of `UIView`.
        public static func x(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.origin.x }, set: { $0.frame.origin.x = $1 }, value: value)
        }

        /// The `frame.origin.y` property of `UIView`.
        public static func y(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.origin.y }, set: { $0.frame.origin.y = $1 }, value: value)
        }

        /// The `frame.origin` property of `UIView`.
        public static func origin(_ value: CGPoint) -> TweenProperty {
            return .init(get: { $0.frame.origin }, set: { $0.frame.origin = $1 }, value: value)
        }

        /// The `frame.size.width` property of `UIView`.
        public static func width(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.size.width }, set: { $0.frame.size.width = $1 }, value: value)
        }

        /// The `frame.size.height` property of `UIView`.
        public static func height(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.size.height }, set: { $0.frame.size.height = $1 }, value: value)
        }

        /// The `frame.size` property of `UIView`.
        public static func size(_ value: CGSize) -> TweenProperty {
            return .init(get: { $0.frame.size }, set: { $0.frame.size = $1 }, value: value)
        }

        /// The `frame.minX` property of `UIView`.
        public static func left(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.minX }, set: { $0.frame.origin.x = $1 }, value: value)
        }

        /// The `frame.maxX` property of `UIView`.
        public static func right(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.maxX }, set: { $0.frame.origin.x = -$0.frame.size.width + $1 }, value: value)
        }

        /// The `frame.minY` property of `UIView`.
        public static func top(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.minY }, set: { $0.frame.origin.y = $1 }, value: value)
        }

        /// The `frame.maxY` property of `UIView`.
        public static func bottom(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.frame.maxY }, set: { $0.frame.origin.y = -$0.frame.size.height + $1 }, value: value)
        }

        /// The `frame` property of `UIView`.
        public static func frame(_ value: CGRect) -> TweenProperty {
            return .init(get: { $0.frame }, set: { $0.frame = $1 }, value: value)
        }

        /// The `bounds` property of `UIView`.
        public static func bounds(_ value: CGRect) -> TweenProperty {
            return .init(get: { $0.bounds }, set: { $0.bounds = $1 }, value: value)
        }

        /// The `transform` property of `UIView`.
        public static func transform(_ value: CGAffineTransform) -> TweenProperty {
            return .init(get: { $0.transform }, set: { $0.transform = $1 }, value: value)
        }

        /// The `center` property of `UIView`.
        public static func center(_ value: CGPoint) -> TweenProperty {
            return .init(get: { $0.center }, set: { $0.center = $1 }, value: value)
        }

        /// The `center.x` property of `UIView`.
        public static func centerX(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.center.x }, set: { $0.center.x = $1 }, value: value)
        }

        /// The `center.y` property of `UIView`.
        public static func centerY(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.center.y }, set: { $0.center.y = $1 }, value: value)
        }

        /// The `alpha` property of `UIView`.
        public static func alpha(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.alpha }, set: { $0.alpha = $1 }, value: value)
        }

        /// The `backgroundColor` property of `UIView`.
        public static func backgroundColor(_ value: UIColor) -> TweenProperty {
            return .init(get: { $0.backgroundColor ?? .clear }, set: { $0.backgroundColor = $1 }, value: value)
        }

        /// The `tintColor` property of `UIView`.
        @available(iOS 7.0, *)
        public static func tintColor(_ value: UIColor) -> TweenProperty {
            return .init(get: { $0.tintColor }, set: { $0.tintColor = $1 }, value: value)
        }

        /// The `contentScaleFactor` property of `UIView`.
        @available(iOS 4.0, *)
        public static func contentScaleFactor(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.contentScaleFactor }, set: { $0.contentScaleFactor = $1 }, value: value)
        }

        /// The `layoutMargins` property of `UIView`.
        @available(iOS 8.0, *)
        public static func layoutMargins(_ value: UIEdgeInsets) -> TweenProperty {
            return .init(get: { $0.layoutMargins }, set: { $0.layoutMargins = $1 }, value: value)
        }

    }

}
