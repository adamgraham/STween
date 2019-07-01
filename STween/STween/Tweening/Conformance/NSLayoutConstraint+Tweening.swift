//
//  NSLayoutConstraint+Tweening.swift
//  STween
//
//  Created by Adam Graham on 8/28/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// Provides tweening animation functionality to `NSLayoutConstraint`.
extension NSLayoutConstraint: Tweenable {

    /// The properties of `NSLayoutConstraint` that can be animated with a tween.
    public struct TweenProperty: TweenableProperty {

        public let animation: (NSLayoutConstraint) -> Tween.Animation

        private init<T: Interpolatable>(get: @escaping (NSLayoutConstraint) -> T,
                                        set: @escaping (NSLayoutConstraint, T) -> Void,
                                        value endValue: T) {

            self.animation = { (target: NSLayoutConstraint) in
                let startValue = get(target)
                return { (time: TimeInterval) in
                    set(target, T.interpolate(from: startValue, to: endValue, time: time))
                }
            }
        }

        /// The `constant` property of `NSLayoutConstraint`.
        public static func constant(_ value: CGFloat) -> TweenProperty {
            return .init(get: { $0.constant }, set: { $0.constant = $1 }, value: value)
        }

    }

}
