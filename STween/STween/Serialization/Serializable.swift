//
//  Serializable.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 A protocol to provide serialization functionality - the disassembly 
 process of an object or data structure into a storable form.
 */
public protocol Serializable {

    /**
     A method to serialize `self` into a `SerializationValue`.

     - Throws: `SerializationError.valueNotSerializable` if `self` cannot be 
                converted to a `SerializationValue`.

     - Returns: `self` serialized to a `SerializationValue`.
     */
    func serialize() throws -> SerializationValue

}

// MARK: - Default Implementation

extension Serializable {

    public final func serialize() throws -> SerializationValue {
        if let serialized = self as? SerializationValue {
            return serialized
        } else {
            throw SerializationError.valueNotSerializable(value: self)
        }
    }

}
