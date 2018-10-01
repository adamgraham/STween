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
        Tweener.killAll()
    }

    override func tearDown() {
        Tweener.killAll()
        Defaults.reset()
        super.tearDown()
    }

    // MARK: Factory Creation Tests

    func testAnimateToWithoutCallback() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNil(tween.onComplete)
    }

    func testAnimateToWithCallback() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: {})
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
    }

    func testAnimateToWithoutAutoStart() {
        Defaults.autoStartTweens = false
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: {})
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.queuedCount, 0)
    }

    func testAnimateToWithAutoStart() {
        Defaults.autoStartTweens = true
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: {})
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.queuedCount, 1)
    }

    func testAnimateFromWithoutCallback() {
        let tween = Tweener.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNil(tween.onComplete)
    }

    func testAnimateFromWithCallback() {
        let tween = Tweener.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0, completion: {})
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
    }

    func testAnimateFromWithoutAutoStart() {
        Defaults.autoStartTweens = false
        let tween = Tweener.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0, completion: {})
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.queuedCount, 0)
    }

    func testAnimateFromWithAutoStart() {
        Defaults.autoStartTweens = true
        let tween = Tweener.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0, completion: {})
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.reversed)
        XCTAssertEqual(tween.duration, 1.0)
        XCTAssertNotNil(tween.onComplete)
        XCTAssertEqual(Tweener.queuedCount, 1)
    }

    // MARK: Tracking Tests

    func testTracking() {
        XCTAssertEqual(Tweener.count, 0)

        let tween = TweenAnimation<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)
        let anotherTween = TweenAnimation<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)

        // Add

        Tweener.add(tween)
        XCTAssertTrue(Tweener.contains(tween))
        XCTAssertEqual(Tweener.count, 1)

        Tweener.add(anotherTween)
        XCTAssertTrue(Tweener.contains(anotherTween))
        XCTAssertEqual(Tweener.count, 2)

        Tweener.add(anotherTween) // test same tween cannot be added multiple times
        XCTAssertEqual(Tweener.count, 2)

        // Remove

        Tweener.remove(tween)
        XCTAssertFalse(Tweener.contains(tween))
        XCTAssertEqual(Tweener.count, 1)

        Tweener.remove(anotherTween)
        XCTAssertFalse(Tweener.contains(anotherTween))
        XCTAssertEqual(Tweener.count, 0)

        Tweener.remove(anotherTween) // test same tween cannot be removed multiple times
        XCTAssertEqual(Tweener.count, 0)
    }

    // MARK: Queueing

    func testQueueing() {
        XCTAssertEqual(Tweener.queuedCount, 0)

        let tween = TweenAnimation(target: UIView(), properties: [UIViewTweenProperty](), duration: 1.0)
        XCTAssertEqual(tween.state, .new)

        let anotherTween = TweenAnimation<UIViewTweenProperty>(target: UIView(), properties: [], duration: 1.0)
        XCTAssertEqual(anotherTween.state, .new)

        // Queue

        Tweener.queue(tween)
        XCTAssertEqual(Tweener.queuedCount, 1)

        Tweener.queue(anotherTween)
        XCTAssertEqual(Tweener.queuedCount, 2)
    
        Tweener.queue(anotherTween) // test same tween cannot be queued multiple times
        XCTAssertEqual(Tweener.queuedCount, 2)

        // Start

        Tweener.startQueuedTweens()
        XCTAssertEqual(tween.state, .active)
        XCTAssertEqual(anotherTween.state, .active)
        XCTAssertEqual(Tweener.queuedCount, 0)
    }

    // MARK: Global State Control Tests

    func testKillAll() {
        let tween = Tweener.animate(UIView(), to: [UIViewTweenProperty](), duration: 1.0, completion: {})
        let anotherTween = Tweener.animate(UIView(), from: [UIViewTweenProperty](), duration: 1.0, completion: {})

        Tweener.killAll()

        XCTAssertEqual(tween.state, .killed)
        XCTAssertEqual(anotherTween.state, .killed)
    }

}
