//
//  EaseMappings.swift
//  STween
//
//  Created by Adam Graham on 8/14/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to store mapping collections for easing look-up.
internal enum EaseMappings {

    /// A typealias for a tuple representing all of the data that defines an `Ease`.
    internal typealias EaseDefinition = (classification: EaseClassification,
                                         curve: EaseCurve)

    /// A dictionary containing each `Ease` and its associated `EaseDefinition` data.
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

}
