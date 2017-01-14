//
//  InterpolatableTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class InterpolatableTest: XCTestCase {

    // MARK: Custom Implementation Tests

    func testUIntInterpolation() {
        let startValue: UInt = 0
        let endValue: UInt = 10
        let expectedValue: UInt = 5
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testIntInterpolation() {
        let startValue: Int = 0
        let endValue: Int = 10
        let expectedValue: Int = 5
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testDoubleInterpolation() {
        let startValue: Double = 0.0
        let endValue: Double = 10.0
        let expectedValue: Double = 5.0
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testFloatInterpolation() {
        let startValue: Float = 0.0
        let endValue: Float = 10.0
        let expectedValue: Float = 5.0
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGFloatInterpolation() {
        let startValue: CGFloat = 0.0
        let endValue: CGFloat = 10.0
        let expectedValue: CGFloat = 5.0
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGPointInterpolation() {
        let startValue = CGPoint(x: 0.0, y: 0.0)
        let endValue = CGPoint(x: 10.0, y: 10.0)
        let expectedValue = CGPoint(x: 5.0, y: 5.0)
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGSizeInterpolation() {
        let startValue = CGSize(width: 0.0, height: 0.0)
        let endValue = CGSize(width: 10.0, height: 10.0)
        let expectedValue = CGSize(width: 5.0, height: 5.0)
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGRectInterpolation() {
        let startValue = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        let endValue = CGRect(x: 10.0, y: 10.0, width: 10.0, height: 10.0)
        let expectedValue = CGRect(x: 5.0, y: 5.0, width: 5.0, height: 5.0)
        InterpolatableTest.assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    // MARK: Assertions

    static func assertInterpolation<T: Interpolatable & Equatable>(startValue: T, endValue: T, expectedValue: T) {
        var interpolatedValue = T.interpolate(with: .linear, startValue: startValue, endValue: endValue, elapsed: 0.5, duration: 1.0)
        XCTAssertEqual(interpolatedValue, expectedValue)

        let values = InterpolationValues(start: startValue, end: endValue)
        interpolatedValue = T.interpolate(with: .linear, values: values, elapsed: 0.5, duration: 1.0)
        XCTAssertEqual(interpolatedValue, expectedValue)
    }

}
