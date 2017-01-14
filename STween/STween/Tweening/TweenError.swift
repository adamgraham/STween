//
//  TweenError.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to encapsulate errors that may arise during tweening
/// animations.
public enum TweenError: Error {

    /// A case to denote a mismatched set of values could not be interpolated
    /// on a tweenable type.
    case invalidInterpolation(valueA: Any, valueB: Any, tweenable: Any)

}

// MARK: - CustomStringConvertible

extension TweenError: CustomStringConvertible {

    /// A textual representation of `self`.
    public var description: String {
        switch self {
        case let .invalidInterpolation(valueA, valueB, tweenable):
            return "TweenError.invalidInterpolation: A mismatched set of values, \(valueA) and \(valueB), could not be interpolated on \(tweenable)."
        }
    }
    
}
