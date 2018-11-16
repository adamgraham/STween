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
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    func testSetEase() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(ease: .backOut)
        XCTAssertEqual(tween.ease, .backOut)
    }

    func testSetDelay() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(delay: 1.0)
        XCTAssertEqual(tween.delay, 1.0)
    }

    func testSetDuration() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(duration: 2.0)
        XCTAssertEqual(tween.duration, 2.0)
    }

    func testSetReversed() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(reversed: true)
        XCTAssertTrue(tween.reversed)
    }

    func testSetOnUpdate() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onUpdate: { _ in })
        XCTAssertNotNil(tween.onUpdate)
    }

    func testSetOnStart() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onStart: { _ in })
        XCTAssertNotNil(tween.onStart)
    }

    func testSetOnStop() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onStop: { _ in })
        XCTAssertNotNil(tween.onStop)
    }

    func testSetOnRestart() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onRestart: { _ in })
        XCTAssertNotNil(tween.onRestart)
    }

    func testSetOnPause() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onPause: { _ in })
        XCTAssertNotNil(tween.onPause)
    }

    func testSetOnResume() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onResume: { _ in })
        XCTAssertNotNil(tween.onResume)
    }

    func testSetOnComplete() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onComplete: { _ in })
        XCTAssertNotNil(tween.onComplete)
    }

    func testSetOnKill() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onKill: { _ in })
        XCTAssertNotNil(tween.onKill)
    }

    func testSetOnReset() {
        let tween = Tweener.default.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
            .set(onReset: { _ in })
        XCTAssertNotNil(tween.onReset)
    }

}
