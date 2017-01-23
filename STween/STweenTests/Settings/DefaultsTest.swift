//
//  DefaultsTest.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class DefaultsTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Defaults.reset()
    }

    override func tearDown() {
        Defaults.reset()
        super.tearDown()
    }

    func testDefaultFrameRate() {
        XCTAssertEqual(Defaults.frameRate, 30.0)
    }

    func testDefaultEase() {
        XCTAssertEqual(Defaults.ease, .quadOut)
    }

    func testDefaultOvershoot() {
        XCTAssertEqual(Defaults.overshoot, 1.70158)
    }

    func testDefaultDelay() {
        XCTAssertEqual(Defaults.delay, 0.0)
    }

    func testDefaultReversed() {
        XCTAssertFalse(Defaults.reversed)
    }

    func testDefaultAutoStartTweens() {
        XCTAssertTrue(Defaults.autoStartTweens)
    }

    func testDefaultAutoKillCompletedTweens() {
        XCTAssertTrue(Defaults.autoKillCompletedTweens)
    }

    func testRestDefaults() {
        Defaults.frameRate = 60.0
        Defaults.ease = .backOut
        Defaults.overshoot = 1.0
        Defaults.delay = 1.0
        Defaults.reversed = true
        Defaults.autoStartTweens = false
        Defaults.autoKillCompletedTweens = false
        Defaults.reset()

        XCTAssertEqual(Defaults.frameRate, 30.0)
        XCTAssertEqual(Defaults.ease, .quadOut)
        XCTAssertEqual(Defaults.overshoot, 1.70158)
        XCTAssertEqual(Defaults.delay, 0.0)
        XCTAssertFalse(Defaults.reversed)
        XCTAssertTrue(Defaults.autoStartTweens)
        XCTAssertTrue(Defaults.autoKillCompletedTweens)
    }

}
