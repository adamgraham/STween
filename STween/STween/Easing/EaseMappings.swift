//
//  EaseMappings.swift
//  STween
//
//  Created by Adam Graham on 8/14/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// Maps ease properties for quick look-up.
internal enum EaseMappings {

    /// The mapping of every `Ease` to its `EaseClassification` and `EaseCurve`.
    internal static let eases: [Ease: (classification: EaseClassification, curve: EaseCurve)] = [
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
