//
//  InterpolatableNumberTest.swift
//  STweenTests
//
//  Created by Adam Graham on 11/8/18.
//  Copyright © 2018 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class InterpolatableNumberTest: XCTestCase {

    func testFloat() {
        assertType(Float.self)
    }

    func testFloat32() {
        assertType(Float32.self)
    }

    func testFloat64() {
        assertType(Float64.self)
    }

    #if arch(i386) || arch(x86_64)
    func testFloat80() {
        assertType(Float80.self)
    }
    #endif

    func testCGFloat() {
        assertType(CGFloat.self)
    }

    func testDouble() {
        assertType(Double.self)
    }

    private func assertType<Number: InterpolatableNumber>(_ type: Number.Type) {
        XCTAssertEqual(Number(2).double, Number(4))
        XCTAssertEqual(Number(2).half, Number(1))
        XCTAssertEqual(Number(0).cos, Number(1))
        XCTAssertEqual(Number(0).sin, Number(0))
        XCTAssertEqual(cos(Number(0)), Number(1))
        XCTAssertEqual(sin(Number(0)), Number(0))
        XCTAssertEqual(sqrt(Number(4)), Number(2))
        XCTAssertEqual(pow(Number(3), Number(2)), Number(9))
        XCTAssertEqual(Number.pow(Number(3), Number(2)), Number(9))
    }

}
