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
        Tweener.invokeStateChangeOnAllTweens(.kill)
    }

    override func tearDown() {
        Tweener.invokeStateChangeOnAllTweens(.kill)
        super.tearDown()
    }

    func testSetEase() {
        let tween = Tweener.to([], on: UIView(), duration: 1.0, completion: {})
            .set(ease: .backOut)
        XCTAssertEqual(tween.ease, .backOut)
    }

    func testSetDelay() {
        let tween = Tweener.to([], on: UIView(), duration: 1.0, completion: {})
            .set(delay: 1.0)
        XCTAssertEqual(tween.delay, 1.0)
    }

    func testSetDuration() {
        let tween = Tweener.to([], on: UIView(), duration: 1.0, completion: {})
            .set(duration: 2.0)
        XCTAssertEqual(tween.duration, 2.0)
    }

    func testSetReversed() {
        let tween = Tweener.to([], on: UIView(), duration: 1.0, completion: {})
            .set(reversed: true)
        XCTAssertTrue(tween.reversed)
    }

    func testSetCallback() {
        var invoked = false

        let callback = {
            invoked = true
        }

        let tween = Tweener.to([], on: UIView(), duration: 1.0, completion: {})
            .set(callback: callback, for: .kill)

        tween.invoke(.kill)
        XCTAssertTrue(invoked)
    }

}
