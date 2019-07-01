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
        XCTAssertEqual(clamp(value: -0.5, lower: 0.0, upper: 1.0), 0.0)
        XCTAssertEqual(clamp(value: 0.0, lower: 0.0, upper: 1.0), 0.0)
        XCTAssertEqual(clamp(value: 0.5, lower: 0.0, upper: 1.0), 0.5)
        XCTAssertEqual(clamp(value: 1.0, lower: 0.0, upper: 1.0), 1.0)
        XCTAssertEqual(clamp(value: 1.5, lower: 0.0, upper: 1.0), 1.0)
    }

}
