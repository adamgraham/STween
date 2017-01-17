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
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testUInt8Interpolation() {
        let startValue: UInt8 = 0
        let endValue: UInt8 = 10
        let expectedValue: UInt8 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testUInt16Interpolation() {
        let startValue: UInt16 = 0
        let endValue: UInt16 = 10
        let expectedValue: UInt16 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testUInt32Interpolation() {
        let startValue: UInt32 = 0
        let endValue: UInt32 = 10
        let expectedValue: UInt32 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testUInt64Interpolation() {
        let startValue: UInt64 = 0
        let endValue: UInt64 = 10
        let expectedValue: UInt64 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testIntInterpolation() {
        let startValue: Int = 0
        let endValue: Int = 10
        let expectedValue: Int = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testInt8Interpolation() {
        let startValue: Int8 = 0
        let endValue: Int8 = 10
        let expectedValue: Int8 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testInt16Interpolation() {
        let startValue: Int16 = 0
        let endValue: Int16 = 10
        let expectedValue: Int16 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testInt32Interpolation() {
        let startValue: Int32 = 0
        let endValue: Int32 = 10
        let expectedValue: Int32 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testInt64Interpolation() {
        let startValue: Int64 = 0
        let endValue: Int64 = 10
        let expectedValue: Int64 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testFloatInterpolation() {
        let startValue: Float = 0.0
        let endValue: Float = 10.0
        let expectedValue: Float = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testFloat32Interpolation() {
        let startValue: Float32 = 0.0
        let endValue: Float32 = 10.0
        let expectedValue: Float32 = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testFloat64Interpolation() {
        let startValue: Float64 = 0.0
        let endValue: Float64 = 10.0
        let expectedValue: Float64 = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testFloat80Interpolation() {
        let startValue: Float80 = 0.0
        let endValue: Float80 = 10.0
        let expectedValue: Float80 = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGFloatInterpolation() {
        let startValue: CGFloat = 0.0
        let endValue: CGFloat = 10.0
        let expectedValue: CGFloat = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testDoubleInterpolation() {
        let startValue: Double = 0.0
        let endValue: Double = 10.0
        let expectedValue: Double = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGPointInterpolation() {
        let startValue = CGPoint(x: 0.0, y: 0.0)
        let endValue = CGPoint(x: 10.0, y: 10.0)
        let expectedValue = CGPoint(x: 5.0, y: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGSizeInterpolation() {
        let startValue = CGSize(width: 0.0, height: 0.0)
        let endValue = CGSize(width: 10.0, height: 10.0)
        let expectedValue = CGSize(width: 5.0, height: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    func testCGRectInterpolation() {
        let startValue = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        let endValue = CGRect(x: 10.0, y: 10.0, width: 10.0, height: 10.0)
        let expectedValue = CGRect(x: 5.0, y: 5.0, width: 5.0, height: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, expectedValue: expectedValue)
    }

    // MARK: Assertions

    private func assertInterpolation<T: Interpolatable & Equatable>(startValue: T, endValue: T, expectedValue: T) {
        var interpolatedValue = T.interpolate(with: .linear, startValue: startValue, endValue: endValue, elapsed: 0.5, duration: 1.0)
        XCTAssertEqual(interpolatedValue, expectedValue)

        let values = InterpolationValues(start: startValue, end: endValue)
        interpolatedValue = T.interpolate(with: .linear, values: values, elapsed: 0.5, duration: 1.0)
        XCTAssertEqual(interpolatedValue, expectedValue)
    }

}
