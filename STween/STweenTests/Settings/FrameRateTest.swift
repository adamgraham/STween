//
//  FrameRateTest.swift
//  STween
//
//  Created by Adam Graham on 6/17/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class FrameRateTest: XCTestCase {

    override func tearDown() {
        Defaults.reset()
        super.tearDown()
    }

    func testTargetFrameRate() {
        Defaults.frameRate = 30.0
        XCTAssertEqual(FrameRate.targetFrameRate, 30.0)
        Defaults.frameRate = 24.0
        XCTAssertEqual(FrameRate.targetFrameRate, 24.0)
    }

    func testTargetFrameDuration() {
        Defaults.frameRate = 30.0
        XCTAssertEqual(FrameRate.targetFrameDuration, 1.0 / 30.0)
        Defaults.frameRate = 24.0
        XCTAssertEqual(FrameRate.targetFrameDuration, 1.0 / 24.0)
    }

}
