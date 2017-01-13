//
//  UIView+Tweening.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UIView`.
extension UIView: Tweenable {

    /**
     An enum to describe the properties that can be animated with a tween
     on a `UIView`.
     */
    public enum TweenProperty {

        /// A case to denote the `frame.origin.x` property of a `UIView`.
        case x(CGFloat)
        /// A case to denote the `frame.origin.y` property of a `UIView`.
        case y(CGFloat)
        /// A case to denote the `frame.origin` property of a `UIView`.
        case origin(CGPoint)

        /// A case to denote the `frame.size.width` property of a `UIView`.
        case width(CGFloat)
        /// A case to denote the `frame.size.height` property of a `UIView`.
        case height(CGFloat)
        /// A case to denote the `frame.size` property of a `UIView`.
        case size(CGSize)

        /// A case to denote the `frame.minX` property of a `UIView`.
        case left(CGFloat)
        /// A case to denote the `frame.maxX` property of a `UIView`.
        case right(CGFloat)
        /// A case to denote the `frame.minY` property of a `UIView`.
        case top(CGFloat)
        /// A case to denote the `frame.maxY` property of a `UIView`.
        case bottom(CGFloat)

        /// A case to denote the `frame` property of a `UIView`.
        case frame(CGRect)
        /// A case to denote the `bounds` property of a `UIView`.
        case bounds(CGRect)
        
        /// A case to denote the `center` property of a `UIView`.
        case center(CGPoint)
        /// A case to denote the `center.x` property of a `UIView`.
        case centerX(CGFloat)
        /// A case to denote the `center.y` property of a `UIView`.
        case centerY(CGFloat)

    }

    public typealias Property = TweenProperty

    public func interpolationValues(for property: TweenProperty) -> InterpolationValues<TweenProperty> {
        switch property {
        case let .x(endValue):
            return InterpolationValues(start: .x(self.frame.origin.x), end: .x(endValue))
        case let .y(endValue):
            return InterpolationValues(start: .y(self.frame.origin.y), end: .y(endValue))
        case let .origin(endValue):
            return InterpolationValues(start: .origin(self.frame.origin), end: .origin(endValue))

        case let .width(endValue):
            return InterpolationValues(start: .width(self.frame.width), end: .width(endValue))
        case let .height(endValue):
            return InterpolationValues(start: .height(self.frame.height), end: .height(endValue))
        case let .size(endValue):
            return InterpolationValues(start: .size(self.frame.size), end: .size(endValue))

        case let .left(endValue):
            return InterpolationValues(start: .left(self.frame.minX), end: .left(endValue))
        case let .right(endValue):
            return InterpolationValues(start: .right(self.frame.maxX), end: .right(endValue))
        case let .top(endValue):
            return InterpolationValues(start: .top(self.frame.minY), end: .top(endValue))
        case let .bottom(endValue):
            return InterpolationValues(start: .bottom(self.frame.maxY), end: .bottom(endValue))

        case let .frame(endValue):
            return InterpolationValues(start: .frame(self.frame), end: .frame(endValue))
        case let .bounds(endValue):
            return InterpolationValues(start: .bounds(self.bounds), end: .bounds(endValue))

        case let .centerX(endValue):
            return InterpolationValues(start: .centerX(self.center.x), end: .centerX(endValue))
        case let .centerY(endValue):
            return InterpolationValues(start: .centerY(self.center.y), end: .centerY(endValue))
        case let .center(endValue):
            return InterpolationValues(start: .center(self.center), end: .center(endValue))
        }
    }

    public func interpolate(with ease: Ease, values: InterpolationValues<TweenProperty>,
                            elapsed: TimeInterval, duration: TimeInterval) throws {

        switch (values.start, values.end) {
        case let (.x(startValue), .x(endValue)):
            self.frame.origin.x = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.y(startValue), .y(endValue)):
            self.frame.origin.y = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.origin(startValue), .origin(endValue)):
            self.frame.origin = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.width(startValue), .width(endValue)):
            self.frame.size.width = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.height(startValue), .height(endValue)):
            self.frame.size.height = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.size(startValue), .size(endValue)):
            self.frame.size = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.left(startValue), .left(endValue)):
            self.frame.origin.x = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.right(startValue), .right(endValue)):
            self.frame.origin.x = -self.frame.size.width + interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.top(startValue), .top(endValue)):
            self.frame.origin.y = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.bottom(startValue), .bottom(endValue)):
            self.frame.origin.y = -self.frame.size.height + interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.frame(startValue), .frame(endValue)):
            self.frame = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.bounds(startValue), .bounds(endValue)):
            self.bounds = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.centerX(startValue), .centerX(endValue)):
            self.center.x = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.centerY(startValue), .centerY(endValue)):
            self.center.y = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.center(startValue), .center(endValue)):
            self.center = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        default:
            throw TweenError.invalidInterpolation(valueA: values.start, valueB: values.end, tweenable: self)
        }
    }

}
