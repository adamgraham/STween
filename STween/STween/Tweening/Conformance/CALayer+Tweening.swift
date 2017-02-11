//
//  CALayer+Tweening.swift
//  STween
//
//  Created by Adam Graham on 1/18/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `CALayer`.
extension CALayer: Tweenable {

    public func value(of property: CALayerTweenProperty) -> CALayerTweenProperty {
        switch property {
        case .frame:
            return .frame(self.frame)
        case .bounds:
            return .bounds(self.bounds)

        case .position:
            return .position(self.position)
        case .zPosition:
            return .zPosition(self.zPosition)
        case .anchorPoint:
            return .anchorPoint(self.anchorPoint)
        case .anchorPointZ:
            return .anchorPointZ(self.anchorPointZ)

        case .transform:
            return .transform(self.transform)
        case .sublayerTransform:
            return .sublayerTransform(self.sublayerTransform)

        case .contentsRect:
            return .contentsRect(self.contentsRect)
        case .contentsCenter:
            return .contentsCenter(self.contentsCenter)
        case .contentsScale:
            return .contentsScale(self.contentsScale)

        case .cornerRadius:
            return .cornerRadius(self.cornerRadius)
        case .borderWidth:
            return .borderWidth(self.borderWidth)
        case .borderColor:
            return .borderColor(self.borderColor ?? UIColor.clear.cgColor)
        case .backgroundColor:
            return .backgroundColor(self.backgroundColor ?? UIColor.clear.cgColor)
        case .opacity:
            return .opacity(self.opacity)

        case .shadowColor:
            return .shadowColor(self.shadowColor ?? UIColor.clear.cgColor)
        case .shadowOpacity:
            return .shadowOpacity(self.shadowOpacity)
        case .shadowOffset:
            return .shadowOffset(self.shadowOffset)
        case .shadowRadius:
            return .shadowRadius(self.shadowRadius)
        }
    }

    public func apply(_ property: CALayerTweenProperty) {
        switch property {
        case let .frame(value):
            self.frame = value
        case let .bounds(value):
            self.bounds = value

        case let .position(value):
            self.position = value
        case let .zPosition(value):
            self.zPosition = value
        case let .anchorPoint(value):
            self.anchorPoint = value
        case let .anchorPointZ(value):
            self.anchorPointZ = value

        case let .transform(value):
            self.transform = value
        case let .sublayerTransform(value):
            self.sublayerTransform = value

        case let .contentsRect(value):
            self.contentsRect = value
        case let .contentsCenter(value):
            self.contentsCenter = value
        case let .contentsScale(value):
            self.contentsScale = value

        case let .cornerRadius(value):
            self.cornerRadius = value
        case let .borderWidth(value):
            self.borderWidth = value
        case let .borderColor(value):
            self.borderColor = value
        case let .backgroundColor(value):
            self.backgroundColor = value
        case let .opacity(value):
            self.opacity = value

        case let .shadowColor(value):
            self.shadowColor = value
        case let .shadowOpacity(value):
            self.shadowOpacity = value
        case let .shadowOffset(value):
            self.shadowOffset = value
        case let .shadowRadius(value):
            self.shadowRadius = value
        }
    }

}

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
