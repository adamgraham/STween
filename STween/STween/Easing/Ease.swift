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

    /**
     A case to denote an `EaseClassification.linear` algorithm.

     [Visual Reference](http://easings.net/)
     */
    case linear

    // MARK: Sinusoidal

    /**
     A case to denote an `EaseClassification.sine` algorithm with an 
     `EaseCurve.in` acceleration pattern.
     
     [Visual Reference](http://easings.net/#easeInSine)
     */
    case sineIn

    /**
     A case to denote an `EaseClassification.sine` algorithm with an 
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutSine)
     */
    case sineOut

    /**
     A case to denote an `EaseClassification.sine` algorithm with an 
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutSine)
     */
    case sineInOut

    // MARK: Cubic

    /**
     A case to denote an `EaseClassification.cubic` algorithm with an 
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInCubic)
     */
    case cubicIn

    /**
     A case to denote an `EaseClassification.cubic` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutCubic)
     */
    case cubicOut

    /**
     A case to denote an `EaseClassification.cubic` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutCubic)
     */
    case cubicInOut

    // MARK: Quadratic

    /**
     A case to denote an `EaseClassification.quad` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInQuad)
     */
    case quadIn

    /**
     A case to denote an `EaseClassification.quad` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutQuad)
     */
    case quadOut

    /**
     A case to denote an `EaseClassification.quad` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutQuad)
     */
    case quadInOut

    // MARK: Quartic

    /**
     A case to denote an `EaseClassification.quart` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInQuart)
     */
    case quartIn

    /**
     A case to denote an `EaseClassification.quart` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutQuart)
     */
    case quartOut

    /**
     A case to denote an `EaseClassification.quart` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutQuart)
     */
    case quartInOut

    // MARK: Quintic

    /**
     A case to denote an `EaseClassification.quint` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInQuint)
     */
    case quintIn

    /**
     A case to denote an `EaseClassification.quint` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutQuint)
     */
    case quintOut

    /**
     A case to denote an `EaseClassification.quint` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutQuint)
     */
    case quintInOut

    // MARK: Exponential

    /**
     A case to denote an `EaseClassification.expo` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInExpo)
     */
    case expoIn

    /**
     A case to denote an `EaseClassification.expo` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutExpo)
     */
    case expoOut

    /**
     A case to denote an `EaseClassification.expo` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutExpo)
     */
    case expoInOut

    // MARK: Circular

    /**
     A case to denote an `EaseClassification.circ` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInCirc)
     */
    case circIn

    /**
     A case to denote an `EaseClassification.circ` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutCirc)
     */
    case circOut

    /**
     A case to denote an `EaseClassification.circ` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutCirc)
     */
    case circInOut

    // MARK: Back

    /**
     A case to denote an `EaseClassification.back` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInBack)
     */
    case backIn

    /**
     A case to denote an `EaseClassification.back` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutBack)
     */
    case backOut

    /**
     A case to denote an `EaseClassification.back` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutBack)
     */
    case backInOut

    // MARK: Elastic

    /**
     A case to denote an `EaseClassification.elastic` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInElastic)
     */
    case elasticIn

    /**
     A case to denote an `EaseClassification.elastic` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutElastic)
     */
    case elasticOut

    /**
     A case to denote an `EaseClassification.elastic` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutElastic)
     */
    case elasticInOut

    // MARK: Bounce

    /**
     A case to denote an `EaseClassification.bounce` algorithm with an
     `EaseCurve.in` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInBounce)
     */
    case bounceIn

    /**
     A case to denote an `EaseClassification.bounce` algorithm with an
     `EaseCurve.out` acceleration pattern.

     [Visual Reference](http://easings.net/#easeOutBounce)
     */
    case bounceOut

    /**
     A case to denote an `EaseClassification.bounce` algorithm with an
     `EaseCurve.inOut` acceleration pattern.

     [Visual Reference](http://easings.net/#easeInOutBounce)
     */
    case bounceInOut

    /// A case to denote a custom ease.
    case custom(algorithm: EaseAlgorithm)

}

// MARK: - Equatable

extension Ease: Swift.Equatable {

    public static func ==(lhs: Ease, rhs: Ease) -> Swift.Bool {
        switch (lhs, rhs) {
        case (.linear, .linear),

             (.sineIn, .sineIn),
             (.sineOut, .sineOut),
             (.sineInOut, .sineInOut),

             (.cubicIn, .cubicIn),
             (.cubicOut, .cubicOut),
             (.cubicInOut, .cubicInOut),

             (.quadIn, .quadIn),
             (.quadOut, .quadOut),
             (.quadInOut, .quadInOut),

             (.quartIn, .quartIn),
             (.quartOut, .quartOut),
             (.quartInOut, .quartInOut),

             (.quintIn, .quintIn),
             (.quintOut, .quintOut),
             (.quintInOut, .quintInOut),

             (.expoIn, .expoIn),
             (.expoOut, .expoOut),
             (.expoInOut, .expoInOut),

             (.circIn, .circIn),
             (.circOut, .circOut),
             (.circInOut, .circInOut),

             (.backIn, .backIn),
             (.backOut, .backOut),
             (.backInOut, .backInOut),

             (.elasticIn, .elasticIn),
             (.elasticOut, .elasticOut),
             (.elasticInOut, .elasticInOut),

             (.bounceIn, .bounceIn),
             (.bounceOut, .bounceOut),
             (.bounceInOut, .bounceInOut):
            return true
        default:
            return false
        }
    }

}

// MARK: - Hashable

extension Ease: Swift.Hashable {

    public var hashValue: Swift.Int {
        switch self {
        case .custom:
            return -1
        case .linear:
            return 0

        case .sineIn:
            return 1
        case .sineOut:
            return 2
        case .sineInOut:
            return 3

        case .cubicIn:
            return 4
        case .cubicOut:
            return 5
        case .cubicInOut:
            return 6

        case .quadIn:
            return 7
        case .quadOut:
            return 8
        case .quadInOut:
            return 9

        case .quartIn:
            return 10
        case .quartOut:
            return 11
        case .quartInOut:
            return 12

        case .quintIn:
            return 13
        case .quintOut:
            return 14
        case .quintInOut:
            return 15

        case .expoIn:
            return 16
        case .expoOut:
            return 17
        case .expoInOut:
            return 18

        case .circIn:
            return 19
        case .circOut:
            return 20
        case .circInOut:
            return 21

        case .backIn:
            return 22
        case .backOut:
            return 23
        case .backInOut:
            return 24

        case .elasticIn:
            return 25
        case .elasticOut:
            return 26
        case .elasticInOut:
            return 27

        case .bounceIn:
            return 28
        case .bounceOut:
            return 29
        case .bounceInOut:
            return 30
        }
    }

}

// MARK: - Properties

extension Ease {

    /// The `EaseClassification` associated with `self`.
    public var classification: EaseClassification {
        switch self {
        case .custom:
            return .custom
        default:
            return EaseMappings.eases[self]!.classification
        }
    }

    /// The `EaseCurve` associated with `self`.
    public var curve: EaseCurve {
        switch self {
        case .custom:
            return .custom
        default:
            return EaseMappings.eases[self]!.curve
        }
    }

    /// The `EaseAlgorithm` associated with `self`.
    public var algorithm: EaseAlgorithm {
        switch self {
        case let .custom(algorithm):
            return algorithm
        default:
            return EaseMappings.eases[self]!.algorithm
        }
    }
    
}
