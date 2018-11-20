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
        XCTAssertFalse(TweenState.new.canUpdate)
        XCTAssertTrue(TweenState.new.canStart)
        XCTAssertFalse(TweenState.new.canStop)
        XCTAssertTrue(TweenState.new.canRestart)
        XCTAssertFalse(TweenState.new.canPause)
        XCTAssertFalse(TweenState.new.canResume)
        XCTAssertTrue(TweenState.new.canComplete)
        XCTAssertTrue(TweenState.new.canKill)
        XCTAssertFalse(TweenState.new.canRevive)
    }

    func testInactive() {
        XCTAssertFalse(TweenState.inactive.canUpdate)
        XCTAssertTrue(TweenState.inactive.canStart)
        XCTAssertFalse(TweenState.inactive.canStop)
        XCTAssertTrue(TweenState.inactive.canRestart)
        XCTAssertFalse(TweenState.inactive.canPause)
        XCTAssertFalse(TweenState.inactive.canResume)
        XCTAssertTrue(TweenState.inactive.canComplete)
        XCTAssertTrue(TweenState.inactive.canKill)
        XCTAssertFalse(TweenState.inactive.canRevive)
    }

    func testActive() {
        XCTAssertTrue(TweenState.active.canUpdate)
        XCTAssertFalse(TweenState.active.canStart)
        XCTAssertTrue(TweenState.active.canStop)
        XCTAssertTrue(TweenState.active.canRestart)
        XCTAssertTrue(TweenState.active.canPause)
        XCTAssertFalse(TweenState.active.canResume)
        XCTAssertTrue(TweenState.active.canComplete)
        XCTAssertTrue(TweenState.active.canKill)
        XCTAssertFalse(TweenState.active.canRevive)
    }

    func testPaused() {
        XCTAssertFalse(TweenState.paused.canUpdate)
        XCTAssertFalse(TweenState.paused.canStart)
        XCTAssertTrue(TweenState.paused.canStop)
        XCTAssertTrue(TweenState.paused.canRestart)
        XCTAssertFalse(TweenState.paused.canPause)
        XCTAssertTrue(TweenState.paused.canResume)
        XCTAssertTrue(TweenState.paused.canComplete)
        XCTAssertTrue(TweenState.paused.canKill)
        XCTAssertFalse(TweenState.paused.canRevive)
    }

    func testCompleted() {
        XCTAssertFalse(TweenState.completed.canUpdate)
        XCTAssertFalse(TweenState.completed.canStart)
        XCTAssertFalse(TweenState.completed.canStop)
        XCTAssertTrue(TweenState.completed.canRestart)
        XCTAssertFalse(TweenState.completed.canPause)
        XCTAssertFalse(TweenState.completed.canResume)
        XCTAssertFalse(TweenState.completed.canComplete)
        XCTAssertTrue(TweenState.completed.canKill)
        XCTAssertFalse(TweenState.completed.canRevive)
    }

    func testKilled() {
        XCTAssertFalse(TweenState.killed.canUpdate)
        XCTAssertFalse(TweenState.killed.canStart)
        XCTAssertFalse(TweenState.killed.canStop)
        XCTAssertFalse(TweenState.killed.canRestart)
        XCTAssertFalse(TweenState.killed.canPause)
        XCTAssertFalse(TweenState.killed.canResume)
        XCTAssertFalse(TweenState.killed.canComplete)
        XCTAssertFalse(TweenState.killed.canKill)
        XCTAssertTrue(TweenState.killed.canRevive)
    }

}
