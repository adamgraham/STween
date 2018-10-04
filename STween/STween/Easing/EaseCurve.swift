//
//  EaseCurve.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to describe the acceleration pattern of an ease.
public enum EaseCurve {

    /// A case to denote no acceleration pattern, i.e., linear.
    case none

    /// A case to denote an acceleration pattern that is more condensed in the beginning and
    /// expands as it continues. This mimics the motion of starting slow then speeding up.
    case `in`

    /// A case to denote an acceleration pattern that is more expanded in the beginning and
    /// condenses as it continues. This mimics the motion of starting fast then slowing down.
    case out

    /// A case to denote an acceleration pattern that is more condensed in the beginning,
    /// expands as it continues, then condenses again near the end. This mimics the motion of
    /// starting slow, speeding up, then slowing down.
    case inOut

}
