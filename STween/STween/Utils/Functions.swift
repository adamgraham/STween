//
//  Functions.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 A function to restrict a `value` between a `lower` and `upper` range.
 
 - Parameters:
    - value: The value to be clamped to a range.
    - lower: The minimum value that can be returned.
    - upper: The maximum value that can be returned.
 
 - Returns: The clamped value between `lower` and `upper`.
 */
internal func clamp<T: Comparable>(value: T, lower: T, upper: T) -> T {
    return min(max(value, lower), upper)
}
