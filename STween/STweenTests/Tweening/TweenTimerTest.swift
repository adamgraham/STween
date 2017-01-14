//
//  TweenTimerTest.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenTimerTest: XCTestCase {

    // MARK: Initialization Tests

    func testInit() {
        let timer = TweenTimer()
        XCTAssertNil(timer.delegate)
        XCTAssertEqual(timer.elapsed, 0.0)
        XCTAssertFalse(timer.running)
    }

    func testInitWithDelegate() {
        let delegate = TestDelegateClass()
        let timer = TweenTimer(delegate: delegate)
        XCTAssertTrue(timer.delegate === delegate)
        XCTAssertEqual(timer.elapsed, 0.0)
        XCTAssertFalse(timer.running)
    }

    // MARK: State Control Tests

    func testStart() {
        let timer = TweenTimer()
        XCTAssertFalse(timer.running)
        timer.start()
        XCTAssertTrue(timer.running)
    }

    func testStop() {
        let timer = TweenTimer()
        XCTAssertFalse(timer.running)
        timer.start()
        XCTAssertTrue(timer.running)
        timer.stop()
        XCTAssertFalse(timer.running)
    }

    func testReset() {
        let tickExpectation = expectation(description: "timer:reset:tick")
        let delegate = TestDelegateClass()
        delegate.callback = {
            tickExpectation.fulfill()
        }

        let timer = TweenTimer(delegate: delegate)
        XCTAssertFalse(timer.running)
        timer.start()
        XCTAssertTrue(timer.running)

        XCTAssertEqual(timer.elapsed, 0.0)
        waitForExpectations(timeout: 1.0)
        XCTAssertGreaterThan(timer.elapsed, 0.0)

        XCTAssertTrue(timer.running)
        timer.reset()
        XCTAssertTrue(timer.running)
        XCTAssertEqual(timer.elapsed, 0.0)
    }

    func testRestart() {
        let tickExpectation = expectation(description: "timer:restart:tick")
        let delegate = TestDelegateClass()
        delegate.callback = {
            tickExpectation.fulfill()
        }

        let timer = TweenTimer(delegate: delegate)
        XCTAssertFalse(timer.running)
        timer.start()
        XCTAssertTrue(timer.running)

        XCTAssertEqual(timer.elapsed, 0.0)
        waitForExpectations(timeout: 1.0)
        XCTAssertGreaterThan(timer.elapsed, 0.0)

        XCTAssertTrue(timer.running)
        timer.stop()
        XCTAssertFalse(timer.running)
        timer.restart()
        XCTAssertTrue(timer.running)
        XCTAssertEqual(timer.elapsed, 0.0)
    }

    // MARK: Timer Event Tests

    func testTick() {
        let tickExpectation = expectation(description: "timer:tick")
        let delegate = TestDelegateClass()
        delegate.callback = {
            tickExpectation.fulfill()
        }

        let timer = TweenTimer(delegate: delegate)
        timer.start()

        XCTAssertEqual(timer.elapsed, 0.0)
        waitForExpectations(timeout: 1.0)
        XCTAssertGreaterThan(timer.elapsed, 0.0)
    }

}

fileprivate class TestDelegateClass: TweenTimerDelegate {

    var callback: (() -> Void)?

    func tweenTimer(_ timer: TweenTimer, didUpdateWithElapsedTime elapsed: TimeInterval) {
        self.callback?()
    }

}
