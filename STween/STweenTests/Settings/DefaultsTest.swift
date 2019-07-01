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

    func testDefaultEase() {
        XCTAssertEqual(Defaults.ease, .quadOut)
    }

    func testDefaultOvershoot() {
        XCTAssertEqual(Defaults.overshoot, 1.70158)
    }

    func testDefaultDuration() {
        XCTAssertEqual(Defaults.duration, 0.3)
    }

    func testDefaultDelay() {
        XCTAssertEqual(Defaults.delay, 0.0)
    }

    func testDefaultAutoStartTweens() {
        XCTAssertTrue(Defaults.autoStartTweens)
    }

    func testDefaultAutoKillCompletedTweens() {
        XCTAssertTrue(Defaults.autoKillCompletedTweens)
    }

    func testRestDefaults() {
        Defaults.ease = .backOut
        Defaults.overshoot = 1.0
        Defaults.duration = 1.0
        Defaults.delay = 1.0
        Defaults.autoStartTweens = false
        Defaults.autoKillCompletedTweens = false
        Defaults.reset()

        XCTAssertEqual(Defaults.ease, .quadOut)
        XCTAssertEqual(Defaults.overshoot, 1.70158)
        XCTAssertEqual(Defaults.duration, 0.3)
        XCTAssertEqual(Defaults.delay, 0.0)
        XCTAssertTrue(Defaults.autoStartTweens)
        XCTAssertTrue(Defaults.autoKillCompletedTweens)
    }

}
