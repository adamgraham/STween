//
//  UIColor+RGBATest.swift
//  STween
//
//  Created by Adam Graham on 6/20/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UIColor_RGBATest: XCTestCase {

    // MARK: Properties

    static let colors: [UIColor] = [
        UIColor.black,
        UIColor.darkGray,
        UIColor.lightGray,
        UIColor.white,
        UIColor.gray,
        UIColor.red,
        UIColor.green,
        UIColor.blue,
        UIColor.cyan,
        UIColor.yellow,
        UIColor.magenta,
        UIColor.orange,
        UIColor.purple,
        UIColor.brown,
        UIColor.clear
    ]

    static let reds: [CGFloat] = [
        0.0,
        0.333333333333333,
        0.666666666666667,
        1.0,
        0.5,
        1.0,
        0.0,
        0.0,
        0.0,
        1.0,
        1.0,
        1.0,
        0.5,
        0.6,
        0.0
    ]

    static let greens: [CGFloat] = [
        0.0,
        0.333333333333333,
        0.666666666666667,
        1.0,
        0.5,
        0.0,
        1.0,
        0.0,
        1.0,
        1.0,
        0.0,
        0.5,
        0.0,
        0.4,
        0.0
    ]

    static let blues: [CGFloat] = [
        0.0,
        0.333333333333333,
        0.666666666666667,
        1.0,
        0.5,
        0.0,
        0.0,
        1.0,
        1.0,
        0.0,
        1.0,
        0.0,
        0.5,
        0.2,
        0.0
    ]

    static let alphas: [CGFloat] = [
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        1.0,
        0.0
    ]

    // MARK: Getter Tests

    func testComponentsGetter() {
        for (index, color) in UIColor_RGBATest.colors.enumerated() {
            let components = color.components
            XCTAssertEqualWithAccuracy(components.red, UIColor_RGBATest.reds[index], accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(components.green, UIColor_RGBATest.greens[index], accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(components.blue, UIColor_RGBATest.blues[index], accuracy: CGFloat(FLT_EPSILON))
            XCTAssertEqualWithAccuracy(components.alpha, UIColor_RGBATest.alphas[index], accuracy: CGFloat(FLT_EPSILON))
        }
    }

    func testRedGetter() {
        XCTAssertEqual(UIColor_RGBATest.colors.count, UIColor_RGBATest.reds.count)

        for (index, color) in UIColor_RGBATest.colors.enumerated() {
            XCTAssertEqualWithAccuracy(color.red, UIColor_RGBATest.reds[index], accuracy: CGFloat(FLT_EPSILON))
        }
    }

    func testGreenGetter() {
        XCTAssertEqual(UIColor_RGBATest.colors.count, UIColor_RGBATest.greens.count)

        for (index, color) in UIColor_RGBATest.colors.enumerated() {
            XCTAssertEqualWithAccuracy(color.green, UIColor_RGBATest.greens[index], accuracy: CGFloat(FLT_EPSILON))
        }
    }

    func testBlueGetter() {
        XCTAssertEqual(UIColor_RGBATest.colors.count, UIColor_RGBATest.blues.count)

        for (index, color) in UIColor_RGBATest.colors.enumerated() {
            XCTAssertEqualWithAccuracy(color.blue, UIColor_RGBATest.blues[index], accuracy: CGFloat(FLT_EPSILON))
        }
    }

    func testAlphaGetter() {
        XCTAssertEqual(UIColor_RGBATest.colors.count, UIColor_RGBATest.alphas.count)

        for (index, color) in UIColor_RGBATest.colors.enumerated() {
            XCTAssertEqualWithAccuracy(color.alpha, UIColor_RGBATest.alphas[index], accuracy: CGFloat(FLT_EPSILON))
        }
    }

    func testRGBAGetter() {
        XCTAssertEqual(UIColor_RGBATest.colors.count, RGBATest.rgba.count)

        for (index, color) in UIColor_RGBATest.colors.enumerated() {
            XCTAssertEqual(color.rgba, RGBATest.rgba[index])
        }
    }

}
