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

    func testInterpolate() {
        let values: InterpolationValues<Double> = InterpolationValues(start: 0.0, end: 1.0)
        let interpolatedValueA = values.interpolate(with: .linear, elapsed: 0.5, duration: 1.0)
        let interpolatedValueB = Double.interpolate(from: 0.0, to: 1.0, with: .linear, elapsed: 0.5, duration: 1.0)
        XCTAssertEqual(interpolatedValueA, interpolatedValueB)
    }

}
