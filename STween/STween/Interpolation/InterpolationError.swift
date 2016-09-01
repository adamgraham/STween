//
//  InterpolationError.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An enum to encapsulate errors that may arise while working with
`Interpolatable`.
 */
public enum InterpolationError: Swift.Error {

    /**
     A case to denote an unexpected `InterpolationValue` `value` was 
     found that is not convertible `to` type.
     */
    case valueNotConvertible(value: InterpolationValue, to: Any.Type)

}

// MARK: - CustomStringConvertible

extension InterpolationError: Swift.CustomStringConvertible {

    /// A textual representation of `self`.
    public var description: Swift.String {
        switch self {
        case let .valueNotConvertible(value, type):
            return "InterpolationError.valueNotConvertible: An unexpected \(value) was found that is not convertible to \(type)."
        }
    }

}
