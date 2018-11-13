//
//  InterpolationValues.swift
//  STween
//
//  Created by Adam Graham on 1/12/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import Foundation

/// A start and end value used for interpolation.
internal struct InterpolationValues<T: Interpolatable> where T.Value == T {

    // MARK: Stored Properties

    /// The start value to be interpolated.
    internal let start: T
    /// The end value to be interpolated.
    internal let end: T

    // MARK: Computed Properties

    /// The reversal of the start and end values –
    /// the end becomes the start, the start becomes the end.
    internal var reversed: InterpolationValues<T> {
        return InterpolationValues(start: self.end, end: self.start)
    }

    // MARK: Methods

    /**
     Calculates the value between the start and end value at a specific point in time.
     
     - Parameters:
        - ease: The `Ease` used to interpolate values.
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
