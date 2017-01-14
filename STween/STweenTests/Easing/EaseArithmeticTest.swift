//
//  EaseArithmeticTest.swift
//  STween
//
//  Created by Adam Graham on 1/4/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class EaseArithmeticTest: XCTestCase {

}

// MARK: - UInt Tests

extension EaseArithmeticTest {

    // Identity Tests

    func testUIntIdentity() {
        XCTAssertEqual(UInt.identity, 0)
    }

    // Unary Tests

    func testUIntUnaryPlus() {
        let a: UInt = 1
        XCTAssertEqual(+a, 1)
    }

    func testUIntUnaryMinus() {
        let a: UInt = 1
        XCTAssertEqual(-a, 1)
    }

    // LHS Arithmetic Tests

    func testUIntAdditionLHS() {
        let a: UInt = 1
        let b: Double = 0.5
        XCTAssertEqual(a+b, 1)
    }

    func testUIntAdditionLHSNegative() {
        let a: UInt = 1
        let b: Double = -2.5
        XCTAssertEqual(a+b, 0)
    }

    func testUIntSubtractionLHS() {
        let a: UInt = 1
        let b: Double = 0.5
        XCTAssertEqual(a-b, 0)
    }

    func testUIntSubtractionLHSNegative() {
        let a: UInt = 1
        let b: Double = 2.5
        XCTAssertEqual(a-b, 0)
    }

    func testUIntMultiplicationLHS() {
        let a: UInt = 1
        let b: Double = 0.5
        XCTAssertEqual(a*b, 0)
    }

    func testUIntMultiplicationLHSNegative() {
        let a: UInt = 1
        let b: Double = -2.5
        XCTAssertEqual(a*b, 0)
    }

    func testUIntDivisionLHS() {
        let a: UInt = 1
        let b: Double = 0.5
        XCTAssertEqual(a/b, 2)
    }

    func testUIntDivisionLHSNegative() {
        let a: UInt = 1
        let b: Double = -2.5
        XCTAssertEqual(a/b, 0)
    }

    // RHS Arithmetic Tests

    func testUIntAdditionRHS() {
        let a: Double = 0.5
        let b: UInt = 1
        XCTAssertEqual(a+b, 1)
    }

    func testUIntAdditionRHSNegative() {
        let a: Double = -2.5
        let b: UInt = 1
        XCTAssertEqual(a+b, 0)
    }

    func testUIntSubtractionRHS() {
        let a: Double = 0.5
        let b: UInt = 1
        XCTAssertEqual(a-b, 0)
    }

    func testUIntSubtractionRHSNegative() {
        let a: Double = -2.5
        let b: UInt = 1
        XCTAssertEqual(a-b, 0)
    }

    func testUIntMultiplicationRHS() {
        let a: Double = 0.5
        let b: UInt = 1
        XCTAssertEqual(a*b, 0)
    }

    func testUIntMultiplicationRHSNegative() {
        let a: Double = -2.5
        let b: UInt = 1
        XCTAssertEqual(a*b, 0)
    }

    func testUIntDivisionRHS() {
        let a: Double = 0.5
        let b: UInt = 1
        XCTAssertEqual(a/b, 0)
    }

    func testUIntDivisionRHSNegative() {
        let a: Double = -2.5
        let b: UInt = 1
        XCTAssertEqual(a/b, 0)
    }

}

// MARK: - Int Tests

extension EaseArithmeticTest {

    // Identity Tests

    func testIntIdentity() {
        XCTAssertEqual(Int.identity, 0)
    }

    // Unary Tests

    func testIntUnaryPlus() {
        let a: Int = 1
        XCTAssertEqual(+a, 1)
    }

    func testIntUnaryMinus() {
        let a: Int = 1
        XCTAssertEqual(-a, -1)
    }

    // LHS Arithmetic Tests

    func testIntAdditionLHS() {
        let a: Int = 1
        let b: Double = 0.5
        XCTAssertEqual(a+b, 1)
    }

    func testIntSubtractionLHS() {
        let a: Int = 1
        let b: Double = 0.5
        XCTAssertEqual(a-b, 0)
    }

    func testIntMultiplicationLHS() {
        let a: Int = 1
        let b: Double = 0.5
        XCTAssertEqual(a*b, 0)
    }

    func testIntDivisionLHS() {
        let a: Int = 1
        let b: Double = 0.5
        XCTAssertEqual(a/b, 2)
    }

    // RHS Arithmetic Tests

    func testIntAdditionRHS() {
        let a: Double = 0.5
        let b: Int = 1
        XCTAssertEqual(a+b, 1)
    }

    func testIntSubtractionRHS() {
        let a: Double = 0.5
        let b: Int = 1
        XCTAssertEqual(a-b, 0)
    }

    func testIntMultiplicationRHS() {
        let a: Double = 0.5
        let b: Int = 1
        XCTAssertEqual(a*b, 0)
    }

    func testIntDivisionRHS() {
        let a: Double = 0.5
        let b: Int = 1
        XCTAssertEqual(a/b, 0)
    }
    
}

// MARK: - Double Tests

extension EaseArithmeticTest {

    // Identity Tests

    func testDoubleIdentity() {
        XCTAssertEqual(Double.identity, 0.0)
    }
    
}

// MARK: - Float Tests

extension EaseArithmeticTest {

    // Identity Tests

    func testFloatIdentity() {
        XCTAssertEqual(Float.identity, 0.0)
    }

    // Unary Tests

    func testFloatUnaryPlus() {
        let a: Float = 1.0
        XCTAssertEqual(+a, 1.0)
    }

    func testFloatUnaryMinus() {
        let a: Float = 1.0
        XCTAssertEqual(-a, -1.0)
    }

    // LHS Arithmetic Tests

    func testFloatAdditionLHS() {
        let a: Float = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a+b, 1.5)
    }

    func testFloatSubtractionLHS() {
        let a: Float = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a-b, 0.5)
    }

    func testFloatMultiplicationLHS() {
        let a: Float = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a*b, 0.5)
    }

    func testFloatDivisionLHS() {
        let a: Float = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a/b, 2.0)
    }

    // RHS Arithmetic Tests

    func testFloatAdditionRHS() {
        let a: Double = 0.5
        let b: Float = 1.0
        XCTAssertEqual(a+b, 1.5)
    }

    func testFloatSubtractionRHS() {
        let a: Double = 0.5
        let b: Float = 1.0
        XCTAssertEqual(a-b, -0.5)
    }

    func testFloatMultiplicationRHS() {
        let a: Double = 0.5
        let b: Float = 1.0
        XCTAssertEqual(a*b, 0.5)
    }

    func testFloatDivisionRHS() {
        let a: Double = 0.5
        let b: Float = 1.0
        XCTAssertEqual(a/b, 0.5)
    }
    
}

// MARK: - CGFloat Tests

extension EaseArithmeticTest {

    // Identity Tests

    func testCGFloatIdentity() {
        XCTAssertEqual(CGFloat.identity, 0.0)
    }

    // Unary Tests

    func testCGFloatUnaryPlus() {
        let a: CGFloat = 1.0
        XCTAssertEqual(+a, 1.0)
    }

    func testCGFloatUnaryMinus() {
        let a: CGFloat = 1.0
        XCTAssertEqual(-a, -1.0)
    }

    // LHS Arithmetic Tests

    func testCGFloatAdditionLHS() {
        let a: CGFloat = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a+b, 1.5)
    }

    func testCGFloatSubtractionLHS() {
        let a: CGFloat = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a-b, 0.5)
    }

    func testCGFloatMultiplicationLHS() {
        let a: CGFloat = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a*b, 0.5)
    }

    func testCGFloatDivisionLHS() {
        let a: CGFloat = 1.0
        let b: Double = 0.5
        XCTAssertEqual(a/b, 2.0)
    }

    // RHS Arithmetic Tests

    func testCGFloatAdditionRHS() {
        let a: Double = 0.5
        let b: CGFloat = 1.0
        XCTAssertEqual(a+b, 1.5)
    }

    func testCGFloatSubtractionRHS() {
        let a: Double = 0.5
        let b: CGFloat = 1.0
        XCTAssertEqual(a-b, -0.5)
    }

    func testCGFloatMultiplicationRHS() {
        let a: Double = 0.5
        let b: CGFloat = 1.0
        XCTAssertEqual(a*b, 0.5)
    }

    func testCGFloatDivisionRHS() {
        let a: Double = 0.5
        let b: CGFloat = 1.0
        XCTAssertEqual(a/b, 0.5)
    }
    
}
