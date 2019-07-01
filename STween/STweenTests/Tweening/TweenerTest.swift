//
//  TweenerTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenerTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    // MARK: Instance

    func testSharedInstance() {
        let tweener = Tweener.shared
        XCTAssertEqual(tweener.identifier, "shared")
        XCTAssertTrue(tweener === Tweener.default)
        XCTAssertTrue(tweener !== Tweener.manual)
        XCTAssertTrue(tweener === Tweener.custom("shared"))
        XCTAssertTrue(tweener === Tweener.custom("default"))
    }

    func testCustomInstance() {
        defer { Tweener.shared.setAsDefault() }

        let customTweener = Tweener.custom("test")
        XCTAssertEqual(customTweener.identifier, "test")
        XCTAssertTrue(customTweener !== Tweener.shared)
        XCTAssertTrue(customTweener !== Tweener.default)
        XCTAssertTrue(customTweener !== Tweener.manual)
        XCTAssertTrue(customTweener === Tweener.custom("test"))

        customTweener.setAsDefault()
        XCTAssertTrue(customTweener === Tweener.default)
        XCTAssertTrue(customTweener === Tweener.custom("default"))
    }

    func testManualInstance() {
        let tweener = Tweener.manual
        XCTAssertEqual(tweener.identifier, "manual")
        XCTAssertTrue(tweener !== Tweener.shared)
        XCTAssertTrue(tweener !== Tweener.default)
        XCTAssertTrue(tweener === Tweener.custom("manual"))
    }

    // MARK: Factory Creation

    func testAnimateWithoutAutoStart() {
        Defaults.autoStartTweens = false
        defer { Defaults.reset() }

        let tween = Tweener.default.animate(UIView())
        XCTAssertTrue(tween.tweener === Tweener.default)
        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(Tweener.default.queuedCount, 0)
    }

    func testAnimateWithAutoStart() {
        Defaults.autoStartTweens = true
        defer { Defaults.reset() }

        let tween = Tweener.default.animate(UIView())
        XCTAssertTrue(tween.tweener === Tweener.default)
        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(Tweener.default.queuedCount, 1)
    }

    // MARK: Timers

    func testQueueTimer() {
        Defaults.autoStartTweens = true
        defer { Defaults.reset() }

        let tween = Tweener.default.animate(UIView())
        let expectation = self.expectation(description: "queue")
        tween.onStart { _ in expectation.fulfill() }
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testUpdateTimer() {
        Defaults.autoStartTweens = true
        defer { Defaults.reset() }

        let tween = Tweener.default.animate(UIView())
        let expectation = self.expectation(description: "update")
        tween.onUpdate { _ in expectation.fulfill() }
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testManualTimer() {
        Defaults.autoStartTweens = true
        defer {
            Defaults.reset()
            Tweener.manual.killAll()
        }

        let tween = Tweener.manual.animate(UIView())
        var started = false
        tween.onStart = { _ in started = true }
        var updated = false
        tween.onUpdate = { _ in updated = true }

        sleep(1)
        XCTAssertFalse(started)
        XCTAssertFalse(updated)

        Tweener.manual.startAll()
        XCTAssertTrue(started)
        Tweener.manual.updateAll(by: .ulpOfOne)
        XCTAssertTrue(updated)
    }

    // MARK: Tracking

    func testTrack() {
        let tweener = Tweener.default
        XCTAssertEqual(tweener.count, 0)

        let tween = TweenAnimator(targets: UIView())
        tween.tweener = tweener

        let anotherTween = TweenAnimator(targets: UIView())
        anotherTween.tweener = tweener

        tweener.track(tween)
        XCTAssertTrue(tweener.isTracking(tween))
        XCTAssertEqual(tweener.count, 1)

        tweener.track(anotherTween)
        XCTAssertTrue(tweener.isTracking(anotherTween))
        XCTAssertEqual(tweener.count, 2)

        // test that the same tween cannot be tracked if already tracked
        tweener.track(tween)
        XCTAssertEqual(tweener.count, 2)
    }

    func testUntrack() {
        let tweener = Tweener.default
        XCTAssertEqual(tweener.count, 0)

        let tween = TweenAnimator(targets: UIView())
        tween.tweener = tweener

        let anotherTween = TweenAnimator(targets: UIView())
        anotherTween.tweener = tweener

        tweener.track(tween)
        tweener.track(anotherTween)
        XCTAssertEqual(tweener.count, 2)

        tweener.untrack(tween)
        XCTAssertFalse(tweener.isTracking(tween))
        XCTAssertEqual(tweener.count, 1)

        tweener.untrack(anotherTween)
        XCTAssertFalse(tweener.isTracking(anotherTween))
        XCTAssertEqual(tweener.count, 0)

        // test that the same tween cannot be untracked if not currently tracked
        tweener.untrack(tween)
        XCTAssertEqual(tweener.count, 0)
    }

    func testUntrackWhileQueued() {
        let tweener = Tweener.default
        XCTAssertEqual(tweener.count, 0)
        XCTAssertEqual(tweener.queuedCount, 0)

        let tween = TweenAnimator(targets: UIView())
        tween.tweener = tweener

        let anotherTween = TweenAnimator(targets: UIView())
        anotherTween.tweener = tweener

        tweener.track(tween)
        tweener.queue(tween)
        tweener.track(anotherTween)
        tweener.queue(anotherTween)
        XCTAssertEqual(tweener.count, 2)
        XCTAssertEqual(tweener.queuedCount, 2)

        tweener.untrack(tween)
        XCTAssertFalse(tweener.isTracking(tween))
        XCTAssertEqual(tweener.count, 1)
        XCTAssertEqual(tweener.queuedCount, 1)

        tweener.untrack(anotherTween)
        XCTAssertFalse(tweener.isTracking(anotherTween))
        XCTAssertEqual(tweener.count, 0)
        XCTAssertEqual(tweener.queuedCount, 0)
    }

    // MARK: Queueing

    func testQueue() {
        let tweener = Tweener.default
        XCTAssertEqual(tweener.queuedCount, 0)

        let tween = TweenAnimator(targets: UIView())
        tween.tweener = tweener

        let anotherTween = TweenAnimator(targets: UIView())
        anotherTween.tweener = tweener

        tweener.track(tween)
        tweener.queue(tween)
        XCTAssertEqual(tweener.queuedCount, 1)

        tweener.track(anotherTween)
        tweener.queue(anotherTween)
        XCTAssertEqual(tweener.queuedCount, 2)

        // test that the same tween cannot be queued multiple times
        tweener.queue(tween)
        XCTAssertEqual(tweener.queuedCount, 2)
    }

    func testStartQueued() {
        let tweener = Tweener.default
        XCTAssertEqual(tweener.queuedCount, 0)

        let tween = TweenAnimator(targets: UIView())
        tween.tweener = tweener

        let anotherTween = TweenAnimator(targets: UIView())
        anotherTween.tweener = tweener

        tweener.track(tween)
        tweener.queue(tween)
        tweener.track(anotherTween)
        tweener.queue(anotherTween)
        XCTAssertEqual(tween.state, .new)
        XCTAssertEqual(anotherTween.state, .new)
        XCTAssertEqual(tweener.queuedCount, 2)

        tweener.startQueuedTweens()
        XCTAssertEqual(tween.state, .active)
        XCTAssertEqual(anotherTween.state, .active)
        XCTAssertEqual(tweener.queuedCount, 0)
    }

    // MARK: Global State Control

    func testUpdateAll() {
        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onUpdate = { _ in
                count += 1
            }
            tween.start()
        }

        tweener.updateAll(by: 0.0)
        XCTAssertEqual(count, expectedCount)
    }

    func testStartAll() {
        Defaults.autoStartTweens = false
        defer { Defaults.reset() }

        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onStart = { _ in
                count += 1
            }
        }

        tweener.startAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testStopAll() {
        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onStop = { _ in
                count += 1
            }
            tween.start()
        }

        tweener.stopAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testRestartAll() {
        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onRestart = { _ in
                count += 1
            }
            tween.start()
        }

        tweener.restartAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testPauseAll() {
        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onPause = { _ in
                count += 1
            }
            tween.start()
        }

        tweener.pauseAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testResumeAll() {
        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onResume = { _ in
                count += 1
            }
            tween.start()
            tween.pause()
        }

        tweener.resumeAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testCompleteAll() {
        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onComplete = { _ in
                count += 1
            }
        }

        tweener.completeAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testKillAll() {
        let tweener = Tweener.default
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = tweener.animate(UIView())
            tween.onKill = { _ in
                count += 1
            }
        }

        tweener.killAll()
        XCTAssertEqual(count, expectedCount)
    }

}
