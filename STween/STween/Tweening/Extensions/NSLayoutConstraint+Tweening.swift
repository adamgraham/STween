//
//  NSLayoutConstraint+Tweening.swift
//  STween
//
//  Created by Adam Graham on 8/28/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UIKit.NSLayoutConstraint`.
extension UIKit.NSLayoutConstraint: Tweenable {

    /**
     An enum to describe the properties that can be animated with a tween
     on a `UIKit.NSLayoutConstraint`.
     */
    public enum TweenProperty {

        /// A case to denote the `constant` property of a `UIKit.NSLayoutConstraint`.
        case constant(CoreGraphics.CGFloat)
        /// A case to denote the `priority` property of a `UIKit.NSLayoutConstraint`.
        case priority(UIKit.UILayoutPriority)
        
    }

    public typealias Property = TweenProperty

    public func interpolationValues(for property: TweenProperty) -> InterpolationValues<TweenProperty> {
        switch property {
        case let .constant(endValue):
            return InterpolationValues(start: .constant(self.constant), end: .constant(endValue))
        case let .priority(endValue):
            return InterpolationValues(start: .priority(self.priority), end: .priority(endValue))
        }
    }

    public func interpolate(with ease: Ease, values: InterpolationValues<TweenProperty>,
                            elapsed: Foundation.TimeInterval, duration: Foundation.TimeInterval) throws {

        switch (values.start, values.end) {
        case let (.constant(startValue), .constant(endValue)):
            self.constant = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.priority(startValue), .priority(endValue)):
            self.priority = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        default:
            throw TweenError.invalidInterpolation(valueA: values.start, valueB: values.end, tweenable: self)
        }
    }
    
}
