//
//  EaseCurve.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to describe the acceleration pattern of an ease.
public enum EaseCurve {

    /// A case to denote no acceleration pattern i.e. linear.
    case none

    /**
     A case to denote an acceleration pattern that is more condensed in the 
     beginning and expands as the ease continues. This gives the illusion of 
     starting slow and speeding up.
     */
    case `in`

    /**
     A case to denote an acceleration pattern that is more expanded in the 
     beginning and condenses as the ease continues. This gives the illusion
     of starting fast and slowing down.
     */
    case out

    /**
     A case to denote an acceleration pattern that is both an `EaseCurve.in` 
     and `EaseCurve.out`. This gives the illusion of starting slow, speeding 
     up, then slowing down.
     */
    case inOut

}
