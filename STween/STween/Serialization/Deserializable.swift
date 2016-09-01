//
//  Deserializable.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 A protocol to provide deserialization functionality - the reassembly 
 process of an object or data structure back into its actual form or type.
 */
public protocol Deserializable {

    /**
     A method to deserialize `self` into an expected type.
     
     - Throws: `DeserializationError.valueNotDeserializable` if `self` cannot
                be converted to an expected type.

     - Returns: `self` deserialized to an expected type.
     */
    func deserialize<T>() throws -> T

}

// MARK: - Default Implementation

extension Deserializable {

    public final func deserialize<T>() throws -> T {
        if let deserialized = self as? T {
            return deserialized
        } else {
            throw DeserializationError.valueNotDeserializable(value: self, to: T.self)
        }
    }

}
