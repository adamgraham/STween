//
//  FunctionsTest.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class FunctionsTest: XCTestCase {

    func testClamp() {
        let lower = 0.0
        let upper = 1.0

        var value = -0.5
        XCTAssertEqual(clamp(value: value, lower: lower, upper: upper), 0.0)

        value = 0.0
        XCTAssertEqual(clamp(value: value, lower: lower, upper: upper), 0.0)

        value = 0.5
        XCTAssertEqual(clamp(value: value, lower: lower, upper: upper), 0.5)

        value = 1.0
        XCTAssertEqual(clamp(value: value, lower: lower, upper: upper), 1.0)

        value = 1.5
        XCTAssertEqual(clamp(value: value, lower: lower, upper: upper), 1.0)
    }

}
