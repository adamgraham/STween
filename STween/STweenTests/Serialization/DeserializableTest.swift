//
//  DeserializableTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class DeserializableTest: XCTestCase {

    func testDeserialize() {
        class TestClass: NSData, Deserializable {}

        let deserializable = TestClass() as Deserializable
        var success = false

        do {
            let _: NSData = try deserializable.deserialize()
            success = true
        } catch let error as DeserializationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The object failed to deserialize with an unknown error.")
        }

        XCTAssertTrue(success)
        success = false

        do {
            let _: NSArray = try deserializable.deserialize()
            XCTFail("The object succeeded to deserialize when it was meant to fail.")
        } catch _ as DeserializationError {
            success = true
        } catch {
            XCTFail("The object failed to deserialize with an unknown error.")
        }

        XCTAssertTrue(success)
    }

}
