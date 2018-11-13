//
//  UIView+Tweening.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import CoreGraphics
import Foundation
import UIKit

/// Provides tweening animation functionality to `UIView`.
extension UIView: Tweenable {}

/// The properties of a `UIView` that can be animated with a tween.
public enum UIViewTweenProperty: Equatable {

    /// The `frame.origin.x` property of a `UIView`.
    case x(CGFloat)
    /// The `frame.origin.y` property of a `UIView`.
    case y(CGFloat)
    /// The `frame.origin` property of a `UIView`.
    case origin(CGPoint)

    /// The `frame.size.width` property of a `UIView`.
    case width(CGFloat)
    /// The `frame.size.height` property of a `UIView`.
    case height(CGFloat)
    /// The `frame.size` property of a `UIView`.
    case size(CGSize)

    /// The `frame.minX` property of a `UIView`.
    case left(CGFloat)
    /// The `frame.maxX` property of a `UIView`.
    case right(CGFloat)
    /// The `frame.minY` property of a `UIView`.
    case top(CGFloat)
    /// The `frame.maxY` property of a `UIView`.
    case bottom(CGFloat)

    /// The `frame` property of a `UIView`.
    case frame(CGRect)
    /// The `bounds` property of a `UIView`.
    case bounds(CGRect)
    /// The `transform` property of a `UIView`.
    case transform(CGAffineTransform)

    /// The `center` property of a `UIView`.
    case center(CGPoint)
    /// The `center.x` property of a `UIView`.
    case centerX(CGFloat)
    /// The `center.y` property of a `UIView`.
    case centerY(CGFloat)

    /// The `alpha` property of a `UIView`.
    case alpha(CGFloat)
    /// The `backgroundColor` property of a `UIView`.
    case backgroundColor(UIColor)

    /// The `tintColor` property of a `UIView`.
    @available(iOS 7.0, *)
    case tintColor(UIColor)

    /// The `contentScaleFactor` property of a `UIView`.
    @available(iOS 4.0, *)
    case contentScaleFactor(CGFloat)

    /// The `layoutMargins` property of a `UIView`.
    @available(iOS 8.0, *)
    case layoutMargins(UIEdgeInsets)

}

extension UIViewTweenProperty: TweenableProperty {

    public func value(from object: UIView) -> UIViewTweenProperty {
        switch self {
        case .x:
            return .x(object.frame.origin.x)
        case .y:
            return .y(object.frame.origin.y)
        case .origin:
            return .origin(object.frame.origin)

        case .width:
            return .width(object.frame.width)
        case .height:
            return .height(object.frame.height)
        case .size:
            return .size(object.frame.size)

        case .left:
            return .left(object.frame.minX)
        case .right:
            return .right(object.frame.maxX)
        case .top:
            return .top(object.frame.minY)
        case .bottom:
            return .bottom(object.frame.maxY)

        case .frame:
            return .frame(object.frame)
        case .bounds:
            return .bounds(object.bounds)
        case .transform:
            return .transform(object.transform)

        case .center:
            return .center(object.center)
        case .centerX:
            return .centerX(object.center.x)
        case .centerY:
            return .centerY(object.center.y)

        case .alpha:
            return .alpha(object.alpha)
        case .backgroundColor:
            return .backgroundColor(object.backgroundColor ?? UIColor.clear)

        case .tintColor:
            return .tintColor(object.tintColor)

        case .contentScaleFactor:
            return .contentScaleFactor(object.contentScaleFactor)

        case .layoutMargins:
            return .layoutMargins(object.layoutMargins)
        }
    }

    public func apply(to object: UIView) {
        switch self {
        case let .x(value):
            object.frame.origin.x = value
        case let .y(value):
            object.frame.origin.y = value
        case let .origin(value):
            object.frame.origin = value

        case let .width(value):
            object.frame.size.width = value
        case let .height(value):
            object.frame.size.height = value
        case let .size(value):
            object.frame.size = value

        case let .left(value):
            object.frame.origin.x = value
        case let .right(value):
            object.frame.origin.x = -object.frame.size.width + value
        case let .top(value):
            object.frame.origin.y = value
        case let .bottom(value):
            object.frame.origin.y = -object.frame.size.height + value

        case let .frame(value):
            object.frame = value
        case let .bounds(value):
            object.bounds = value
        case let .transform(value):
            object.transform = value

        case let .center(value):
            object.center = value
        case let .centerX(value):
            object.center.x = value
        case let .centerY(value):
            object.center.y = value

        case let .alpha(value):
            object.alpha = value
        case let .backgroundColor(value):
            object.backgroundColor = value

        case let .tintColor(value):
            object.tintColor = value

        case let .contentScaleFactor(value):
            object.contentScaleFactor = value
            
        case let .layoutMargins(value):
            object.layoutMargins = value
        }
    }

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
