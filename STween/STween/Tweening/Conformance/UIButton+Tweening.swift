//
//  UIButton+Tweening.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// An extension to provide tweening animation functionality to `UIButton`.
extension UIButton {

    public typealias TweenProperty = UIButtonTweenProperty

    public func value(of property: UIButtonTweenProperty) -> UIButtonTweenProperty {
        switch property {
        case .contentEdgeInsets:
            return .contentEdgeInsets(self.contentEdgeInsets)
        case .titleEdgeInsets:
            return .titleEdgeInsets(self.titleEdgeInsets)
        case .imageEdgeInsets:
            return .imageEdgeInsets(self.imageEdgeInsets)

        case let .titleColor(_, state):
            return .titleColor(self.titleColor(for: state) ?? UIColor.clear, state)
        case let .titleShadowColor(_, state):
            return .titleShadowColor(self.titleShadowColor(for: state) ?? UIColor.clear, state)

        case .tintColor:
            return .tintColor(self.tintColor)
        }
    }

    public func apply(_ property: UIButtonTweenProperty) {
        switch property {
        case let .contentEdgeInsets(value):
            self.contentEdgeInsets = value
        case let .titleEdgeInsets(value):
            self.titleEdgeInsets = value
        case let .imageEdgeInsets(value):
            self.imageEdgeInsets = value

        case let .titleColor(color, state):
            self.setTitleColor(color, for: state)
        case let .titleShadowColor(color, state):
            self.setTitleShadowColor(color, for: state)

        case let .tintColor(value):
            self.tintColor = value
        }
    }
    
}

/// An enum to describe the properties that can be animated with a tween
/// on a `UIButton`.
public enum UIButtonTweenProperty: TweenableProperty {

    /// A case to denote the `contentEdgeInsets` property of a `UIButton`.
    case contentEdgeInsets(UIEdgeInsets)
    /// A case to denote the `titleEdgeInsets` property of a `UIButton`.
    case titleEdgeInsets(UIEdgeInsets)
    /// A case to denote the `imageEdgeInsets` property of a `UIButton`.
    case imageEdgeInsets(UIEdgeInsets)

    /// A case to denote the `titleColor(state:)` function of a `UIButton`.
    case titleColor(UIColor, UIControlState)
    /// A case to denote the `titleShadowColor(state:)` function of a `UIButton`.
    case titleShadowColor(UIColor, UIControlState)

    /// A case to denote the `tintColor` property of a `UIButton`.
    @available(iOS 5.0, *)
    case tintColor(UIColor)

    public static func interpolate(from startValue: UIButtonTweenProperty, to endValue: UIButtonTweenProperty, with ease: Ease,
                                   elapsed: TimeInterval, duration: TimeInterval) -> UIButtonTweenProperty {

        switch (startValue, endValue) {
        case let (.contentEdgeInsets(start), .contentEdgeInsets(end)):
            return .contentEdgeInsets(UIEdgeInsets.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.titleEdgeInsets(start), .titleEdgeInsets(end)):
            return .titleEdgeInsets(UIEdgeInsets.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))
        case let (.imageEdgeInsets(start), .imageEdgeInsets(end)):
            return .imageEdgeInsets(UIEdgeInsets.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        case let (.titleColor(start), .titleColor(end)):
            return .titleColor(UIColor.interpolate(from: start.0, to: end.0, with: ease, elapsed: elapsed, duration: duration), end.1)
        case let (.titleShadowColor(start), .titleShadowColor(end)):
            return .titleShadowColor(UIColor.interpolate(from: start.0, to: end.0, with: ease, elapsed: elapsed, duration: duration), end.1)

        case let (.tintColor(start), .tintColor(end)):
            return .tintColor(UIColor.interpolate(from: start, to: end, with: ease, elapsed: elapsed, duration: duration))

        default:
            return startValue
        }
    }

}
