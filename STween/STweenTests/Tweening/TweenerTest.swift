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
        Defaults.reset()
    }

    override func tearDown() {
        Tweener.default.killAll()
        Defaults.reset()
        super.tearDown()
    }

    // MARK: Factory Creation Tests

    func testAnimateToWithoutCallback() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNil(tween.onComplete)
    }

    func testAnimateToWithCallback() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
    }

    func testAnimateToWithoutAutoStart() {
        Defaults.autoStartTweens = false
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.default.queuedCount, 0)
    }

    func testAnimateToWithAutoStart() {
        Defaults.autoStartTweens = true
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.default.queuedCount, 1)
    }

    func testAnimateFromWithoutCallback() {
        let tween = Tweener.default.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNil(tween.onComplete)
    }

    func testAnimateFromWithCallback() {
        let tween = Tweener.default.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
    }

    func testAnimateFromWithoutAutoStart() {
        Defaults.autoStartTweens = false
        let tween = Tweener.default.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.default.queuedCount, 0)
    }

    func testAnimateFromWithAutoStart() {
        Defaults.autoStartTweens = true
        let tween = Tweener.default.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.default.queuedCount, 1)
    }

    // MARK: Tracking Tests

    func testTracking() {
        XCTAssertEqual(Tweener.default.count, 0)

        let tween = TweenAnimation<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)
        let anotherTween = TweenAnimation<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        // Add

        Tweener.default.add(tween)
        XCTAssertTrue(Tweener.default.contains(tween))
        XCTAssertEqual(Tweener.default.count, 1)

        Tweener.default.add(anotherTween)
        XCTAssertTrue(Tweener.default.contains(anotherTween))
        XCTAssertEqual(Tweener.default.count, 2)

        Tweener.default.add(anotherTween) // test same tween cannot be added multiple times
        XCTAssertEqual(Tweener.default.count, 2)

        // Remove

        Tweener.default.remove(tween)
        XCTAssertFalse(Tweener.default.contains(tween))
        XCTAssertEqual(Tweener.default.count, 1)

        Tweener.default.remove(anotherTween)
        XCTAssertFalse(Tweener.default.contains(anotherTween))
        XCTAssertEqual(Tweener.default.count, 0)

        Tweener.default.remove(anotherTween) // test same tween cannot be removed multiple times
        XCTAssertEqual(Tweener.default.count, 0)
    }

    // MARK: Queueing

    func testQueueing() {
        XCTAssertEqual(Tweener.default.queuedCount, 0)

        let tween = TweenAnimation(target: UIView(), properties: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)

        let anotherTween = TweenAnimation<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)
        XCTAssertEqual(anotherTween.state, .new)

        // Queue

        Tweener.default.queue(tween)
        XCTAssertEqual(Tweener.default.queuedCount, 1)

        Tweener.default.queue(anotherTween)
        XCTAssertEqual(Tweener.default.queuedCount, 2)
    
        Tweener.default.queue(anotherTween) // test same tween cannot be queued multiple times
        XCTAssertEqual(Tweener.default.queuedCount, 2)

        // Start

        Tweener.default.startQueuedTweens()
        XCTAssertEqual(tween.state, .active)
        XCTAssertEqual(anotherTween.state, .active)
        XCTAssertEqual(Tweener.default.queuedCount, 0)
    }

    // MARK: Global State Control Tests

    func testStartAll() {
        Defaults.autoStartTweens = false
        defer { Defaults.reset() }

        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
            tween.onStart = { _ in
                count += 1
            }
        }

        Tweener.default.startAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testStopAll() {
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
            tween.onStop = { _ in
                count += 1
            }
            tween.start()
        }

        Tweener.default.stopAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testRestartAll() {
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
            tween.onRestart = { _ in
                count += 1
            }
            tween.start()
        }

        Tweener.default.restartAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testPauseAll() {
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
            tween.onPause = { _ in
                count += 1
            }
            tween.start()
        }

        Tweener.default.pauseAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testResumeAll() {
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
            tween.onResume = { _ in
                count += 1
            }
            tween.start()
            tween.pause()
        }

        Tweener.default.resumeAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testCompleteAll() {
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
            tween.onComplete = { _ in
                count += 1
            }
        }

        Tweener.default.completeAll()
        XCTAssertEqual(count, expectedCount)
    }

    func testKillAll() {
        var count = 0
        let expectedCount = 3

        for _ in 1...expectedCount {
            let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: { _ in })
            tween.onKill = { _ in
                count += 1
            }
        }

        Tweener.default.killAll()
        XCTAssertEqual(count, expectedCount)
    }

}
