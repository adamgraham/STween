//
//  Ease.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to describe an easing function.
public enum Ease {

    // MARK: Linear

    /// A case to denote an `EaseClassification.linear` function.
    ///
    /// [Visual Reference](http://easings.net/)
    case linear

    // MARK: Sinusoidal

    /// A case to denote an `EaseClassification.sine` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInSine)
    case sineIn

    /// A case to denote an `EaseClassification.sine` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutSine)
    case sineOut

    /// A case to denote an `EaseClassification.sine` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutSine)
    case sineInOut

    // MARK: Cubic

    /// A case to denote an `EaseClassification.cubic` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCubic)
    case cubicIn

    /// A case to denote an `EaseClassification.cubic` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCubic)
    case cubicOut

    /// A case to denote an `EaseClassification.cubic` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCubic)
    case cubicInOut

    // MARK: Quadratic

    /// A case to denote an `EaseClassification.quad` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuad)
    case quadIn

    /// A case to denote an `EaseClassification.quad` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuad)
    case quadOut

    /// A case to denote an `EaseClassification.quad` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuad)
    case quadInOut

    // MARK: Quartic

    /// A case to denote an `EaseClassification.quart` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuart)
    case quartIn

    /// A case to denote an `EaseClassification.quart` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuart)
    case quartOut

    /// A case to denote an `EaseClassification.quart` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuart)
    case quartInOut

    // MARK: Quintic

    /// A case to denote an `EaseClassification.quint` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuint)
    case quintIn

    /// A case to denote an `EaseClassification.quint` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuint)
    case quintOut

    /// A case to denote an `EaseClassification.quint` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuint)
    case quintInOut

    // MARK: Exponential

    /// A case to denote an `EaseClassification.expo` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInExpo)
    case expoIn

    /// A case to denote an `EaseClassification.expo` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutExpo)
    case expoOut

    /// A case to denote an `EaseClassification.expo` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutExpo)
    case expoInOut

    // MARK: Circular

    /// A case to denote an `EaseClassification.circ` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCirc)
    case circIn

    /// A case to denote an `EaseClassification.circ` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCirc)
    case circOut

    /// A case to denote an `EaseClassification.circ` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCirc)
    case circInOut

    // MARK: Back

    /// A case to denote an `EaseClassification.back` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBack)
    case backIn

    /// A case to denote an `EaseClassification.back` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBack)
    case backOut

    /// A case to denote an `EaseClassification.back` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutBack)
    case backInOut

    // MARK: Elastic

    /// A case to denote an `EaseClassification.elastic` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInElastic)
    case elasticIn

    /// A case to denote an `EaseClassification.elastic` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutElastic)
    case elasticOut

    /// A case to denote an `EaseClassification.elastic` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutElastic)
    case elasticInOut

    // MARK: Bounce

    /// A case to denote an `EaseClassification.bounce` function with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBounce)
    case bounceIn

    /// A case to denote an `EaseClassification.bounce` function with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBounce)
    case bounceOut

    /// A case to denote an `EaseClassification.bounce` function with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutBounce)
    case bounceInOut

}

extension Ease {

    // MARK: Properties

    /// The `EaseClassification` associated with `self`.
    public var classification: EaseClassification {
        return EaseMappings.eases[self]!.classification
    }

    /// The `EaseCurve` associated with `self`.
    public var curve: EaseCurve {
        return EaseMappings.eases[self]!.curve
    }
    
}

extension Ease {

    // MARK: Methods

    /**
     A method to calculate the value between a starting and ending position at a specific
     point in time using `self`'s easing function.

     - Parameters:
        - startValue: The start value passed to `self`'s easing function.
        - endValue: The end value passed to `self`'s easing function.
        - elapsed: The elapsed amount of time passed to `self`'s easing function.
        - duration: The duration of time passed to `self`'s easing function.

     - Returns: The value interpolated between the start and end value.
     */
    public func interpolate<Number: InterpolatableNumber>(
        from startValue: Number, to endValue: Number,
        elapsed: Number, duration: Number) -> Number {

        let b = startValue
        let c = endValue - startValue
        let t = elapsed
        let d = duration

        switch self {
        case .linear:
            return EaseFunctions.linear(b: b, c: c, t: t, d: d)

        case .sineIn:
            return EaseFunctions.sineIn(b: b, c: c, t: t, d: d)
        case .sineOut:
            return EaseFunctions.sineOut(b: b, c: c, t: t, d: d)
        case .sineInOut:
            return EaseFunctions.sineInOut(b: b, c: c, t: t, d: d)

        case .cubicIn:
            return EaseFunctions.cubicIn(b: b, c: c, t: t, d: d)
        case .cubicOut:
            return EaseFunctions.cubicOut(b: b, c: c, t: t, d: d)
        case .cubicInOut:
            return EaseFunctions.cubicInOut(b: b, c: c, t: t, d: d)

        case .quadIn:
            return EaseFunctions.quadIn(b: b, c: c, t: t, d: d)
        case .quadOut:
            return EaseFunctions.quadOut(b: b, c: c, t: t, d: d)
        case .quadInOut:
            return EaseFunctions.quadInOut(b: b, c: c, t: t, d: d)

        case .quartIn:
            return EaseFunctions.quartIn(b: b, c: c, t: t, d: d)
        case .quartOut:
            return EaseFunctions.quartOut(b: b, c: c, t: t, d: d)
        case .quartInOut:
            return EaseFunctions.quartInOut(b: b, c: c, t: t, d: d)

        case .quintIn:
            return EaseFunctions.quintIn(b: b, c: c, t: t, d: d)
        case .quintOut:
            return EaseFunctions.quintOut(b: b, c: c, t: t, d: d)
        case .quintInOut:
            return EaseFunctions.quintInOut(b: b, c: c, t: t, d: d)

        case .expoIn:
            return EaseFunctions.expoIn(b: b, c: c, t: t, d: d)
        case .expoOut:
            return EaseFunctions.expoOut(b: b, c: c, t: t, d: d)
        case .expoInOut:
            return EaseFunctions.expoInOut(b: b, c: c, t: t, d: d)

        case .circIn:
            return EaseFunctions.circIn(b: b, c: c, t: t, d: d)
        case .circOut:
            return EaseFunctions.circOut(b: b, c: c, t: t, d: d)
        case .circInOut:
            return EaseFunctions.circInOut(b: b, c: c, t: t, d: d)

        case .backIn:
            return EaseFunctions.backIn(b: b, c: c, t: t, d: d)
        case .backOut:
            return EaseFunctions.backOut(b: b, c: c, t: t, d: d)
        case .backInOut:
            return EaseFunctions.backInOut(b: b, c: c, t: t, d: d)

        case .elasticIn:
            return EaseFunctions.elasticIn(b: b, c: c, t: t, d: d)
        case .elasticOut:
            return EaseFunctions.elasticOut(b: b, c: c, t: t, d: d)
        case .elasticInOut:
            return EaseFunctions.elasticInOut(b: b, c: c, t: t, d: d)

        case .bounceIn:
            return EaseFunctions.bounceIn(b: b, c: c, t: t, d: d)
        case .bounceOut:
            return EaseFunctions.bounceOut(b: b, c: c, t: t, d: d)
        case .bounceInOut:
            return EaseFunctions.bounceInOut(b: b, c: c, t: t, d: d)
        }
    }

}
