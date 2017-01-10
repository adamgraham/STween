//
//  DeserializationErrorTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class DeserializationErrorTest: XCTestCase {

    func testValueNotDeserializable() {
        class TestClass: Deserializable {}
        let error = DeserializationError.valueNotDeserializable(value: TestClass(), to: NSObject.self)
        XCTAssertEqual(error.description, "DeserializationError.valueNotDeserializable: An unexpected STweenTests.DeserializationErrorTest.(testValueNotDeserializable () -> ()).(TestClass #1) was found that is not deserializable to NSObject.")
    }
    
}
