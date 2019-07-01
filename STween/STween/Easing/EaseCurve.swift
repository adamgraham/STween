//
//  EaseCurve.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// The acceleration pattern of an ease.
public enum EaseCurve {

    /// No acceleration pattern, i.e., linear.
    case none

    /// An acceleration pattern that is more condensed in the beginning and expands as it
    /// continues. This mimics the motion of starting slow then speeding up.
    case `in`

    /// An acceleration pattern that is more expanded in the beginning and condenses as it
    /// continues. This mimics the motion of starting fast then slowing down.
    case out

    /// An acceleration pattern that is more condensed in the beginning, expands as it
    /// continues, then condenses again near the end. This mimics the motion of starting slow,
    /// speeding up, then slowing down.
    case inOut

    /// A custom acceleration pattern.
    case custom

}
