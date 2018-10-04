//
//  CALayer+Tweening.swift
//  STween
//
//  Created by Adam Graham on 1/18/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `CALayer`.
extension CALayer: Tweenable {}

/// An enum to describe the properties that can be animated with a tween on a `CALayer`.
public enum CALayerTweenProperty: Equatable {

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

}

extension CALayerTweenProperty: TweenableProperty {

    public typealias TweenableType = CALayer

    public func value(from object: CALayer) -> CALayerTweenProperty {
        switch self {
        case .frame:
            return .frame(object.frame)
        case .bounds:
            return .bounds(object.bounds)

        case .position:
            return .position(object.position)
        case .zPosition:
            return .zPosition(object.zPosition)
        case .anchorPoint:
            return .anchorPoint(object.anchorPoint)
        case .anchorPointZ:
            return .anchorPointZ(object.anchorPointZ)

        case .transform:
            return .transform(object.transform)
        case .sublayerTransform:
            return .sublayerTransform(object.sublayerTransform)

        case .contentsRect:
            return .contentsRect(object.contentsRect)
        case .contentsCenter:
            return .contentsCenter(object.contentsCenter)
        case .contentsScale:
            return .contentsScale(object.contentsScale)

        case .cornerRadius:
            return .cornerRadius(object.cornerRadius)
        case .borderWidth:
            return .borderWidth(object.borderWidth)
        case .borderColor:
            return .borderColor(object.borderColor ?? UIColor.clear.cgColor)
        case .backgroundColor:
            return .backgroundColor(object.backgroundColor ?? UIColor.clear.cgColor)
        case .opacity:
            return .opacity(object.opacity)

        case .shadowColor:
            return .shadowColor(object.shadowColor ?? UIColor.clear.cgColor)
        case .shadowOpacity:
            return .shadowOpacity(object.shadowOpacity)
        case .shadowOffset:
            return .shadowOffset(object.shadowOffset)
        case .shadowRadius:
            return .shadowRadius(object.shadowRadius)
        }
    }

    public func apply(to object: CALayer) {
        switch self {
        case let .frame(value):
            object.frame = value
        case let .bounds(value):
            object.bounds = value

        case let .position(value):
            object.position = value
        case let .zPosition(value):
            object.zPosition = value
        case let .anchorPoint(value):
            object.anchorPoint = value
        case let .anchorPointZ(value):
            object.anchorPointZ = value

        case let .transform(value):
            object.transform = value
        case let .sublayerTransform(value):
            object.sublayerTransform = value

        case let .contentsRect(value):
            object.contentsRect = value
        case let .contentsCenter(value):
            object.contentsCenter = value
        case let .contentsScale(value):
            object.contentsScale = value

        case let .cornerRadius(value):
            object.cornerRadius = value
        case let .borderWidth(value):
            object.borderWidth = value
        case let .borderColor(value):
            object.borderColor = value
        case let .backgroundColor(value):
            object.backgroundColor = value
        case let .opacity(value):
            object.opacity = value

        case let .shadowColor(value):
            object.shadowColor = value
        case let .shadowOpacity(value):
            object.shadowOpacity = value
        case let .shadowOffset(value):
            object.shadowOffset = value
        case let .shadowRadius(value):
            object.shadowRadius = value
        }
    }

    public static func interpolate(from startValue: CALayerTweenProperty, to endValue: CALayerTweenProperty, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> CALayerTweenProperty {

        switch (startValue, endValue) {
        case let (.frame(start), .frame(end)):
            return .frame(CGRect.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.bounds(start), .bounds(end)):
            return .bounds(CGRect.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.position(start), .position(end)):
            return .position(CGPoint.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.zPosition(start), .zPosition(end)):
            return .zPosition(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.anchorPoint(start), .anchorPoint(end)):
            return .anchorPoint(CGPoint.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.anchorPointZ(start), .anchorPointZ(end)):
            return .anchorPointZ(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.transform(start), .transform(end)):
            return .transform(CATransform3D.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.sublayerTransform(start), .sublayerTransform(end)):
            return .sublayerTransform(CATransform3D.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.contentsRect(start), .contentsRect(end)):
            return .contentsRect(CGRect.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.contentsCenter(start), .contentsCenter(end)):
            return .contentsCenter(CGRect.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.contentsScale(start), .contentsScale(end)):
            return .contentsScale(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.cornerRadius(start), .cornerRadius(end)):
            return .cornerRadius(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.borderWidth(start), .borderWidth(end)):
            return .borderWidth(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.borderColor(start), .borderColor(end)):
            return .borderColor(CGColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.backgroundColor(start), .backgroundColor(end)):
            return .backgroundColor(CGColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.opacity(start), .opacity(end)):
            return .opacity(Float.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.shadowColor(start), .shadowColor(end)):
            return .shadowColor(CGColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.shadowOpacity(start), .shadowOpacity(end)):
            return .shadowOpacity(Float.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.shadowOffset(start), .shadowOffset(end)):
            return .shadowOffset(CGSize.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.shadowRadius(start), .shadowRadius(end)):
            return .shadowRadius(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
            
        default:
            return startValue
        }
    }
        
}
