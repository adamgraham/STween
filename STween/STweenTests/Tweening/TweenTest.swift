//
//  TweenTest.swift
//  STween
//
//  Created by Adam Graham on 8/27/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenTest: XCTestCase {

    private class TestTween: Tween {

        var ease: Ease = Defaults.ease
        var reversed: Bool = Defaults.reversed
        var state: TweenState = .new
        var delay: TimeInterval = Defaults.delay
        var duration: TimeInterval = 2.0
        var elapsed: TimeInterval = 0.0

        var onUpdate: Callback?
        var onStart: Callback?
        var onStop: Callback?
        var onRestart: Callback?
        var onPause: Callback?
        var onResume: Callback?
        var onComplete: Callback?
        var onKill: Callback?
        var onRevive: Callback?

        func start() -> Bool { return false }
        func stop() -> Bool { return false }
        func restart() -> Bool { return false }
        func pause() -> Bool { return false }
        func resume() -> Bool { return false }
        func complete() -> Bool { return false }
        func kill() -> Bool { return false }
        func revive() -> Bool { return false }

    }

    func testPercentComplete() {
        let tween = TestTween()
        tween.duration = 4.0

        tween.elapsed = -1.0
        XCTAssertEqual(tween.percentComplete, 0.0)
        tween.elapsed = 0.0
        XCTAssertEqual(tween.percentComplete, 0.0)
        tween.elapsed = 1.0
        XCTAssertEqual(tween.percentComplete, 0.25)
        tween.elapsed = 2.0
        XCTAssertEqual(tween.percentComplete, 0.5)
        tween.elapsed = 3.0
        XCTAssertEqual(tween.percentComplete, 0.75)
        tween.elapsed = 4.0
        XCTAssertEqual(tween.percentComplete, 1.0)
        tween.elapsed = 5.0
        XCTAssertEqual(tween.percentComplete, 1.0)
    }

}
