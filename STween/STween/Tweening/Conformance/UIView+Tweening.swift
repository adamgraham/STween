//
//  UIView+Tweening.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UIView`.
extension UIView: Tweenable {

    /// An enum to describe the properties that can be animated with a tween
    /// on a `UIView`.
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
        /// A case to denote the `transform` property of a `UIView`.
        case transform(CGAffineTransform)
        
        /// A case to denote the `center` property of a `UIView`.
        case center(CGPoint)
        /// A case to denote the `center.x` property of a `UIView`.
        case centerX(CGFloat)
        /// A case to denote the `center.y` property of a `UIView`.
        case centerY(CGFloat)

        /// A case to denote the `alpha` property of a `UIView`.
        case alpha(CGFloat)
        /// A case to denote the `backgroundColor` property of a `UIView`.
        case backgroundColor(UIColor)
        /// A case to denote the `tintColor` property of a `UIView`.
        @available(iOS 7.0, *)
        case tintColor(UIColor)

        /// A case to denote the `contentScaleFactor` property of a `UIView`.
        @available(iOS 4.0, *)
        case contentScaleFactor(CGFloat)

        /// A case to denote the `layoutMargins` property of a `UIView`.
        @available(iOS 8.0, *)
        case layoutMargins(UIEdgeInsets)

    }

    public func interpolationStartValue(for property: TweenProperty) -> TweenProperty {
        switch property {
        case .x:
            return .x(self.frame.origin.x)
        case .y:
            return .y(self.frame.origin.y)
        case .origin:
            return .origin(self.frame.origin)

        case .width:
            return .width(self.frame.width)
        case .height:
            return .height(self.frame.height)
        case .size:
            return .size(self.frame.size)

        case .left:
            return .left(self.frame.minX)
        case .right:
            return .right(self.frame.maxX)
        case .top:
            return .top(self.frame.minY)
        case .bottom:
            return .bottom(self.frame.maxY)

        case .frame:
            return .frame(self.frame)
        case .bounds:
            return .bounds(self.bounds)
        case .transform:
            return .transform(self.transform)

        case .centerX:
            return .centerX(self.center.x)
        case .centerY:
            return .centerY(self.center.y)
        case .center:
            return .center(self.center)

        case .alpha:
            return .alpha(self.alpha)
        case .backgroundColor:
            return .backgroundColor(self.backgroundColor ?? UIColor.clear)
        case .tintColor:
            return .tintColor(self.tintColor)

        case .contentScaleFactor:
            return .contentScaleFactor(self.contentScaleFactor)

        case .layoutMargins:
            return .layoutMargins(self.layoutMargins)
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
        case let (.transform(startValue), .transform(endValue)):
            self.transform = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.centerX(startValue), .centerX(endValue)):
            self.center.x = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.centerY(startValue), .centerY(endValue)):
            self.center.y = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.center(startValue), .center(endValue)):
            self.center = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.alpha(startValue), .alpha(endValue)):
            self.alpha = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)
        case let (.backgroundColor(startValue), .backgroundColor(endValue)):
            let rgba = interpolate(with: ease, startValue: startValue.rgba, endValue: endValue.rgba, elapsed: elapsed, duration: duration)
            self.backgroundColor = rgba.color
        case let (.tintColor(startValue), .tintColor(endValue)):
            let rgba = interpolate(with: ease, startValue: startValue.rgba, endValue: endValue.rgba, elapsed: elapsed, duration: duration)
            self.tintColor = rgba.color

        case let (.contentScaleFactor(startValue), .contentScaleFactor(endValue)):
            self.contentScaleFactor = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        case let (.layoutMargins(startValue), .layoutMargins(endValue)):
            self.layoutMargins = interpolate(with: ease, startValue: startValue, endValue: endValue, elapsed: elapsed, duration: duration)

        default:
            throw TweenError.invalidInterpolation(valueA: values.start, valueB: values.end, tweenable: self)
        }
    }

}
