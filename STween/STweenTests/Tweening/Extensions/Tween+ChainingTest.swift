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
        let tween = Tweener.default.animate(UIView()).ease(.backOut)
        XCTAssertEqual(tween.ease, .backOut)
    }

    func testSetDelay() {
        let tween = Tweener.default.animate(UIView()).delay(1.0)
        XCTAssertEqual(tween.delay, 1.0)
    }

    func testSetDuration() {
        let tween = Tweener.default.animate(UIView()).duration(1.0)
        XCTAssertEqual(tween.duration, 1.0)
    }

    func testSetOnUpdate() {
        let tween = Tweener.default.animate(UIView()).onUpdate({ _ in })
        XCTAssertNotNil(tween.onUpdate)
    }

    func testSetOnStart() {
        let tween = Tweener.default.animate(UIView()).onStart({ _ in })
        XCTAssertNotNil(tween.onStart)
    }

    func testSetOnStop() {
        let tween = Tweener.default.animate(UIView()).onStop({ _ in })
        XCTAssertNotNil(tween.onStop)
    }

    func testSetOnRestart() {
        let tween = Tweener.default.animate(UIView()).onRestart({ _ in })
        XCTAssertNotNil(tween.onRestart)
    }

    func testSetOnPause() {
        let tween = Tweener.default.animate(UIView()).onPause({ _ in })
        XCTAssertNotNil(tween.onPause)
    }

    func testSetOnResume() {
        let tween = Tweener.default.animate(UIView()).onResume({ _ in })
        XCTAssertNotNil(tween.onResume)
    }

    func testSetOnComplete() {
        let tween = Tweener.default.animate(UIView()).onComplete({ _ in })
        XCTAssertNotNil(tween.onComplete)
    }

    func testSetOnKill() {
        let tween = Tweener.default.animate(UIView()).onKill({ _ in })
        XCTAssertNotNil(tween.onKill)
    }

    func testSetOnRevive() {
        let tween = Tweener.default.animate(UIView()).onRevive({ _ in })
        XCTAssertNotNil(tween.onRevive)
    }

}
