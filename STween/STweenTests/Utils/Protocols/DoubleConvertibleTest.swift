//
//  DoubleConvertibleTest.swift
//  STween
//
//  Created by Adam Graham on 7/10/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class DoubleConvertibleTest: XCTestCase {

    // MARK: Initializer Tests

    func testUIntDoubleConvertibleInit() {
        let value: UInt = 1
        let doubleConvertible = value as DoubleConvertible
        XCTAssertEqual(Double(convertible: doubleConvertible), 1.0)
    }

    func testIntDoubleConvertibleInit() {
        let value: Int = 1
        let doubleConvertible = value as DoubleConvertible
        XCTAssertEqual(Double(convertible: doubleConvertible), 1.0)
    }

    func testDoubleDoubleConvertibleInit() {
        let value: Double = 1.0
        let doubleConvertible = value as DoubleConvertible
        XCTAssertEqual(Double(convertible: doubleConvertible), 1.0)
    }

    func testFloatDoubleConvertibleInit() {
        let value: Float = 1.0
        let doubleConvertible = value as DoubleConvertible
        XCTAssertEqual(Double(convertible: doubleConvertible), 1.0)
    }

    func testCGFloatDoubleConvertibleInit() {
        let value: CGFloat = 1.0
        let doubleConvertible = value as DoubleConvertible
        XCTAssertEqual(Double(convertible: doubleConvertible), 1.0)
    }

    // MARK: Getter Tests

    func testUIntDoubleValueGetter() {
        let value: UInt = 1
        XCTAssertEqual(value.doubleValue, 1.0)
    }

    func testIntDoubleValueGetter() {
        let value: Int = 1
        XCTAssertEqual(value.doubleValue, 1.0)
    }

    func testDoubleDoubleValueGetter() {
        let value: Double = 1.0
        XCTAssertEqual(value.doubleValue, 1.0)
    }

    func testFloatDoubleValueGetter() {
        let value: Float = 1.0
        XCTAssertEqual(value.doubleValue, 1.0)
    }

    func testCGFloatDoubleValueGetter() {
        let value: CGFloat = 1.0
        XCTAssertEqual(value.doubleValue, 1.0)
    }

}
