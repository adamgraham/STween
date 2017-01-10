//
//  SerializableTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class SerializableTest: XCTestCase {

    func testSerialize() {
        class TestClassA: NSData, SerializationValue {}

        var serializable = TestClassA() as Serializable
        var success = false

        do {
            _ = try serializable.serialize()
            success = true
        } catch let error as SerializationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The object failed to serialize with an unknown error.")
        }

        XCTAssertTrue(success)

        class TestClassB: NSData, Serializable {}

        serializable = TestClassB() as Serializable
        success = false

        do {
            _ = try serializable.serialize()
            XCTFail("The object succeeded to serialize when it was meant to fail.")
        } catch _ as SerializationError {
            success = true
        } catch {
            XCTFail("The object failed to serialize with an unknown error.")
        }

        XCTAssertTrue(success)
    }
    
}
