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

    override func setUp() {
        super.setUp()
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    func testEase() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.ease, Defaults.ease)
        tween.ease = .backOut
        XCTAssertEqual(tween.ease, .backOut)
    }

    func testReversed() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertFalse(tween.reversed)
        tween.reversed = true
        XCTAssertTrue(tween.reversed)
    }

    func testState() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)
        tween.kill()
        XCTAssertEqual(tween.state, .killed)
    }

    func testDelay() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.delay, Defaults.delay)
        tween.delay = 1.0
        XCTAssertEqual(tween.delay, 1.0)
    }

    func testDuration() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.duration, 1.0)
        tween.duration = 2.0
        XCTAssertEqual(tween.duration, 2.0)
    }

    func testElapsed() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.elapsed, 0.0)
        tween.start()
        tween.complete()
        XCTAssertEqual(tween.elapsed, tween.duration)
    }

    func testPercentComplete() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.percentComplete, 0.0)
        tween.start()
        tween.complete()
        XCTAssertEqual(tween.percentComplete, 1.0)
    }

}
