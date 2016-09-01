//
//  DeserializationError.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An enum to encapsulate errors that may arise while working with
 `Deserializable`.
 */
public enum DeserializationError: Swift.Error {

    /**
     A case to denote an unexpected `Deserializable` `value` was found that
     is not deserializable `to` type.
     */
    case valueNotDeserializable(value: Deserializable, to: Any.Type)
    
}

// MARK: - CustomStringConvertible

extension DeserializationError: Swift.CustomStringConvertible {

    /// A textual representation of `self`.
    public var description: Swift.String {
        switch self {
        case let .valueNotDeserializable(value, type):
            return "DeserializationError.valueNotDeserializable: An unexpected \(value) was found that is not deserializable to \(type)."
        }
    }
    
}
