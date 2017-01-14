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
                                         curve: EaseCurve)

    /// A dictionary containing every `Ease` and its `EaseDefinition` data.
    internal static let eases: [Ease: EaseDefinition] = [
        .linear:       (.linear,  .none),
        .sineIn:       (.sine,    .in),
        .sineOut:      (.sine,    .out),
        .sineInOut:    (.sine,    .inOut),
        .cubicIn:      (.cubic,   .in),
        .cubicOut:     (.cubic,   .out),
        .cubicInOut:   (.cubic,   .inOut),
        .quadIn:       (.quad,    .in),
        .quadOut:      (.quad,    .out),
        .quadInOut:    (.quad,    .inOut),
        .quartIn:      (.quart,   .in),
        .quartOut:     (.quart,   .out),
        .quartInOut:   (.quart,   .inOut),
        .quintIn:      (.quint,   .in),
        .quintOut:     (.quint,   .out),
        .quintInOut:   (.quint,   .inOut),
        .expoIn:       (.expo,    .in),
        .expoOut:      (.expo,    .out),
        .expoInOut:    (.expo,    .inOut),
        .circIn:       (.circ,    .in),
        .circOut:      (.circ,    .out),
        .circInOut:    (.circ,    .inOut),
        .backIn:       (.back,    .in),
        .backOut:      (.back,    .out),
        .backInOut:    (.back,    .inOut),
        .elasticIn:    (.elastic, .in),
        .elasticOut:   (.elastic, .out),
        .elasticInOut: (.elastic, .inOut),
        .bounceIn:     (.bounce,  .in),
        .bounceOut:    (.bounce,  .out),
        .bounceInOut:  (.bounce,  .inOut)
    ]

    /// A typealias for a dictionary containing each `EaseCurve` and an
    /// associated `Ease`.
    internal typealias EaseCurveMappings = [EaseCurve: Ease]

    /// A dictionary containing every `EaseClassification` and its associated
    /// `EaseCurveMappings`.
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
