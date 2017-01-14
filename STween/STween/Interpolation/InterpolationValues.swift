//
//  InterpolationValues.swift
//  STween
//
//  Created by Adam Graham on 1/12/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// A struct to store a start and end value that will be interpolated.
public struct InterpolationValues<T> {

    /// The start value to be interpolated.
    let start: T
    /// The end value to be interpolated.
    let end: T

    /// The reversed version of `self` where the start value is the end value, and
    /// the end value is the start value.
    var reversed: InterpolationValues<T> {
        return InterpolationValues<T>(start: self.end, end: self.start)
    }
    
}
