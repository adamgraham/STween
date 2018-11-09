//
//  NSLayoutConstraint+Tweening.swift
//  STween
//
//  Created by Adam Graham on 8/28/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import CoreGraphics
import Foundation

/// An extension to provide tweening animation functionality to `NSLayoutConstraint`.
extension NSLayoutConstraint: Tweenable {}

/// An enum to describe the properties that can be animated with a tween on a `NSLayoutConstraint`.
public enum NSLayoutConstraintTweenProperty: Equatable {

    /// A case to denote the `constant` property of a `NSLayoutConstraint`.
    case constant(CGFloat)

}

extension NSLayoutConstraintTweenProperty: TweenableProperty {

    public typealias TweenableType = NSLayoutConstraint

    public func value(from object: NSLayoutConstraint) -> NSLayoutConstraintTweenProperty {
        switch self {
        case .constant:
            return .constant(object.constant)
        }
    }

    public func apply(to object: NSLayoutConstraint) {
        switch self {
        case let .constant(value):
            object.constant = value
        }
    }

    public static func interpolate(from startValue: NSLayoutConstraintTweenProperty, to endValue: NSLayoutConstraintTweenProperty, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> NSLayoutConstraintTweenProperty {

        switch (startValue, endValue) {
        case let (.constant(start), .constant(end)):
            return .constant(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        }
    }

}
