//
//  CALayer+Tweening.swift
//  STween
//
//  Created by Adam Graham on 1/18/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import Foundation
import QuartzCore

/// Provides tweening animation functionality to `CALayer`.
extension CALayer: Tweenable {

    /// The properties of `CALayer` that can be animated with a tween.
    public struct TweenProperty: TweenableProperty {

        public let animation: (CALayer) -> Tween.Animation

        private init<T: Interpolatable>(get: @escaping (CALayer) -> T,
                                        set: @escaping (CALayer, T) -> Void,
                                        value endValue: T) {

            self.animation = { (target: CALayer) in
                let startValue = get(target)
                return { (time: TimeInterval) in
                    set(target, T.interpolate(from: startValue, to: endValue, time: time))
                }
            }
        }

        /// The `frame` property of `CALayer`.
        public static func frame(_ value: CGRect) -> TweenProperty {
            return .init(get: { $0.frame }, set: { $0.frame = $1 }, value: value)
        }

        /// The `bounds` property of `CALayer`.
        public static func bounds(_ value: CGRect) -> TweenProperty {
            return .init(get: { $0.frame }, set: { $0.frame = $1 }, value: value)
        }

        /// The `position` property of `CALayer`.
        public static func position(_ value: CGPoint) -> TweenProperty {
            return .init(get: { $0.position }, set: { $0.position = $1 }, value: value)
        }

        /// The `zPosition` property of `CALayer`.
        public static func zPosition(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.zPosition }, set: { $0.zPosition = $1 }, value: value)
        }

        /// The `anchorPoint` property of `CALayer`.
        public static func anchorPoint(_ value: CGPoint) -> TweenProperty {
            return .init(get: { $0.anchorPoint }, set: { $0.anchorPoint = $1 }, value: value)
        }

        /// The `anchorPointZ` property of `CALayer`.
        public static func anchorPointZ(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.anchorPointZ }, set: { $0.anchorPointZ = $1 }, value: value)
        }

        /// The `transform` property of `CALayer`.
        public static func transform(_ value: CATransform3D) -> TweenProperty {
            return .init(get: { $0.transform }, set: { $0.transform = $1 }, value: value)
        }

        /// The `sublayerTransform` property of `CALayer`.
        public static func sublayerTransform(_ value: CATransform3D) -> TweenProperty {
            return .init(get: { $0.sublayerTransform }, set: { $0.sublayerTransform = $1 }, value: value)
        }

        /// The `contentsRect` property of `CALayer`.
        public static func contentsRect(_ value: CGRect) -> TweenProperty {
            return .init(get: { $0.contentsRect }, set: { $0.contentsRect = $1 }, value: value)
        }

        /// The `contentsCenter` property of `CALayer`.
        public static func contentsCenter(_ value: CGRect) -> TweenProperty {
            return .init(get: { $0.contentsCenter }, set: { $0.contentsCenter = $1 }, value: value)
        }

        /// The `contentsScale` property of `CALayer`.
        @available(iOS 4.0, *)
        public static func contentsScale(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.contentsScale }, set: { $0.contentsScale = $1 }, value: value)
        }

        /// The `cornerRadius` property of `CALayer`.
        public static func cornerRadius(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.cornerRadius }, set: { $0.cornerRadius = $1 }, value: value)
        }

        /// The `borderWidth` property of `CALayer`.
        public static func borderWidth(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.borderWidth }, set: { $0.borderWidth = $1 }, value: value)
        }

        /// The `borderColor` property of `CALayer`.
        public static func borderColor(_ value: CGColor) -> TweenProperty {
            return .init(get: { $0.borderColor ?? UIColor.clear.cgColor }, set: { $0.borderColor = $1 }, value: value)
        }

        /// The `backgroundColor` property of `CALayer`.
        public static func backgroundColor(_ value: CGColor) -> TweenProperty {
            return .init(get: { $0.backgroundColor ?? UIColor.clear.cgColor }, set: { $0.backgroundColor = $1 }, value: value)
        }

        /// The `opacity` property of `CALayer`.
        public static func opacity(_ value: Float) -> TweenProperty {
            return .init(get: { $0.opacity }, set: { $0.opacity = $1 }, value: value)
        }

        /// The `shadowColor` property of `CALayer`.
        public static func shadowColor(_ value: CGColor) -> TweenProperty {
            return .init(get: { $0.shadowColor ?? UIColor.clear.cgColor }, set: { $0.shadowColor = $1 }, value: value)
        }

        /// The `shadowOpacity` property of `CALayer`.
        public static func shadowOpacity(_ value: Float) -> TweenProperty {
            return .init(get: { $0.shadowOpacity }, set: { $0.shadowOpacity = $1 }, value: value)
        }

        /// The `shadowOffset` property of `CALayer`.
        public static func shadowOffset(_ value: CGSize) -> TweenProperty {
            return .init(get: { $0.shadowOffset }, set: { $0.shadowOffset = $1 }, value: value)
        }

        /// The `shadowRadius` property of `CALayer`.
        public static func shadowRadius(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.shadowRadius }, set: { $0.shadowRadius = $1 }, value: value)
        }

    }

}
