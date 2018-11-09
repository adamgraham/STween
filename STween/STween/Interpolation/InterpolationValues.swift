//
//  InterpolationValues.swift
//  STween
//
//  Created by Adam Graham on 1/12/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

/// A struct to store a start and end value for interpolation purposes.
internal struct InterpolationValues<T: Interpolatable> where T.Value == T {

    // MARK: Stored Properties

    /// The start value to be interpolated.
    internal let start: T
    /// The end value to be interpolated.
    internal let end: T

    // MARK: Computed Properties

    /// The reversed version of `self` where the start value is the end value, and the end value
    /// is the start value.
    internal var reversed: InterpolationValues<T> {
        return InterpolationValues(start: self.end, end: self.start)
    }

    // MARK: Methods

    /**
     A method to calculate the value between `self.start` and `self.end` at a specific
     point in time.
     
     - Parameters:
        - ease: The `Ease` function used to interpolate values.
        - elapsed: The elapsed amount of time passed to the `ease` function.
        - duration: The duration of time passed to the `ease` function.

     - Returns: The value interpolated between the start and end value.
     */
    internal func interpolate(with ease: Ease,
                              elapsed: TimeInterval, duration: TimeInterval) -> T {

        return T.interpolate(from: self.start, to: self.end, with: ease,
                             elapsed: elapsed, duration: duration)
    }
    
}
