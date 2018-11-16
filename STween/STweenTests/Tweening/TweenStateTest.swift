//
//  TweenStateTest.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenStateTest: XCTestCase {

    func testNew() {
        XCTAssertTrue(TweenState.new.canStart)
        XCTAssertFalse(TweenState.new.canStop)
        XCTAssertFalse(TweenState.new.canRestart)
        XCTAssertFalse(TweenState.new.canPause)
        XCTAssertFalse(TweenState.new.canResume)
        XCTAssertTrue(TweenState.new.canComplete)
        XCTAssertTrue(TweenState.new.canKill)
        XCTAssertFalse(TweenState.new.canReset)
        XCTAssertFalse(TweenState.new.canUpdate)
    }

    func testInactive() {
        XCTAssertTrue(TweenState.inactive.canStart)
        XCTAssertFalse(TweenState.inactive.canStop)
        XCTAssertTrue(TweenState.inactive.canRestart)
        XCTAssertFalse(TweenState.inactive.canPause)
        XCTAssertFalse(TweenState.inactive.canResume)
        XCTAssertTrue(TweenState.inactive.canComplete)
        XCTAssertTrue(TweenState.inactive.canKill)
        XCTAssertTrue(TweenState.inactive.canReset)
        XCTAssertFalse(TweenState.inactive.canUpdate)
    }

    func testActive() {
        XCTAssertFalse(TweenState.active.canStart)
        XCTAssertTrue(TweenState.active.canStop)
        XCTAssertTrue(TweenState.active.canRestart)
        XCTAssertTrue(TweenState.active.canPause)
        XCTAssertFalse(TweenState.active.canResume)
        XCTAssertTrue(TweenState.active.canComplete)
        XCTAssertTrue(TweenState.active.canKill)
        XCTAssertTrue(TweenState.active.canReset)
        XCTAssertTrue(TweenState.active.canUpdate)
    }

    func testPaused() {
        XCTAssertFalse(TweenState.paused.canStart)
        XCTAssertTrue(TweenState.paused.canStop)
        XCTAssertTrue(TweenState.paused.canRestart)
        XCTAssertFalse(TweenState.paused.canPause)
        XCTAssertTrue(TweenState.paused.canResume)
        XCTAssertTrue(TweenState.paused.canComplete)
        XCTAssertTrue(TweenState.paused.canKill)
        XCTAssertTrue(TweenState.paused.canReset)
        XCTAssertFalse(TweenState.paused.canUpdate)
    }

    func testCompleted() {
        XCTAssertFalse(TweenState.completed.canStart)
        XCTAssertFalse(TweenState.completed.canStop)
        XCTAssertTrue(TweenState.completed.canRestart)
        XCTAssertFalse(TweenState.completed.canPause)
        XCTAssertFalse(TweenState.completed.canResume)
        XCTAssertFalse(TweenState.completed.canComplete)
        XCTAssertTrue(TweenState.completed.canKill)
        XCTAssertTrue(TweenState.completed.canReset)
        XCTAssertFalse(TweenState.completed.canUpdate)
    }

    func testKilled() {
        XCTAssertFalse(TweenState.killed.canStart)
        XCTAssertFalse(TweenState.killed.canStop)
        XCTAssertFalse(TweenState.killed.canRestart)
        XCTAssertFalse(TweenState.killed.canPause)
        XCTAssertFalse(TweenState.killed.canResume)
        XCTAssertFalse(TweenState.killed.canComplete)
        XCTAssertFalse(TweenState.killed.canKill)
        XCTAssertTrue(TweenState.killed.canReset)
        XCTAssertFalse(TweenState.killed.canUpdate)
    }

}
