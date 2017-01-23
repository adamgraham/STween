//
//  InterpolationValues.swift
//  STween
//
//  Created by Adam Graham on 1/12/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// A struct to store a start and end value for interpolation purposes.
public struct InterpolationValues<T> {

    // MARK: Stored Properties

    /// The start value to be interpolated.
    let start: T
    /// The end value to be interpolated.
    let end: T

    // MARK: Computed Properties

    /// The reversed version of `self` where the start value is the end value, and
    /// the end value is the start value.
    var reversed: InterpolationValues<T> {
        return InterpolationValues<T>(start: self.end, end: self.start)
    }
    
}
