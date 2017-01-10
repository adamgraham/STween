//
//  UIView+Tweening.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UIKit.UIView`.
extension UIKit.UIView: Tweenable {

    /**
     An enum to describe the properties that can be animated with a tween
     on a `UIKit.UIView`.
     */
    public enum TweenProperty: TweenableProperty {

        /// A case to denote the `frame.midX` property of a `UIKit.UIView`.
        case x(CoreGraphics.CGFloat)
        /// A case to denote the `frame.midY` property of a `UIKit.UIView`.
        case y(CoreGraphics.CGFloat)
        /// A case to denote the `frame.width` property of a `UIKit.UIView`.
        case width(CoreGraphics.CGFloat)
        /// A case to denote the `frame.height` property of a `UIKit.UIView`.
        case height(CoreGraphics.CGFloat)
        /// A case to denote the `frame.origin` property of a `UIKit.UIView`.
        case origin(CoreGraphics.CGPoint)
        /// A case to denote the `frame.size` property of a `UIKit.UIView`.
        case size(CoreGraphics.CGSize)
        /// A case to denote the `frame` property of a `UIKit.UIView`.
        case frame(CoreGraphics.CGRect)

        public var associatedValue: InterpolationValue {
            switch self {
            case let .x(value),
                 let .y(value),
                 let .width(value),
                 let .height(value):
                return value as InterpolationValue
            case let .origin(value as InterpolationValue):
                return value
            case let .size(value as InterpolationValue):
                return value
            case let .frame(value as InterpolationValue):
                return value
            }
        }
        
    }

    public typealias PropertyType = UIKit.UIView.TweenProperty

    public func tweenableValue(get property: TweenProperty) -> InterpolationValue {
        switch property {
        case .x:
            return self.frame.midX
        case .y:
            return self.frame.midY
        case .origin:
            return self.frame.origin
        case .width:
            return self.frame.width
        case .height:
            return self.frame.height
        case .size:
            return self.frame.size
        case .frame:
            return self.frame
        }
    }

    public func tweenableValue(set property: TweenProperty, newValue: InterpolationValue) throws {
        switch property {
        case .x:
            self.frame.origin.x = try newValue.deserialize()
        case .y:
            self.frame.origin.y = try newValue.deserialize()
        case .origin:
            self.frame.origin = try newValue.deserialize()
        case .width:
            self.frame.size.width = try newValue.deserialize()
        case .height:
            self.frame.size.height = try newValue.deserialize()
        case .size:
            self.frame.size = try newValue.deserialize()
        case .frame:
            self.frame = try newValue.deserialize()
        }
    }

}
