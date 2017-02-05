//
//  CALayer+Tweening.swift
//  STween
//
//  Created by Adam Graham on 1/18/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `NSLayoutConstraint`.
extension CALayer: Tweenable {

    public typealias TweenProperty = CALayerTweenProperty

    /// An enum to describe the properties that can be animated with a tween
    /// on a `CALayer`.
    public enum CALayerTweenProperty: TweenableProperty {

        /// A case to denote the `frame` property of a `CALayer`.
        case frame(CGRect)
        /// A case to denote the `bounds` property of a `CALayer`.
        case bounds(CGRect)

        /// A case to denote the `position` property of a `CALayer`.
        case position(CGPoint)
        /// A case to denote the `zPosition` property of a `CALayer`.
        case zPosition(CGFloat)
        /// A case to denote the `anchorPoint` property of a `CALayer`.
        case anchorPoint(CGPoint)
        /// A case to denote the `anchorPointZ` property of a `CALayer`.
        case anchorPointZ(CGFloat)

        /// A case to denote the `transform` property of a `CALayer`.
        case transform(CATransform3D)
        /// A case to denote the `sublayerTransform` property of a `CALayer`.
        case sublayerTransform(CATransform3D)

        /// A case to denote the `contentsRect` property of a `CALayer`.
        case contentsRect(CGRect)
        /// A case to denote the `contentsCenter` property of a `CALayer`.
        case contentsCenter(CGRect)
        @available(iOS 4.0, *)
        /// A case to denote the `contentsScale` property of a `CALayer`.
        case contentsScale(CGFloat)

        /// A case to denote the `cornerRadius` property of a `CALayer`.
        case cornerRadius(CGFloat)
        /// A case to denote the `borderWidth` property of a `CALayer`.
        case borderWidth(CGFloat)
        /// A case to denote the `borderColor` property of a `CALayer`.
        case borderColor(CGColor)
        /// A case to denote the `backgroundColor` property of a `CALayer`.
        case backgroundColor(CGColor)
        /// A case to denote the `opacity` property of a `CALayer`.
        case opacity(Float)

        /// A case to denote the `shadowColor` property of a `CALayer`.
        case shadowColor(CGColor)
        /// A case to denote the `shadowOpacity` property of a `CALayer`.
        case shadowOpacity(Float)
        /// A case to denote the `shadowOffset` property of a `CALayer`.
        case shadowOffset(CGSize)
        /// A case to denote the `shadowRadius` property of a `CALayer`.
        case shadowRadius(CGFloat)

        public func value<T: Tweenable>(from object: T) throws -> CALayerTweenProperty {
            guard let layer = object as? CALayer else {
                throw TweenError.objectNotConvertible(object, to: CALayer.self)
            }

            switch self {
            case .frame:
                return .frame(layer.frame)
            case .bounds:
                return .bounds(layer.bounds)

            case .position:
                return .position(layer.position)
            case .zPosition:
                return .zPosition(layer.zPosition)
            case .anchorPoint:
                return .anchorPoint(layer.anchorPoint)
            case .anchorPointZ:
                return .anchorPointZ(layer.anchorPointZ)

            case .transform:
                return .transform(layer.transform)
            case .sublayerTransform:
                return .sublayerTransform(layer.sublayerTransform)

            case .contentsRect:
                return .contentsRect(layer.contentsRect)
            case .contentsCenter:
                return .contentsCenter(layer.contentsCenter)
            case .contentsScale:
                return .contentsScale(layer.contentsScale)

            case .cornerRadius:
                return .cornerRadius(layer.cornerRadius)
            case .borderWidth:
                return .borderWidth(layer.borderWidth)
            case .borderColor:
                return .borderColor(layer.borderColor ?? UIColor.clear.cgColor)
            case .backgroundColor:
                return .backgroundColor(layer.backgroundColor ?? UIColor.clear.cgColor)
            case .opacity:
                return .opacity(layer.opacity)

            case .shadowColor:
                return .shadowColor(layer.shadowColor ?? UIColor.clear.cgColor)
            case .shadowOpacity:
                return .shadowOpacity(layer.shadowOpacity)
            case .shadowOffset:
                return .shadowOffset(layer.shadowOffset)
            case .shadowRadius:
                return .shadowRadius(layer.shadowRadius)
            }
        }

        public func apply<T: Tweenable>(to object: T) throws {
            guard let layer = object as? CALayer else {
                throw TweenError.objectNotConvertible(object, to: CALayer.self)
            }

            switch self {
            case let .frame(value):
                layer.frame = value
            case let .bounds(value):
                layer.bounds = value

            case let .position(value):
                layer.position = value
            case let .zPosition(value):
                layer.zPosition = value
            case let .anchorPoint(value):
                layer.anchorPoint = value
            case let .anchorPointZ(value):
                layer.anchorPointZ = value

            case let .transform(value):
                layer.transform = value
            case let .sublayerTransform(value):
                layer.sublayerTransform = value

            case let .contentsRect(value):
                layer.contentsRect = value
            case let .contentsCenter(value):
                layer.contentsCenter = value
            case let .contentsScale(value):
                layer.contentsScale = value

            case let .cornerRadius(value):
                layer.cornerRadius = value
            case let .borderWidth(value):
                layer.borderWidth = value
            case let .borderColor(value):
                layer.borderColor = value
            case let .backgroundColor(value):
                layer.backgroundColor = value
            case let .opacity(value):
                layer.opacity = value

            case let .shadowColor(value):
                layer.shadowColor = value
            case let .shadowOpacity(value):
                layer.shadowOpacity = value
            case let .shadowOffset(value):
                layer.shadowOffset = value
            case let .shadowRadius(value):
                layer.shadowRadius = value
            }
        }

        public static func interpolate(from startValue: CALayerTweenProperty, to endValue: CALayerTweenProperty, withEase ease: Ease,
                                       elapsed: TimeInterval, duration: TimeInterval) -> CALayerTweenProperty {

            switch (startValue, endValue) {
            case let (.frame(start), .frame(end)):
                return .frame(CGRect.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.bounds(start), .bounds(end)):
                return .bounds(CGRect.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.position(start), .position(end)):
                return .position(CGPoint.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.zPosition(start), .zPosition(end)):
                return .zPosition(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.anchorPoint(start), .anchorPoint(end)):
                return .anchorPoint(CGPoint.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.anchorPointZ(start), .anchorPointZ(end)):
                return .anchorPointZ(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.transform(start), .transform(end)):
                return .transform(CATransform3D.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.sublayerTransform(start), .sublayerTransform(end)):
                return .sublayerTransform(CATransform3D.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.contentsRect(start), .contentsRect(end)):
                return .contentsRect(CGRect.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.contentsCenter(start), .contentsCenter(end)):
                return .contentsCenter(CGRect.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.contentsScale(start), .contentsScale(end)):
                return .contentsScale(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.cornerRadius(start), .cornerRadius(end)):
                return .cornerRadius(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.borderWidth(start), .borderWidth(end)):
                return .borderWidth(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.borderColor(start), .borderColor(end)):
                return .borderColor(CGColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.backgroundColor(start), .backgroundColor(end)):
                return .backgroundColor(CGColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.opacity(start), .opacity(end)):
                return .opacity(Float.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            case let (.shadowColor(start), .shadowColor(end)):
                return .shadowColor(CGColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.shadowOpacity(start), .shadowOpacity(end)):
                return .shadowOpacity(Float.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.shadowOffset(start), .shadowOffset(end)):
                return .shadowOffset(CGSize.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
            case let (.shadowRadius(start), .shadowRadius(end)):
                return .shadowRadius(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

            default:
                return startValue
            }
        }

    }

}
