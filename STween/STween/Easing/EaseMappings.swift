//
//  EaseMappings.swift
//  STween
//
//  Created by Adam Graham on 8/14/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A class to store mapping collections for easing look-up.
internal final class EaseMappings {

    // Prevent instantiation of the class.
    private init() {}

    /// A typealias for a tuple representing all the data that defines an `Ease`.
    internal typealias EaseDefinition = (classification: EaseClassification,
                                         curve: EaseCurve,
                                         algorithm: EaseAlgorithm)

    /// A dictionary containing every `Ease` and its `EaseDefinition` data.
    internal static let eases: [Ease: EaseDefinition] = [
        .linear:       (.linear,  .none,  EaseAlgorithms.linear),
        .sineIn:       (.sine,    .in,    EaseAlgorithms.sineIn),
        .sineOut:      (.sine,    .out,   EaseAlgorithms.sineOut),
        .sineInOut:    (.sine,    .inOut, EaseAlgorithms.sineInOut),
        .cubicIn:      (.cubic,   .in,    EaseAlgorithms.cubicIn),
        .cubicOut:     (.cubic,   .out,   EaseAlgorithms.cubicOut),
        .cubicInOut:   (.cubic,   .inOut, EaseAlgorithms.cubicInOut),
        .quadIn:       (.quad,    .in,    EaseAlgorithms.quadIn),
        .quadOut:      (.quad,    .out,   EaseAlgorithms.quadOut),
        .quadInOut:    (.quad,    .inOut, EaseAlgorithms.quadInOut),
        .quartIn:      (.quart,   .in,    EaseAlgorithms.quartIn),
        .quartOut:     (.quart,   .out,   EaseAlgorithms.quartOut),
        .quartInOut:   (.quart,   .inOut, EaseAlgorithms.quartInOut),
        .quintIn:      (.quint,   .in,    EaseAlgorithms.quintIn),
        .quintOut:     (.quint,   .out,   EaseAlgorithms.quintOut),
        .quintInOut:   (.quint,   .inOut, EaseAlgorithms.quintInOut),
        .expoIn:       (.expo,    .in,    EaseAlgorithms.expoIn),
        .expoOut:      (.expo,    .out,   EaseAlgorithms.expoOut),
        .expoInOut:    (.expo,    .inOut, EaseAlgorithms.expoInOut),
        .circIn:       (.circ,    .in,    EaseAlgorithms.circIn),
        .circOut:      (.circ,    .out,   EaseAlgorithms.circOut),
        .circInOut:    (.circ,    .inOut, EaseAlgorithms.circInOut),
        .backIn:       (.back,    .in,    EaseAlgorithms.backIn),
        .backOut:      (.back,    .out,   EaseAlgorithms.backOut),
        .backInOut:    (.back,    .inOut, EaseAlgorithms.backInOut),
        .elasticIn:    (.elastic, .in,    EaseAlgorithms.elasticIn),
        .elasticOut:   (.elastic, .out,   EaseAlgorithms.elasticOut),
        .elasticInOut: (.elastic, .inOut, EaseAlgorithms.elasticInOut),
        .bounceIn:     (.bounce,  .in,    EaseAlgorithms.bounceIn),
        .bounceOut:    (.bounce,  .out,   EaseAlgorithms.bounceOut),
        .bounceInOut:  (.bounce,  .inOut, EaseAlgorithms.bounceInOut)
    ]

    /**
     A typealias for a dictionary containing each `EaseCurve` and an 
     associated `Ease`.
     */
    internal typealias EaseCurveMappings = [EaseCurve: Ease]

    /**
     A dictionary containing every `EaseClassification` and its associated
     `EaseCurveMappings`.
     */
    internal static let classificationMappings: [EaseClassification: EaseCurveMappings] = [
        .linear: [
            .in: .linear,
            .out: .linear,
            .inOut: .linear
        ],

        .sine: [
            .in: .sineIn,
            .out: .sineOut,
            .inOut: .sineInOut
        ],

        .cubic: [
            .in: .cubicIn,
            .out: .cubicOut,
            .inOut: .cubicInOut
        ],

        .quad: [
            .in: .quadIn,
            .out: .quadOut,
            .inOut: .quadInOut
        ],

        .quart: [
            .in: .quartIn,
            .out: .quartOut,
            .inOut: .quartInOut
        ],

        .quint: [
            .in: .quintIn,
            .out: .quintOut,
            .inOut: .quintInOut
        ],

        .expo: [
            .in: .expoIn,
            .out: .expoOut,
            .inOut: .expoInOut
        ],

        .circ: [
            .in: .circIn,
            .out: .circOut,
            .inOut: .circInOut
        ],

        .back: [
            .in: .backIn,
            .out: .backOut,
            .inOut: .backInOut
        ],
        
        .elastic: [
            .in: .elasticIn,
            .out: .elasticOut,
            .inOut: .elasticInOut
        ],
        
        .bounce: [
            .in: .bounceIn,
            .out: .bounceOut,
            .inOut: .bounceInOut
        ]
    ]

}
