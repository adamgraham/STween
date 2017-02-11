//
//  UIView+Tweening.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UIView`.
extension UIView: Tweenable {

    public typealias TweenProperty = UIViewTweenProperty

    public func value(of property: UIViewTweenProperty) -> UIViewTweenProperty {
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

        case .center:
            return .center(self.center)
        case .centerX:
            return .centerX(self.center.x)
        case .centerY:
            return .centerY(self.center.y)

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

    public func apply(_ property: UIViewTweenProperty) {
        switch property {
        case let .x(value):
            self.frame.origin.x = value
        case let .y(value):
            self.frame.origin.y = value
        case let .origin(value):
            self.frame.origin = value

        case let .width(value):
            self.frame.size.width = value
        case let .height(value):
            self.frame.size.height = value
        case let .size(value):
            self.frame.size = value

        case let .left(value):
            self.frame.origin.x = value
        case let .right(value):
            self.frame.origin.x = -self.frame.size.width + value
        case let .top(value):
            self.frame.origin.y = value
        case let .bottom(value):
            self.frame.origin.y = -self.frame.size.height + value

        case let .frame(value):
            self.frame = value
        case let .bounds(value):
            self.bounds = value
        case let .transform(value):
            self.transform = value

        case let .center(value):
            self.center = value
        case let .centerX(value):
            self.center.x = value
        case let .centerY(value):
            self.center.y = value

        case let .alpha(value):
            self.alpha = value
        case let .backgroundColor(value):
            self.backgroundColor = value

        case let .tintColor(value):
            self.tintColor = value

        case let .contentScaleFactor(value):
            self.contentScaleFactor = value

        case let .layoutMargins(value):
            self.layoutMargins = value
        }
    }

}

/// An enum to describe the properties that can be animated with a tween
/// on a `UIView`.
public enum UIViewTweenProperty: TweenableProperty {

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

    public static func interpolate(from startValue: UIViewTweenProperty, to endValue: UIViewTweenProperty, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIViewTweenProperty {

        switch (startValue, endValue) {
        case let (.x(start), .x(end)):
            return .x(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.y(start), .y(end)):
            return .y(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.origin(start), .origin(end)):
            return .origin(CGPoint.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.width(start), .width(end)):
            return .width(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.height(start), .height(end)):
            return .height(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.size(start), .size(end)):
            return .size(CGSize.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.left(start), .left(end)):
            return .left(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.right(start), .right(end)):
            return .right(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.top(start), .top(end)):
            return .top(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.bottom(start), .bottom(end)):
            return .bottom(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.frame(start), .frame(end)):
            return .frame(CGRect.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.bounds(start), .bounds(end)):
            return .bounds(CGRect.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.transform(start), .transform(end)):
            return .transform(CGAffineTransform.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.center(start), .center(end)):
            return .center(CGPoint.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.centerX(start), .centerX(end)):
            return .centerX(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.centerY(start), .centerY(end)):
            return .centerY(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.alpha(start), .alpha(end)):
            return .alpha(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.backgroundColor(start), .backgroundColor(end)):
            return .backgroundColor(UIColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.tintColor(start), .tintColor(end)):
            return .tintColor(UIColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.contentScaleFactor(start), .contentScaleFactor(end)):
            return .contentScaleFactor(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.layoutMargins(start), .layoutMargins(end)):
            return .layoutMargins(UIEdgeInsets.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        default:
            return startValue
        }
    }

}
