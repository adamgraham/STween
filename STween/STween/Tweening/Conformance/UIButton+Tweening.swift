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

    public func value<T: Tweenable>(from object: T) throws -> UIButtonTweenProperty {
        guard let button = object as? UIButton else {
            throw TweenError.objectNotConvertible(object, to: UIButton.self)
        }

        switch self {
        case .contentEdgeInsets:
            return .contentEdgeInsets(button.contentEdgeInsets)
        case .titleEdgeInsets:
            return .titleEdgeInsets(button.titleEdgeInsets)
        case .imageEdgeInsets:
            return .imageEdgeInsets(button.imageEdgeInsets)

        case let .titleColor(_, state):
            return .titleColor(button.titleColor(for: state) ?? UIColor.clear, state)
        case let .titleShadowColor(_, state):
            return .titleShadowColor(button.titleShadowColor(for: state) ?? UIColor.clear, state)

        case .tintColor:
            return .tintColor(button.tintColor)
        }
    }

    public func apply<T: Tweenable>(to object: T) throws {
        guard let button = object as? UIButton else {
            throw TweenError.objectNotConvertible(object, to: UIButton.self)
        }

        switch self {
        case let .contentEdgeInsets(value):
            button.contentEdgeInsets = value
        case let .titleEdgeInsets(value):
            button.titleEdgeInsets = value
        case let .imageEdgeInsets(value):
            button.imageEdgeInsets = value

        case let .titleColor(color, state):
            button.setTitleColor(color, for: state)
        case let .titleShadowColor(color, state):
            button.setTitleShadowColor(color, for: state)

        case let .tintColor(value):
            button.tintColor = value
        }
    }

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
