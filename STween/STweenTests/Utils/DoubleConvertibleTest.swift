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
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testUInt8DoubleConvertibleInit() {
        let value: UInt8 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testUInt16DoubleConvertibleInit() {
        let value: UInt16 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testUInt32DoubleConvertibleInit() {
        let value: UInt32 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testUInt64DoubleConvertibleInit() {
        let value: UInt64 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testIntDoubleConvertibleInit() {
        let value: Int = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testInt8DoubleConvertibleInit() {
        let value: Int8 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testInt16DoubleConvertibleInit() {
        let value: Int16 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testInt32DoubleConvertibleInit() {
        let value: Int32 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testInt64DoubleConvertibleInit() {
        let value: Int64 = 1
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testFloatDoubleConvertibleInit() {
        let value: Float = 1.0
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testFloat32DoubleConvertibleInit() {
        let value: Float32 = 1.0
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testFloat64DoubleConvertibleInit() {
        let value: Float64 = 1.0
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testFloat80DoubleConvertibleInit() {
        let value: Float80 = 1.0
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testCGFloatDoubleConvertibleInit() {
        let value: CGFloat = 1.0
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    func testDoubleDoubleConvertibleInit() {
        let value: Double = 1.0
        XCTAssertEqual(Double(convertible: value), 1.0)
    }

    // MARK: Getter Tests

    func testUIntDoubleValueGetter() {
        let value: UInt = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testUInt8DoubleValueGetter() {
        let value: UInt8 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testUInt16DoubleValueGetter() {
        let value: UInt16 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testUInt32DoubleValueGetter() {
        let value: UInt32 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testUInt64DoubleValueGetter() {
        let value: UInt64 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testIntDoubleValueGetter() {
        let value: Int = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testInt8DoubleValueGetter() {
        let value: Int8 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testInt16DoubleValueGetter() {
        let value: Int16 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testInt32DoubleValueGetter() {
        let value: Int32 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testInt64DoubleValueGetter() {
        let value: Int64 = 1
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testFloatDoubleValueGetter() {
        let value: Float = 1.0
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testFloat32DoubleValueGetter() {
        let value: Float32 = 1.0
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testFloat64DoubleValueGetter() {
        let value: Float64 = 1.0
        XCTAssertEqual(value.toDouble, 1.0)
    }

    #if arch(i386) || arch(x86_64)
    func testFloat80DoubleValueGetter() {
        let value: Float80 = 1.0
        XCTAssertEqual(value.toDouble, 1.0)
    }
    #endif

    func testCGFloatDoubleValueGetter() {
        let value: CGFloat = 1.0
        XCTAssertEqual(value.toDouble, 1.0)
    }

    func testDoubleDoubleValueGetter() {
        let value: Double = 1.0
        XCTAssertEqual(value.toDouble, 1.0)
    }
    
}
