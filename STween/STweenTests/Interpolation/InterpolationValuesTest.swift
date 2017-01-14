//
//  InterpolationValuesTest.swift
//  STween
//
//  Created by Adam Graham on 1/12/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class InterpolationValuesTest: XCTestCase {

    func testValues() {
        let values = InterpolationValues(start: "a", end: "b")
        XCTAssertEqual(values.start, "a")
        XCTAssertEqual(values.end, "b")
        let reversed = values.reversed
        XCTAssertEqual(reversed.start, "b")
        XCTAssertEqual(reversed.end, "a")
    }

}
