//
//  Tween+ChainingTest.swift
//  STween
//
//  Created by Adam Graham on 6/20/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class Tween_ChainingTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.killAll()
    }

    override func tearDown() {
        Tweener.killAll()
        super.tearDown()
    }

    func testSetEase() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(ease: .backOut)
        XCTAssertEqual(tween.ease, .backOut)
    }

    func testSetDelay() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(delay: 1.0)
        XCTAssertEqual(tween.delay, 1.0)
    }

    func testSetDuration() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(duration: 2.0)
        XCTAssertEqual(tween.duration, 2.0)
    }

    func testSetReversed() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(reversed: true)
        XCTAssertTrue(tween.reversed)
    }

    func testSetOnUpdate() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onUpdate: {})
        XCTAssertNotNil(tween.onUpdate)
    }

    func testSetOnStart() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onStart: {})
        XCTAssertNotNil(tween.onStart)
    }

    func testSetOnStop() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onStop: {})
        XCTAssertNotNil(tween.onStop)
    }

    func testSetOnRestart() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onRestart: {})
        XCTAssertNotNil(tween.onRestart)
    }

    func testSetOnPause() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onPause: {})
        XCTAssertNotNil(tween.onPause)
    }

    func testSetOnResume() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onResume: {})
        XCTAssertNotNil(tween.onResume)
    }

    func testSetOnComplete() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onComplete: {})
        XCTAssertNotNil(tween.onComplete)
    }

    func testSetOnKill() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onKill: {})
        XCTAssertNotNil(tween.onKill)
    }

    func testSetOnReset() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onReset: {})
        XCTAssertNotNil(tween.onReset)
    }

}
