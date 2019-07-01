//
//  EaseClassification.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// The algorithmic classification of an ease.
public enum EaseClassification {

    /// A "linear" algorithmic classification – a 1st degree polynomial.
    ///
    /// This is also considered "none" or "no ease".
    case linear

    /// A "sinusoidal" algorithmic classification.
    case sine

    /// A "cubic" algorithmic classification – a 3rd degree polynomial.
    case cubic

    /// A "quadratic" algorithmic classification – a 2nd degree polynomial.
    case quad

    /// A "quartic" algorithmic classification – a 4th degree polynomial.
    case quart

    /// A "quintic" algorithmic classification – a 5th degree polynomial.
    case quint

    /// An "exponential" algorithmic classification.
    case expo

    /// A "circular" algorithmic classification.
    case circ

    /// A "back" algorithmic classification.
    case back

    /// An "elastic" algorithmic classification.
    case elastic

    /// A "bounce" algorithmic classification.
    case bounce

    /// A custom algorithmic classification.
    case custom

}
