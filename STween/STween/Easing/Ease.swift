//
//  Ease.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A type of easing function, described from an algorithmic classification and acceleration
/// pattern.
public struct Ease {

    /// The algorithmic classification of the ease.
    public let classification: EaseClassification
    /// The acceleration pattern of the ease.
    public let curve: EaseCurve

    /// :nodoc:
    private init(classification: EaseClassification, curve: EaseCurve) {
        self.classification = classification
        self.curve = curve
    }

}

extension Ease: Equatable {

    public static func ==(lhs: Ease, rhs: Ease) -> Bool {
        return lhs.classification == rhs.classification &&
               lhs.curve == rhs.curve
    }

}

// MARK: -

extension Ease {

    // MARK: Linear

    /// An ease with a `linear` classification.
    ///
    /// [Visual Reference](http://easings.net/)
    public static let linear = Ease(classification: .linear, curve: .none)

    // MARK: Sinusoidal

    /// An ease with a `sine` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInSine)
    public static let sineIn = Ease(classification: .sine, curve: .in)

    /// An ease with a `sine` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutSine)
    public static let sineOut = Ease(classification: .sine, curve: .out)

    /// An ease with a `sine` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutSine)
    public static let sineInOut = Ease(classification: .sine, curve: .inOut)

    // MARK: Cubic

    /// An ease with a `cubic` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCubic)
    public static let cubicIn = Ease(classification: .cubic, curve: .in)

    /// An ease with a `cubic` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCubic)
    public static let cubicOut = Ease(classification: .cubic, curve: .out)

    /// An ease with a `cubic` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCubic)
    public static let cubicInOut = Ease(classification: .cubic, curve: .inOut)

    // MARK: Quadratic

    /// An ease with a `quad` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuad)
    public static let quadIn = Ease(classification: .quad, curve: .in)

    /// An ease with a `quad` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuad)
    public static let quadOut = Ease(classification: .quad, curve: .out)

    /// An ease with a `quad` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuad)
    public static let quadInOut = Ease(classification: .quad, curve: .inOut)

    // MARK: Quartic

    /// An ease with a `quart` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuart)
    public static let quartIn = Ease(classification: .quart, curve: .in)

    /// An ease with a `quart` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuart)
    public static let quartOut = Ease(classification: .quart, curve: .out)

    /// An ease with a `quart` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuart)
    public static let quartInOut = Ease(classification: .quart, curve: .inOut)

    // MARK: Quintic

    /// An ease with a `quint` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuint)
    public static let quintIn = Ease(classification: .quint, curve: .in)

    /// An ease with a `quint` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuint)
    public static let quintOut = Ease(classification: .quint, curve: .out)

    /// An ease with a `quint` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuint)
    public static let quintInOut = Ease(classification: .quint, curve: .inOut)

    // MARK: Exponential

    /// An ease with an `expo` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInExpo)
    public static let expoIn = Ease(classification: .expo, curve: .in)

    /// An ease with an `expo` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutExpo)
    public static let expoOut = Ease(classification: .expo, curve: .out)

    /// An ease with an `expo` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutExpo)
    public static let expoInOut = Ease(classification: .expo, curve: .inOut)

    // MARK: Circular

    /// An ease with a `circ` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCirc)
    public static let circIn = Ease(classification: .circ, curve: .in)

    /// An ease with a `circ` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCirc)
    public static let circOut = Ease(classification: .circ, curve: .out)

    /// An ease with a `circ` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCirc)
    public static let circInOut = Ease(classification: .circ, curve: .inOut)

    // MARK: Back

    /// An ease with a `back` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBack)
    public static let backIn = Ease(classification: .back, curve: .in)

    /// An ease with a `back` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBack)
    public static let backOut = Ease(classification: .back, curve: .out)

    /// An ease with a `back` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutBack)
    public static let backInOut = Ease(classification: .back, curve: .inOut)

    // MARK: Elastic

    /// An ease with an `elastic` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInElastic)
    public static let elasticIn = Ease(classification: .elastic, curve: .in)

    /// An ease with an `elastic` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutElastic)
    public static let elasticOut = Ease(classification: .elastic, curve: .out)

    /// An ease with an `elastic` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutElastic)
    public static let elasticInOut = Ease(classification: .elastic, curve: .inOut)

    // MARK: Bounce

    /// An ease with a `bounce` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBounce)
    public static let bounceIn = Ease(classification: .bounce, curve: .in)

    /// An ease with a `bounce` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBounce)
    public static let bounceOut = Ease(classification: .bounce, curve: .out)

    /// An ease with a `bounce` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutBounce)
    public static let bounceInOut = Ease(classification: .bounce, curve: .inOut)

}

// MARK: -

extension Ease {

    /**
     Calculates the value between a start and end value at a specific point in time.

     - Parameters:
        - startValue: The start value passed to the easing function.
        - endValue: The end value passed to the easing function.
        - elapsed: The elapsed amount of time passed to the easing function.
        - duration: The duration of time passed to the easing function.

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
        case .sineIn:
            return EaseFunction.sineIn(b: b, c: c, t: t, d: d)
        case .sineOut:
            return EaseFunction.sineOut(b: b, c: c, t: t, d: d)
        case .sineInOut:
            return EaseFunction.sineInOut(b: b, c: c, t: t, d: d)

        case .cubicIn:
            return EaseFunction.cubicIn(b: b, c: c, t: t, d: d)
        case .cubicOut:
            return EaseFunction.cubicOut(b: b, c: c, t: t, d: d)
        case .cubicInOut:
            return EaseFunction.cubicInOut(b: b, c: c, t: t, d: d)

        case .quadIn:
            return EaseFunction.quadIn(b: b, c: c, t: t, d: d)
        case .quadOut:
            return EaseFunction.quadOut(b: b, c: c, t: t, d: d)
        case .quadInOut:
            return EaseFunction.quadInOut(b: b, c: c, t: t, d: d)

        case .quartIn:
            return EaseFunction.quartIn(b: b, c: c, t: t, d: d)
        case .quartOut:
            return EaseFunction.quartOut(b: b, c: c, t: t, d: d)
        case .quartInOut:
            return EaseFunction.quartInOut(b: b, c: c, t: t, d: d)

        case .quintIn:
            return EaseFunction.quintIn(b: b, c: c, t: t, d: d)
        case .quintOut:
            return EaseFunction.quintOut(b: b, c: c, t: t, d: d)
        case .quintInOut:
            return EaseFunction.quintInOut(b: b, c: c, t: t, d: d)

        case .expoIn:
            return EaseFunction.expoIn(b: b, c: c, t: t, d: d)
        case .expoOut:
            return EaseFunction.expoOut(b: b, c: c, t: t, d: d)
        case .expoInOut:
            return EaseFunction.expoInOut(b: b, c: c, t: t, d: d)

        case .circIn:
            return EaseFunction.circIn(b: b, c: c, t: t, d: d)
        case .circOut:
            return EaseFunction.circOut(b: b, c: c, t: t, d: d)
        case .circInOut:
            return EaseFunction.circInOut(b: b, c: c, t: t, d: d)

        case .backIn:
            return EaseFunction.backIn(b: b, c: c, t: t, d: d)
        case .backOut:
            return EaseFunction.backOut(b: b, c: c, t: t, d: d)
        case .backInOut:
            return EaseFunction.backInOut(b: b, c: c, t: t, d: d)

        case .elasticIn:
            return EaseFunction.elasticIn(b: b, c: c, t: t, d: d)
        case .elasticOut:
            return EaseFunction.elasticOut(b: b, c: c, t: t, d: d)
        case .elasticInOut:
            return EaseFunction.elasticInOut(b: b, c: c, t: t, d: d)

        case .bounceIn:
            return EaseFunction.bounceIn(b: b, c: c, t: t, d: d)
        case .bounceOut:
            return EaseFunction.bounceOut(b: b, c: c, t: t, d: d)
        case .bounceInOut:
            return EaseFunction.bounceInOut(b: b, c: c, t: t, d: d)

        default:
            return EaseFunction.linear(b: b, c: c, t: t, d: d)
        }
    }

}
