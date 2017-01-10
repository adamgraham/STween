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

    func testTargetFrameRate() {
        FrameRate.targetFrameRate = 30.0
        XCTAssertEqual(FrameRate.targetFrameRate, 30.0)
        FrameRate.targetFrameRate = 24.0
        XCTAssertEqual(FrameRate.targetFrameRate, 24.0)
    }

    func testTargetFrameDuration() {
        FrameRate.targetFrameRate = 30.0
        XCTAssertEqual(FrameRate.targetFrameDuration, 1.0 / 30.0)
        FrameRate.targetFrameRate = 24.0
        XCTAssertEqual(FrameRate.targetFrameDuration, 1.0 / 24.0)
    }

    func testReset() {
        FrameRate.targetFrameRate = Defaults.frameRate * 2.0
        FrameRate.reset()
        XCTAssertEqual(FrameRate.targetFrameRate, Defaults.frameRate)
    }

}
