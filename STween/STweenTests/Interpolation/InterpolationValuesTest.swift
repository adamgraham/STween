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
        let values: InterpolationValues<Double> = InterpolationValues(start: 0.0, end: 1.0)
        XCTAssertEqual(values.start, 0.0)
        XCTAssertEqual(values.end, 1.0)
        let reversed = values.reversed
        XCTAssertEqual(reversed.start, 1.0)
        XCTAssertEqual(reversed.end, 0.0)
    }

}
