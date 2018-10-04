//
//  UILabel+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/2/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UILabel`.
extension UILabel {}

/// An enum to describe the properties that can be animated with a tween on a `UILabel`.
public enum UILabelTweenProperty: Equatable {

    /// A case to denote the `textColor` property of a `UILabel`.
    case textColor(UIColor)
    /// A case to denote the `highlightedTextColor` property of a `UILabel`.
    case highlightedTextColor(UIColor)

    /// A case to denote the `shadowColor` property of a `UILabel`.
    case shadowColor(UIColor)
    /// A case to denote the `shadowOffset` property of a `UILabel`.
    case shadowOffset(CGSize)

    /// A case to denote the `minimumScaleFactor` property of a `UILabel`.
    @available(iOS 6.0, *)
    case minimumScaleFactor(CGFloat)
    /// A case to denote the `preferredMaxLayoutWidth` property of a `UILabel`.
    @available(iOS 6.0, *)
    case preferredMaxLayoutWidth(CGFloat)

}

extension UILabelTweenProperty: TweenableProperty {

    public typealias TweenableType = UILabel

    public func value(from object: UILabel) -> UILabelTweenProperty {
        switch self {
        case .textColor:
            return .textColor(object.textColor)
        case .highlightedTextColor:
            return .highlightedTextColor(object.highlightedTextColor ?? UIColor.clear)

        case .shadowColor:
            return .shadowColor(object.shadowColor ?? UIColor.clear)
        case .shadowOffset:
            return .shadowOffset(object.shadowOffset)

        case .minimumScaleFactor:
            return .minimumScaleFactor(object.minimumScaleFactor)
        case .preferredMaxLayoutWidth:
            return .preferredMaxLayoutWidth(object.preferredMaxLayoutWidth)
        }
    }

    public func apply(to object: UILabel) {
        switch self {
        case let .textColor(value):
            object.textColor = value
        case let .highlightedTextColor(value):
            object.highlightedTextColor = value

        case let .shadowColor(value):
            object.shadowColor = value
        case let .shadowOffset(value):
            object.shadowOffset = value

        case let .minimumScaleFactor(value):
            object.minimumScaleFactor = value
        case let .preferredMaxLayoutWidth(value):
            object.preferredMaxLayoutWidth = value
        }
    }

    public static func interpolate(from startValue: UILabelTweenProperty, to endValue: UILabelTweenProperty, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UILabelTweenProperty {

        switch (startValue, endValue) {
        case let (.textColor(start), .textColor(end)):
            return .textColor(UIColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.highlightedTextColor(start), .highlightedTextColor(end)):
            return .highlightedTextColor(UIColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.shadowColor(start), .shadowColor(end)):
            return .shadowColor(UIColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.shadowOffset(start), .shadowOffset(end)):
            return .shadowOffset(CGSize.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.minimumScaleFactor(start), .minimumScaleFactor(end)):
            return .minimumScaleFactor(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.preferredMaxLayoutWidth(start), .preferredMaxLayoutWidth(end)):
            return .preferredMaxLayoutWidth(CGFloat.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
            
        default:
            return startValue
        }
    }

}
