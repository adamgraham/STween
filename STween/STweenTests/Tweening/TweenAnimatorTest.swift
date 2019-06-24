//
//  TweenAnimatorTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenAnimatorTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    // MARK: Initialization Tests

    func testInit() {
        let target = UIView()
        let tween = TweenAnimator<UIViewTweenProperty>(target: target, properties: [], duration: 1.0)

        XCTAssertEqual(tween.target, target)
        XCTAssertEqual(tween.targetProperties.count, 0)
        XCTAssertEqual(tween.duration, 1.0)
    }

    // MARK: Tweening Tests

    func testTweening() {
        let target = UIView()
        let tween = TweenAnimator<UIViewTweenProperty>(target: target, properties: [.x(100.0), .y(100.0)], duration: 1.0)
        let tweeningExpectation = expectation(description: "tweening")

        tween.onUpdate = { _ in
            XCTAssertNotEqual(tween.elapsed, 0.0)
        }

        tween.onComplete = { _ in
            tweeningExpectation.fulfill()
        }

        tween.ease = .linear
        tween.start()

        XCTAssertEqual(tween.state, .active)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(Double(target.frame.origin.x), 0.0, accuracy: .ulpOfOne)
        XCTAssertEqual(Double(target.frame.origin.y), 0.0, accuracy: .ulpOfOne)

        waitForExpectations(timeout: 3.0) { error in
            XCTAssertEqual(tween.elapsed, tween.duration)
            XCTAssertEqual(Double(target.frame.origin.x), 100.0, accuracy: .ulpOfOne)
            XCTAssertEqual(Double(target.frame.origin.y), 100.0, accuracy: .ulpOfOne)
        }
    }

    func testTweeningReversed() {
        let target = UIView()
        let tween = TweenAnimator<UIViewTweenProperty>(target: target, properties: [.x(100.0), .y(100.0)], duration: 1.0)
        let tweeningExpectation = expectation(description: "tweening:reversed")

        tween.onUpdate = { _ in
            XCTAssertNotEqual(tween.elapsed, 0.0)
        }

        tween.onComplete = { _ in
            tweeningExpectation.fulfill()
        }

        tween.reversed = true
        tween.ease = .linear
        tween.start()

        XCTAssertEqual(tween.state, .active)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(Double(target.frame.origin.x), 100.0, accuracy: .ulpOfOne)
        XCTAssertEqual(Double(target.frame.origin.y), 100.0, accuracy: .ulpOfOne)

        waitForExpectations(timeout: 3.0) { error in
            XCTAssertEqual(tween.elapsed, tween.duration)
            XCTAssertEqual(Double(target.frame.origin.x), 0.0, accuracy: .ulpOfOne)
            XCTAssertEqual(Double(target.frame.origin.y), 0.0, accuracy: .ulpOfOne)
        }
    }

    func testTweeningDelayed() {
        let target = UIView()
        let tween = TweenAnimator<UIViewTweenProperty>(target: target, properties: [.x(100.0), .y(100.0)], duration: 1.0)
        let tweeningExpectation = expectation(description: "tweening:delayed")

        tween.onUpdate = { _ in
            XCTAssertNotEqual(tween.elapsed, 0.0)
        }

        tween.onComplete = { _ in
            tweeningExpectation.fulfill()
        }

        tween.delay = 1.0
        tween.ease = .linear
        tween.start()

        XCTAssertEqual(tween.state, .delayed)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(Double(target.frame.origin.x), 0.0, accuracy: .ulpOfOne)
        XCTAssertEqual(Double(target.frame.origin.y), 0.0, accuracy: .ulpOfOne)

        waitForExpectations(timeout: 3.0) { error in
            XCTAssertEqual(tween.elapsed, tween.duration)
            XCTAssertEqual(Double(target.frame.origin.x), 100.0, accuracy: .ulpOfOne)
            XCTAssertEqual(Double(target.frame.origin.y), 100.0, accuracy: .ulpOfOne)
        }
    }

    // MARK: State Control Tests

    func testStart() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onStart = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertFalse(tween.start())
        XCTAssertTrue(callbackInvoked)
    }

    func testStartWithDelay() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)
        tween.delay = 1.0

        var callbackInvoked = false
        tween.onStart = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertFalse(tween.start())
        XCTAssertFalse(callbackInvoked)
    }

    func testStop() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onStop = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.stop())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.stop())
        XCTAssertEqual(tween.state, .inactive)
        XCTAssertTrue(callbackInvoked)
    }

    func testRestart() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onRestart = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.stop())
        XCTAssertEqual(tween.state, .inactive)
        XCTAssertTrue(tween.restart())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.restart())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.kill())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(tween.restart())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertTrue(callbackInvoked)
    }

    func testPause() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onPause = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.pause())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.pause())
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(callbackInvoked)
    }

    func testResume() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onResume = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.resume())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.pause())
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(tween.resume())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

    func testResumeWithDelay() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)
        tween.delay = 1.0

        var callbackInvoked = false
        tween.onResume = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.resume())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertTrue(tween.pause())
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(tween.resume())
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertTrue(callbackInvoked)
    }

    func testCompleteWithAutoKillOn() {
        Defaults.autoKillCompletedTweens = true
        defer { Defaults.reset() }

        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [.x(100.0)], duration: 1.0)

        var callbackInvoked = false
        tween.onComplete = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.complete())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(tween.complete())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertEqual(tween.elapsed, tween.duration)
        XCTAssertEqual(tween.target.frame.origin.x, 100.0)
        XCTAssertTrue(callbackInvoked)
    }

    func testCompleteWithAutoKillOff() {
        Defaults.autoKillCompletedTweens = false
        defer { Defaults.reset() }

        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [.x(100.0)], duration: 1.0)

        var callbackInvoked = false
        tween.onComplete = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.complete())
        XCTAssertEqual(tween.state, .completed)
        XCTAssertFalse(tween.complete())
        XCTAssertEqual(tween.state, .completed)
        XCTAssertEqual(tween.elapsed, tween.duration)
        XCTAssertEqual(tween.target.frame.origin.x, 100.0)
        XCTAssertTrue(callbackInvoked)
    }

    func testKill() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onKill = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.kill())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(tween.kill())
        XCTAssertTrue(callbackInvoked)
    }

    func testRevive() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onRevive = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(Tweener.default.count, 0)
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertFalse(tween.revive())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.kill())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertTrue(tween.revive())
        XCTAssertEqual(tween.state, .new)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertTrue(callbackInvoked)
        XCTAssertEqual(Tweener.default.count, 1)
    }

    func testUpdate() {
        let tween = TweenAnimator<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.onUpdate = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.update())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.update())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

}
