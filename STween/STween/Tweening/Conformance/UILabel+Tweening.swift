//
//  UILabel+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/2/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UILabel`.
extension UILabel {

    public typealias TweenProperty = UILabelTweenProperty

}

/// An enum to describe the properties that can be animated with a tween
/// on a `UILabel`.
public enum UILabelTweenProperty: TweenableProperty {

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

    public func value<T: Tweenable>(from object: T) throws -> UILabelTweenProperty {
        guard let label = object as? UILabel else {
            throw TweenError.objectNotConvertible(object, to: UILabel.self)
        }

        switch self {
        case .textColor:
            return .textColor(label.textColor)
        case .highlightedTextColor:
            return .highlightedTextColor(label.highlightedTextColor ?? UIColor.clear)

        case .shadowColor:
            return .shadowColor(label.shadowColor ?? UIColor.clear)
        case .shadowOffset:
            return .shadowOffset(label.shadowOffset)

        case .minimumScaleFactor:
            return .minimumScaleFactor(label.minimumScaleFactor)
        case .preferredMaxLayoutWidth:
            return .preferredMaxLayoutWidth(label.preferredMaxLayoutWidth)
        }
    }

    public func apply<T: Tweenable>(to object: T) throws {
        guard let label = object as? UILabel else {
            throw TweenError.objectNotConvertible(object, to: UILabel.self)
        }

        switch self {
        case let .textColor(value):
            label.textColor = value
        case let .highlightedTextColor(value):
            label.highlightedTextColor = value

        case let .shadowColor(value):
            label.shadowColor = value
        case let .shadowOffset(value):
            label.shadowOffset = value

        case let .minimumScaleFactor(value):
            label.minimumScaleFactor = value
        case let .preferredMaxLayoutWidth(value):
            label.preferredMaxLayoutWidth = value
        }
    }

    public static func interpolate(from startValue: UILabelTweenProperty, to endValue: UILabelTweenProperty, withEase ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UILabelTweenProperty {

        switch (startValue, endValue) {
        case let (.textColor(start), .textColor(end)):
            return .textColor(UIColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
        case let (.highlightedTextColor(start), .highlightedTextColor(end)):
            return .highlightedTextColor(UIColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

        case let (.shadowColor(start), .shadowColor(end)):
            return .shadowColor(UIColor.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
        case let (.shadowOffset(start), .shadowOffset(end)):
            return .shadowOffset(CGSize.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

        case let (.minimumScaleFactor(start), .minimumScaleFactor(end)):
            return .minimumScaleFactor(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))
        case let (.preferredMaxLayoutWidth(start), .preferredMaxLayoutWidth(end)):
            return .preferredMaxLayoutWidth(CGFloat.interpolate(from: start, to: end, withEase: ease, elapsed: elapsed, duration: duration))

        default:
            return startValue
        }
    }

}
