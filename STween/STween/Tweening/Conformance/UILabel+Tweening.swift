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

    public func value(of property: UILabelTweenProperty) -> UILabelTweenProperty {
        switch property {
        case .textColor:
            return .textColor(self.textColor)
        case .highlightedTextColor:
            return .highlightedTextColor(self.highlightedTextColor ?? UIColor.clear)

        case .shadowColor:
            return .shadowColor(self.shadowColor ?? UIColor.clear)
        case .shadowOffset:
            return .shadowOffset(self.shadowOffset)

        case .minimumScaleFactor:
            return .minimumScaleFactor(self.minimumScaleFactor)
        case .preferredMaxLayoutWidth:
            return .preferredMaxLayoutWidth(self.preferredMaxLayoutWidth)
        }
    }

    public func apply(_ property: UILabelTweenProperty) {
        switch property {
        case let .textColor(value):
            self.textColor = value
        case let .highlightedTextColor(value):
            self.highlightedTextColor = value

        case let .shadowColor(value):
            self.shadowColor = value
        case let .shadowOffset(value):
            self.shadowOffset = value

        case let .minimumScaleFactor(value):
            self.minimumScaleFactor = value
        case let .preferredMaxLayoutWidth(value):
            self.preferredMaxLayoutWidth = value
        }
    }

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
