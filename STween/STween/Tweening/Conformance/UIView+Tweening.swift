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

        public func value<T: Tweenable>(from object: T) throws -> UIViewTweenProperty {
            guard let view = object as? UIView else {
                throw TweenError.objectNotConvertible(object, to: UIView.self)
            }
            
            switch self {
            case .x:
                return .x(view.frame.origin.x)
            case .y:
                return .y(view.frame.origin.y)
            case .origin:
                return .origin(view.frame.origin)

            case .width:
                return .width(view.frame.width)
            case .height:
                return .height(view.frame.height)
            case .size:
                return .size(view.frame.size)

            case .left:
                return .left(view.frame.minX)
            case .right:
                return .right(view.frame.maxX)
            case .top:
                return .top(view.frame.minY)
            case .bottom:
                return .bottom(view.frame.maxY)

            case .frame:
                return .frame(view.frame)
            case .bounds:
                return .bounds(view.bounds)
            case .transform:
                return .transform(view.transform)

            case .center:
                return .center(view.center)
            case .centerX:
                return .centerX(view.center.x)
            case .centerY:
                return .centerY(view.center.y)

            case .alpha:
                return .alpha(view.alpha)
            case .backgroundColor:
                return .backgroundColor(view.backgroundColor ?? UIColor.clear)

            case .tintColor:
                return .tintColor(view.tintColor)
                
            case .contentScaleFactor:
                return .contentScaleFactor(view.contentScaleFactor)
                
            case .layoutMargins:
                return .layoutMargins(view.layoutMargins)
            }
        }

        public func apply<T: Tweenable>(to object: T) throws {
            guard let view = object as? UIView else {
                throw TweenError.objectNotConvertible(object, to: UIView.self)
            }

            switch self {
            case let .x(value):
                view.frame.origin.x = value
            case let .y(value):
                view.frame.origin.y = value
            case let .origin(value):
                view.frame.origin = value

            case let .width(value):
                view.frame.size.width = value
            case let .height(value):
                view.frame.size.height = value
            case let .size(value):
                view.frame.size = value

            case let .left(value):
                view.frame.origin.x = value
            case let .right(value):
                view.frame.origin.x = -view.frame.size.width + value
            case let .top(value):
                view.frame.origin.y = value
            case let .bottom(value):
                view.frame.origin.y = -view.frame.size.height + value

            case let .frame(value):
                view.frame = value
            case let .bounds(value):
                view.bounds = value
            case let .transform(value):
                view.transform = value

            case let .center(value):
                view.center = value
            case let .centerX(value):
                view.center.x = value
            case let .centerY(value):
                view.center.y = value

            case let .alpha(value):
                view.alpha = value
            case let .backgroundColor(value):
                view.backgroundColor = value

            case let .tintColor(value):
                view.tintColor = value

            case let .contentScaleFactor(value):
                view.contentScaleFactor = value

            case let .layoutMargins(value):
                view.layoutMargins = value
            }
        }

        public static func interpolate(from startValue: UIViewTweenProperty, to endValue: UIViewTweenProperty, withEase ease: Ease,
                                       elapsed: TimeInterval, duration: TimeInterval) -> UIViewTweenProperty {

            switch (startValue, endValue) {
            case let (.x(start), .x(end)):
                return .x(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.y(start), .y(end)):
                return .y(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.origin(start), .origin(end)):
                return .origin(CGPoint.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.width(start), .width(end)):
                return .width(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.height(start), .height(end)):
                return .height(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.size(start), .size(end)):
                return .size(CGSize.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.left(start), .left(end)):
                return .left(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.right(start), .right(end)):
                return .right(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.top(start), .top(end)):
                return .top(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.bottom(start), .bottom(end)):
                return .bottom(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.frame(start), .frame(end)):
                return .frame(CGRect.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.bounds(start), .bounds(end)):
                return .bounds(CGRect.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.transform(start), .transform(end)):
                return .transform(CGAffineTransform.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.center(start), .center(end)):
                return .center(CGPoint.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.centerX(start), .centerX(end)):
                return .centerX(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.centerY(start), .centerY(end)):
                return .centerY(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.alpha(start), .alpha(end)):
                return .alpha(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.backgroundColor(start), .backgroundColor(end)):
                return .backgroundColor(UIColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.tintColor(start), .tintColor(end)):
                return .tintColor(UIColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.contentScaleFactor(start), .contentScaleFactor(end)):
                return .contentScaleFactor(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.layoutMargins(start), .layoutMargins(end)):
                return .layoutMargins(UIEdgeInsets.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
                
            default:
                return startValue
            }
        }

    }

}
