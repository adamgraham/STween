//
//  RGBATest.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class RGBATest: XCTestCase {

    // MARK: Properties

    static let rgba: [RGBA] = [
        RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0),
        RGBA(red: 0.333333333333333, green: 0.333333333333333, blue: 0.333333333333333, alpha: 1.0),
        RGBA(red: 0.666666666666667, green: 0.666666666666667, blue: 0.666666666666667, alpha: 1.0),
        RGBA(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
        RGBA(red: 0.5, green: 0.5, blue: 0.5, alpha: 1.0),
        RGBA(red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0),
        RGBA(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0),
        RGBA(red: 0.0, green: 0.0, blue: 1.0, alpha: 1.0),
        RGBA(red: 0.0, green: 1.0, blue: 1.0, alpha: 1.0),
        RGBA(red: 1.0, green: 1.0, blue: 0.0, alpha: 1.0),
        RGBA(red: 1.0, green: 0.0, blue: 1.0, alpha: 1.0),
        RGBA(red: 1.0, green: 0.5, blue: 0.0, alpha: 1.0),
        RGBA(red: 0.5, green: 0.0, blue: 0.5, alpha: 1.0),
        RGBA(red: 0.6, green: 0.4, blue: 0.2, alpha: 1.0),
        RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
    ]

    // MARK: Getter Tests

    func testColorGetter() {
        for (index, rgba) in RGBATest.rgba.enumerated() {
            XCTAssertColor(rgba.color, UIColor_RGBATest.colors[index])
        }
    }

    // MARK: Equatable Tests

    func testEquatable() {
        RGBATest.rgba.forEach {
            XCTAssertEqual($0, RGBA(red: $0.red,
                                    green: $0.green,
                                    blue: $0.blue,
                                    alpha: $0.alpha))
        }
    }

    func testNotEquatable() {
        RGBATest.rgba.forEach {
            XCTAssertNotEqual($0, RGBA(red: CGFloat.greatestFiniteMagnitude,
                                       green: CGFloat.greatestFiniteMagnitude,
                                       blue: CGFloat.greatestFiniteMagnitude,
                                       alpha: CGFloat.greatestFiniteMagnitude))
        }
    }

    // MARK: CustomStringConvertible Tests

    func testCustomStringConvertible() {
        let descriptions: [String] = [
            "Red: 0.0, Green: 0.0, Blue: 0.0, Alpha: 1.0",
            "Red: 0.333333333333333, Green: 0.333333333333333, Blue: 0.333333333333333, Alpha: 1.0",
            "Red: 0.666666666666667, Green: 0.666666666666667, Blue: 0.666666666666667, Alpha: 1.0",
            "Red: 1.0, Green: 1.0, Blue: 1.0, Alpha: 1.0",
            "Red: 0.5, Green: 0.5, Blue: 0.5, Alpha: 1.0",
            "Red: 1.0, Green: 0.0, Blue: 0.0, Alpha: 1.0",
            "Red: 0.0, Green: 1.0, Blue: 0.0, Alpha: 1.0",
            "Red: 0.0, Green: 0.0, Blue: 1.0, Alpha: 1.0",
            "Red: 0.0, Green: 1.0, Blue: 1.0, Alpha: 1.0",
            "Red: 1.0, Green: 1.0, Blue: 0.0, Alpha: 1.0",
            "Red: 1.0, Green: 0.0, Blue: 1.0, Alpha: 1.0",
            "Red: 1.0, Green: 0.5, Blue: 0.0, Alpha: 1.0",
            "Red: 0.5, Green: 0.0, Blue: 0.5, Alpha: 1.0",
            "Red: 0.6, Green: 0.4, Blue: 0.2, Alpha: 1.0",
            "Red: 0.0, Green: 0.0, Blue: 0.0, Alpha: 0.0"
        ]

        XCTAssertEqual(RGBATest.rgba.count, descriptions.count)

        for (index, rgba) in RGBATest.rgba.enumerated() {
            XCTAssertEqual(rgba.description, descriptions[index])
        }
    }

}
