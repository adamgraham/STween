//
//  SerializationValue.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to define a type that can be serialized and deserialized.
public protocol SerializationValue: Serializable, Deserializable {

}

// MARK: - Conformance

extension Swift.UInt: SerializationValue {

}

extension Swift.Int: SerializationValue {

}

extension Swift.Double: SerializationValue {

}

extension Swift.Float: SerializationValue {

}

extension CoreGraphics.CGFloat: SerializationValue {

}

extension CoreGraphics.CGPoint: SerializationValue {

}

extension CoreGraphics.CGSize: SerializationValue {

}

extension CoreGraphics.CGRect: SerializationValue {

}
