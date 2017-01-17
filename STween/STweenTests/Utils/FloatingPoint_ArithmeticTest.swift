//
//  FloatingPoint_ArithmeticTest.swift
//  STween
//
//  Created by Adam Graham on 1/16/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class FloatingPoint_ArithmeticTest: XCTestCase {

    func testFloat() {
        assert(Float.self, accuracy: Float.ulpOfOne.double)
    }

    func testFloat32() {
        assert(Float32.self, accuracy: Float32.ulpOfOne.double)
    }

    func testFloat64() {
        assert(Float64.self, accuracy: Float64.ulpOfOne.double)
    }

    func testFloat80() {
        //iOS_BUG: XCTAssertEqualWithAccuracy using Float80 crashes
        //assert(Float80.self, accuracy: Float80.ulpOfOne.double)
    }

    func testCGFloat() {
        assert(CGFloat.self, accuracy: CGFloat.ulpOfOne.double)
    }

    private func assert<T: FloatingPoint>(_ type: T.Type, accuracy: T) {
        let value: T = T.pi
        XCTAssertEqualWithAccuracy(cos(value), T(-1.0), accuracy: accuracy)
        XCTAssertEqualWithAccuracy(sin(value), T(0.0), accuracy: accuracy)
        XCTAssertEqualWithAccuracy(pow(value, T(2.0)), T.pi * T.pi, accuracy: accuracy)
        XCTAssertEqualWithAccuracy(value.double, T.pi_double, accuracy: accuracy)
        XCTAssertEqualWithAccuracy(value.half, T.pi_half, accuracy: accuracy)
        XCTAssertEqualWithAccuracy(T.zero, T(0.0), accuracy: accuracy)
        XCTAssertEqualWithAccuracy(T.pi_double, T.pi * T(2.0), accuracy: accuracy)
        XCTAssertEqualWithAccuracy(T.pi_half, T.pi / T(2.0), accuracy: accuracy)
    }

}
