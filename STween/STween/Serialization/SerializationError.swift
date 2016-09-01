//
//  SerializationError.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An enum to encapsulate errors that may arise while working with
 `Serializable`.
 */
public enum SerializationError: Swift.Error {

    /**
     A case to denote an unexpected `Serializable` `value` was found that is
     not serializable.
     */
    case valueNotSerializable(value: Serializable)

}

// MARK: - CustomStringConvertible

extension SerializationError: Swift.CustomStringConvertible {

    /// A textual representation of `self`.
    public var description: Swift.String {
        switch self {
        case let .valueNotSerializable(value):
            return "SerializationError.valueNotSerializable: An unexpected \(value) was found that is not serializable."
        }
    }

}
