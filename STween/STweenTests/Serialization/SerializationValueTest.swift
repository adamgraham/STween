//
//  SerializationValueTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class SerializationValueTest: XCTestCase {

    func testNSObject() {
        let object: NSObject = NSObject()
        XCTAssertNil(object as? SerializationValue)
        XCTAssertNil(object as? Serializable)
        XCTAssertNil(object as? Deserializable)
    }

    func testUInt() {
        let value: UInt = 0
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }

    func testInt() {
        let value: Int = 0
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }

    func testDouble() {
        let value: Double = 0.0
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }

    func testFloat() {
        let value: Float = 0.0
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }

    func testCGFloat() {
        let value: CGFloat = 0.0
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }

    func testCGPoint() {
        let value: CGPoint = CGPoint()
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }

    func testCGSize() {
        let value: CGSize = CGSize()
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }

    func testCGRect() {
        let value: CGRect = CGRect()
        XCTAssertNotNil(value as SerializationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as Deserializable)
    }
    
}
