//
//  Ease.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to describe an easing algorithm.
public enum Ease {

    // MARK: Linear

    /// A case to denote an `EaseClassification.linear` algorithm.
    ///
    /// [Visual Reference](http://easings.net/)
    case linear

    // MARK: Sinusoidal

    /// A case to denote an `EaseClassification.sine` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInSine)
    case sineIn

    /// A case to denote an `EaseClassification.sine` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutSine)
    case sineOut

    /// A case to denote an `EaseClassification.sine` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutSine)
    case sineInOut

    // MARK: Cubic

    /// A case to denote an `EaseClassification.cubic` algorithm with an 
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCubic)
    case cubicIn

    /// A case to denote an `EaseClassification.cubic` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCubic)
    case cubicOut

    /// A case to denote an `EaseClassification.cubic` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCubic)
    case cubicInOut

    // MARK: Quadratic

    /// A case to denote an `EaseClassification.quad` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuad)
    case quadIn

    /// A case to denote an `EaseClassification.quad` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuad)
    case quadOut

    /// A case to denote an `EaseClassification.quad` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuad)
    case quadInOut

    // MARK: Quartic

    /// A case to denote an `EaseClassification.quart` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuart)
    case quartIn

    /// A case to denote an `EaseClassification.quart` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuart)
    case quartOut

    /// A case to denote an `EaseClassification.quart` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuart)
    case quartInOut

    // MARK: Quintic

    /// A case to denote an `EaseClassification.quint` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuint)
    case quintIn

    /// A case to denote an `EaseClassification.quint` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuint)
    case quintOut

    /// A case to denote an `EaseClassification.quint` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuint)
    case quintInOut

    // MARK: Exponential

    /// A case to denote an `EaseClassification.expo` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInExpo)
    case expoIn

    /// A case to denote an `EaseClassification.expo` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutExpo)
    case expoOut

    /// A case to denote an `EaseClassification.expo` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutExpo)
    case expoInOut

    // MARK: Circular

    /// A case to denote an `EaseClassification.circ` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCirc)
    case circIn

    /// A case to denote an `EaseClassification.circ` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCirc)
    case circOut

    /// A case to denote an `EaseClassification.circ` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCirc)
    case circInOut

    // MARK: Back

    /// A case to denote an `EaseClassification.back` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBack)
    case backIn

    /// A case to denote an `EaseClassification.back` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBack)
    case backOut

    /// A case to denote an `EaseClassification.back` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutBack)
    case backInOut

    // MARK: Elastic

    /// A case to denote an `EaseClassification.elastic` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInElastic)
    case elasticIn

    /// A case to denote an `EaseClassification.elastic` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutElastic)
    case elasticOut

    /// A case to denote an `EaseClassification.elastic` algorithm with an
    /// `EaseCurve.inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutElastic)
    case elasticInOut

    // MARK: Bounce

    /// A case to denote an `EaseClassification.bounce` algorithm with an
    /// `EaseCurve.in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBounce)
    case bounceIn

    /// A case to denote an `EaseClassification.bounce` algorithm with an
    /// `EaseCurve.out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBounce)
    case bounceOut

    /// A case to denote an `EaseClassification.bounce` algorithm with an
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
     A method to calculate the value between a starting and ending position at a
     specific point in time using `self`'s easing algorithm.

     - Parameters:
        - startValue: The start value passed to `self`'s easing algorithm.
        - endValue: The end value passed to `self`'s easing algorithm.
        - elapsed: The elapsed amount of time passed to `self`'s easing algorithm.
        - duration: The duration of time passed to `self`'s easing algorithm.

     - Returns: The value interpolated between the start and end value.
     */
    public func interpolate<Number: FloatingPoint>(
        from startValue: Number, to endValue: Number,
        elapsed: Number, duration: Number) -> Number {

        let b = startValue
        let c = endValue - startValue
        let t = elapsed
        let d = duration

        switch self {
        case .linear:
            return EaseAlgorithms.linear(b: b, c: c, t: t, d: d)

        case .sineIn:
            return EaseAlgorithms.sineIn(b: b, c: c, t: t, d: d)
        case .sineOut:
            return EaseAlgorithms.sineOut(b: b, c: c, t: t, d: d)
        case .sineInOut:
            return EaseAlgorithms.sineInOut(b: b, c: c, t: t, d: d)

        case .cubicIn:
            return EaseAlgorithms.cubicIn(b: b, c: c, t: t, d: d)
        case .cubicOut:
            return EaseAlgorithms.cubicOut(b: b, c: c, t: t, d: d)
        case .cubicInOut:
            return EaseAlgorithms.cubicInOut(b: b, c: c, t: t, d: d)

        case .quadIn:
            return EaseAlgorithms.quadIn(b: b, c: c, t: t, d: d)
        case .quadOut:
            return EaseAlgorithms.quadOut(b: b, c: c, t: t, d: d)
        case .quadInOut:
            return EaseAlgorithms.quadInOut(b: b, c: c, t: t, d: d)

        case .quartIn:
            return EaseAlgorithms.quartIn(b: b, c: c, t: t, d: d)
        case .quartOut:
            return EaseAlgorithms.quartOut(b: b, c: c, t: t, d: d)
        case .quartInOut:
            return EaseAlgorithms.quartInOut(b: b, c: c, t: t, d: d)

        case .quintIn:
            return EaseAlgorithms.quintIn(b: b, c: c, t: t, d: d)
        case .quintOut:
            return EaseAlgorithms.quintOut(b: b, c: c, t: t, d: d)
        case .quintInOut:
            return EaseAlgorithms.quintInOut(b: b, c: c, t: t, d: d)

        case .expoIn:
            return EaseAlgorithms.expoIn(b: b, c: c, t: t, d: d)
        case .expoOut:
            return EaseAlgorithms.expoOut(b: b, c: c, t: t, d: d)
        case .expoInOut:
            return EaseAlgorithms.expoInOut(b: b, c: c, t: t, d: d)

        case .circIn:
            return EaseAlgorithms.circIn(b: b, c: c, t: t, d: d)
        case .circOut:
            return EaseAlgorithms.circOut(b: b, c: c, t: t, d: d)
        case .circInOut:
            return EaseAlgorithms.circInOut(b: b, c: c, t: t, d: d)

        case .backIn:
            return EaseAlgorithms.backIn(b: b, c: c, t: t, d: d)
        case .backOut:
            return EaseAlgorithms.backOut(b: b, c: c, t: t, d: d)
        case .backInOut:
            return EaseAlgorithms.backInOut(b: b, c: c, t: t, d: d)

        case .elasticIn:
            return EaseAlgorithms.elasticIn(b: b, c: c, t: t, d: d)
        case .elasticOut:
            return EaseAlgorithms.elasticOut(b: b, c: c, t: t, d: d)
        case .elasticInOut:
            return EaseAlgorithms.elasticInOut(b: b, c: c, t: t, d: d)

        case .bounceIn:
            return EaseAlgorithms.bounceIn(b: b, c: c, t: t, d: d)
        case .bounceOut:
            return EaseAlgorithms.bounceOut(b: b, c: c, t: t, d: d)
        case .bounceInOut:
            return EaseAlgorithms.bounceInOut(b: b, c: c, t: t, d: d)
        }
    }

}
