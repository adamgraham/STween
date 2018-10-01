//
//  TweenableTest.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenableTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    func testTweenToProperty() {
        let tweenA = UIView().tween(to: UIViewTweenProperty.x(100.0), duration: 1.0)
        XCTAssertFalse(tweenA.reversed)
        XCTAssertNil(tweenA.onComplete)
        XCTAssertEqual(Tweener.default.count, 1)

        let tweenB = UIView().tween(to: UIViewTweenProperty.y(100.0), duration: 1.0, completion: {})
        XCTAssertFalse(tweenB.reversed)
        XCTAssertNotNil(tweenB.onComplete)
        XCTAssertEqual(Tweener.default.count, 2)
    }

    func testTweenToProperties() {
        let tweenA = UIView().tween(to: [UIViewTweenProperty.x(100.0), UIViewTweenProperty.y(100.0)], duration: 1.0)
        XCTAssertFalse(tweenA.reversed)
        XCTAssertNil(tweenA.onComplete)
        XCTAssertEqual(Tweener.default.count, 1)

        let tweenB = UIView().tween(to: [UIViewTweenProperty.width(100.0), UIViewTweenProperty.height(100.0)], duration: 1.0, completion: {})
        XCTAssertFalse(tweenB.reversed)
        XCTAssertNotNil(tweenB.onComplete)
        XCTAssertEqual(Tweener.default.count, 2)
    }

    func testTweenFromProperty() {
        let tweenA = UIView().tween(from: UIViewTweenProperty.x(100.0), duration: 1.0)
        XCTAssertTrue(tweenA.reversed)
        XCTAssertNil(tweenA.onComplete)
        XCTAssertEqual(Tweener.default.count, 1)

        let tweenB = UIView().tween(from: UIViewTweenProperty.y(100.0), duration: 1.0, completion: {})
        XCTAssertTrue(tweenB.reversed)
        XCTAssertNotNil(tweenB.onComplete)
        XCTAssertEqual(Tweener.default.count, 2)
    }

    func testTweenFromProperties() {
        let tweenA = UIView().tween(from: [UIViewTweenProperty.x(100.0), UIViewTweenProperty.y(100.0)], duration: 1.0)
        XCTAssertTrue(tweenA.reversed)
        XCTAssertNil(tweenA.onComplete)
        XCTAssertEqual(Tweener.default.count, 1)

        let tweenB = UIView().tween(from: [UIViewTweenProperty.width(100.0), UIViewTweenProperty.height(100.0)], duration: 1.0, completion: {})
        XCTAssertTrue(tweenB.reversed)
        XCTAssertNotNil(tweenB.onComplete)
        XCTAssertEqual(Tweener.default.count, 2)
    }

}
