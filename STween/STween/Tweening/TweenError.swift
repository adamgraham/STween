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

    /// A case to denote an unexpected `object` was found that is not
    /// convertible `to` type.
    case objectNotConvertible(Any, to: Any.Type)

}

extension TweenError: CustomStringConvertible {

    // MARK: CustomStringConvertible

    /// A textual representation of `self`.
    public var description: String {
        switch self {
        case let .objectNotConvertible(object, type):
            return "TweenError.objectNotConvertible: An unexpected \(object) was found that is not convertible to \(type)."
        }
    }
    
}
