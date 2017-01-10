//
//  SerializationErrorTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class SerializationErrorTest: XCTestCase {

    func testValueNotSerializable() {
        class TestClass: Serializable {}
        let error = SerializationError.valueNotSerializable(value: TestClass())
        XCTAssertEqual(error.description, "SerializationError.valueNotSerializable: An unexpected STweenTests.SerializationErrorTest.(testValueNotSerializable () -> ()).(TestClass #1) was found that is not serializable.")
    }
    
}
