//
//  Ease.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 A type of easing function, described from an algorithmic classification and acceleration
 pattern, providing the sense of motion.

 > "Nothing in nature moves linearly from one point to another. In reality, things tend to
 > accelerate or decelerate as they move. Our brains are wired to expect this kind of
 > motion, so when animating you should use this to your advantage. Natural motion
 > makes your users feel more comfortable with your apps, which in turn leads to a better
 > overall experience."
 > \- [Paul Lewis](https://developers.google.com/web/fundamentals/design-and-ux/animations/the-basics-of-easing)
 */
public struct Ease {

    // MARK: Properties

    /// The algorithmic classification of the ease.
    public let classification: EaseClassification
    /// The acceleration pattern of the ease.
    public let curve: EaseCurve
    /// The timing function, f(x), of the ease.
    public let function: (Double) -> Double

    // MARK: Initialization

    /// Initializes an ease with a classification, curve, and timing function.
    /// - parameter classification: The algorithmic classification of the ease.
    /// - parameter curve: The acceleration pattern of the ease.
    /// - parameter function: The timing function, f(x), of the ease.
    internal init(classification: EaseClassification, curve: EaseCurve, function: @escaping ((Double) -> Double)) {
        self.classification = classification
        self.curve = curve
        self.function = function
    }

}

/// :nodoc:
extension Ease: Equatable {

    public static func ==(lhs: Ease, rhs: Ease) -> Bool {
        return lhs.classification == rhs.classification &&
               lhs.curve == rhs.curve &&
               lhs.classification != .custom &&
               lhs.curve != .custom
    }

}

// MARK: -

extension Ease {

    // MARK: Linear

    /// An ease with a `linear` classification.
    ///
    /// [Visual Reference](http://easings.net/)
    public static let linear = Ease(classification: .linear, curve: .none, function: EaseFunction.linear)

    // MARK: Sinusoidal

    /// An ease with a `sine` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInSine)
    public static let sineIn = Ease(classification: .sine, curve: .in, function: EaseFunction.sineIn)

    /// An ease with a `sine` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutSine)
    public static let sineOut = Ease(classification: .sine, curve: .out, function: EaseFunction.sineOut)

    /// An ease with a `sine` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutSine)
    public static let sineInOut = Ease(classification: .sine, curve: .inOut, function: EaseFunction.sineInOut)

    // MARK: Cubic

    /// An ease with a `cubic` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCubic)
    public static let cubicIn = Ease(classification: .cubic, curve: .in, function: EaseFunction.cubicIn)

    /// An ease with a `cubic` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCubic)
    public static let cubicOut = Ease(classification: .cubic, curve: .out, function: EaseFunction.cubicOut)

    /// An ease with a `cubic` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCubic)
    public static let cubicInOut = Ease(classification: .cubic, curve: .inOut, function: EaseFunction.cubicInOut)

    // MARK: Quadratic

    /// An ease with a `quad` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuad)
    public static let quadIn = Ease(classification: .quad, curve: .in, function: EaseFunction.quadIn)

    /// An ease with a `quad` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuad)
    public static let quadOut = Ease(classification: .quad, curve: .out, function: EaseFunction.quadOut)

    /// An ease with a `quad` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuad)
    public static let quadInOut = Ease(classification: .quad, curve: .inOut, function: EaseFunction.quadInOut)

    // MARK: Quartic

    /// An ease with a `quart` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuart)
    public static let quartIn = Ease(classification: .quart, curve: .in, function: EaseFunction.quartIn)

    /// An ease with a `quart` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuart)
    public static let quartOut = Ease(classification: .quart, curve: .out, function: EaseFunction.quartOut)

    /// An ease with a `quart` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuart)
    public static let quartInOut = Ease(classification: .quart, curve: .inOut, function: EaseFunction.quartInOut)

    // MARK: Quintic

    /// An ease with a `quint` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInQuint)
    public static let quintIn = Ease(classification: .quint, curve: .in, function: EaseFunction.quintIn)

    /// An ease with a `quint` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutQuint)
    public static let quintOut = Ease(classification: .quint, curve: .out, function: EaseFunction.quintOut)

    /// An ease with a `quint` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutQuint)
    public static let quintInOut = Ease(classification: .quint, curve: .inOut, function: EaseFunction.quintInOut)

    // MARK: Exponential

    /// An ease with an `expo` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInExpo)
    public static let expoIn = Ease(classification: .expo, curve: .in, function: EaseFunction.expoIn)

    /// An ease with an `expo` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutExpo)
    public static let expoOut = Ease(classification: .expo, curve: .out, function: EaseFunction.expoOut)

    /// An ease with an `expo` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutExpo)
    public static let expoInOut = Ease(classification: .expo, curve: .inOut, function: EaseFunction.expoOut)

    // MARK: Circular

    /// An ease with a `circ` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInCirc)
    public static let circIn = Ease(classification: .circ, curve: .in, function: EaseFunction.circIn)

    /// An ease with a `circ` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutCirc)
    public static let circOut = Ease(classification: .circ, curve: .out, function: EaseFunction.circOut)

    /// An ease with a `circ` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutCirc)
    public static let circInOut = Ease(classification: .circ, curve: .inOut, function: EaseFunction.circInOut)

    // MARK: Back

    /// An ease with a `back` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBack)
    public static let backIn = Ease(classification: .back, curve: .in, function: EaseFunction.backIn)

    /// An ease with a `back` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBack)
    public static let backOut = Ease(classification: .back, curve: .out, function: EaseFunction.backOut)

    /// An ease with a `back` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutBack)
    public static let backInOut = Ease(classification: .back, curve: .inOut, function: EaseFunction.backInOut)

    // MARK: Elastic

    /// An ease with an `elastic` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInElastic)
    public static let elasticIn = Ease(classification: .elastic, curve: .in, function: EaseFunction.elasticIn)

    /// An ease with an `elastic` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutElastic)
    public static let elasticOut = Ease(classification: .elastic, curve: .out, function: EaseFunction.elasticOut)

    /// An ease with an `elastic` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutElastic)
    public static let elasticInOut = Ease(classification: .elastic, curve: .inOut, function: EaseFunction.elasticInOut)

    // MARK: Bounce

    /// An ease with a `bounce` classification and `in` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInBounce)
    public static let bounceIn = Ease(classification: .bounce, curve: .in, function: EaseFunction.bounceIn)

    /// An ease with a `bounce` classification and `out` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeOutBounce)
    public static let bounceOut = Ease(classification: .bounce, curve: .out, function: EaseFunction.bounceOut)

    /// An ease with a `bounce` classification and `inOut` acceleration pattern.
    ///
    /// [Visual Reference](http://easings.net/#easeInOutBounce)
    public static let bounceInOut = Ease(classification: .bounce, curve: .inOut, function: EaseFunction.bounceInOut)

    // MARK: Custom

    /// An ease with a custom algorithmic classification and acceleration pattern.
    /// - parameter function: The custom function of the ease.
    /// - returns: The custom ease.
    public static func custom(function: @escaping (Double) -> Double) -> Ease {
        return Ease(classification: .custom, curve: .custom, function: function)
    }

}
