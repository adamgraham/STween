//
//  EaseClassification.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to describe the algorithmic classification of an ease.
public enum EaseClassification {

    /// A case to denote a linear algorithmic classification.
    ///
    /// This can also be considered as "none" or "no ease".
    case linear

    /// A case to denote a sinusoidal algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInSine)
    ///   - [EaseCurve.out](http://easings.net/#easeOutSine)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutSine)
    case sine

    /// A case to denote a cubic algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInCubic)
    ///   - [EaseCurve.out](http://easings.net/#easeOutCubic)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutCubic)
    case cubic

    /// A case to denote a quadratic algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInQuad)
    ///   - [EaseCurve.out](http://easings.net/#easeOutQuad)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutQuad)
    case quad

    /// A case to denote a quartic algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInQuart)
    ///   - [EaseCurve.out](http://easings.net/#easeOutQuart)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutQuart)
    case quart

    /// A case to denote a quintic algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInQuint)
    ///   - [EaseCurve.out](http://easings.net/#easeOutQuint)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutQuint)
    case quint

    /// A case to denote an exponential algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInExpo)
    ///   - [EaseCurve.out](http://easings.net/#easeOutExpo)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutExpo)
    case expo

    /// A case to denote a circular algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInCirc)
    ///   - [EaseCurve.out](http://easings.net/#easeOutCirc)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutCirc)
    case circ

    /// A case to denote a back algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInBack)
    ///   - [EaseCurve.out](http://easings.net/#easeOutBack)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutBack)
    case back

    /// A case to denote an elastic algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInElastic)
    ///   - [EaseCurve.out](http://easings.net/#easeOutElastic)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutElastic)
    case elastic

    /// A case to denote a bounce algorithmic classification.
    ///
    /// - *Visualized References*:
    ///   - [EaseCurve.in](http://easings.net/#easeInBounce)
    ///   - [EaseCurve.out](http://easings.net/#easeOutBounce)
    ///   - [EaseCurve.inOut](http://easings.net/#easeInOutBounce)
    case bounce

}

extension EaseClassification {

    // MARK: Look-up Helpers

    /// The `Ease` associated with `self` and `EaseCurve.in`.
    public var `in`: Ease {
        return EaseMappings.classifications[self]![.in]!
    }

    /// The `Ease` associated with `self` and `EaseCurve.out`.
    public var out: Ease {
        return EaseMappings.classifications[self]![.out]!
    }

    /// The `Ease` associated with `self` and `EaseCurve.inOut`.
    public var inOut: Ease {
        return EaseMappings.classifications[self]![.inOut]!
    }

}
