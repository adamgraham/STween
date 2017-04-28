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
        Tweener.invokeStateChangeOnAllTweens(.kill)
    }

    override func tearDown() {
        Tweener.invokeStateChangeOnAllTweens(.kill)
        super.tearDown()
    }

    func testEase() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.ease, Defaults.ease)
        tween.ease = .backOut
        XCTAssertEqual(tween.ease, .backOut)
    }

    func testReversed() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertFalse(tween.reversed)
        tween.reversed = true
        XCTAssertTrue(tween.reversed)
    }

    func testState() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)
        tween.invoke(.kill)
        XCTAssertEqual(tween.state, .killed)
    }

    func testDelay() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.delay, 0.0)
        tween.delay = 1.0
        XCTAssertEqual(tween.delay, 1.0)
    }

    func testDuration() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.duration, 1.0)
        tween.duration = 2.0
        XCTAssertEqual(tween.duration, 2.0)
    }

    func testElapsed() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.elapsed, 0.0)
        tween.invoke(.start)
        tween.invoke(.complete)
        XCTAssertEqual(tween.elapsed, tween.duration)
    }

    func testPercentComplete() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.percentComplete, 0.0)
        tween.invoke(.start)
        tween.invoke(.complete)
        XCTAssertEqual(tween.percentComplete, 1.0)
    }

}
