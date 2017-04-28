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
        Tweener.invokeStateChangeOnAllTweens(.kill)
    }

    override func tearDown() {
        Tweener.invokeStateChangeOnAllTweens(.kill)
        super.tearDown()
    }

    func testTweenToProperty() {
        let xTween = UIView().tween(to: UIViewTweenProperty.x(100.0), duration: 1.0)
        XCTAssertFalse(xTween.reversed)
        XCTAssertNil(xTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 1)

        let yTween = UIView().tween(to: UIViewTweenProperty.y(100.0), duration: 1.0, completion: {})
        XCTAssertFalse(yTween.reversed)
        XCTAssertNotNil(yTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 2)
    }

    func testTweenToProperties() {
        let positionTween = UIView().tween(to: [UIViewTweenProperty.x(100.0), UIViewTweenProperty.y(100.0)], duration: 1.0)
        XCTAssertFalse(positionTween.reversed)
        XCTAssertNil(positionTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 1)

        let sizeTween = UIView().tween(to: [UIViewTweenProperty.width(100.0), UIViewTweenProperty.height(100.0)], duration: 1.0, completion: {})
        XCTAssertFalse(sizeTween.reversed)
        XCTAssertNotNil(sizeTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 2)
    }

    func testTweenFromProperty() {
        let xTween = UIView().tween(from: UIViewTweenProperty.x(100.0), duration: 1.0)
        XCTAssertTrue(xTween.reversed)
        XCTAssertNil(xTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 1)

        let yTween = UIView().tween(from: UIViewTweenProperty.y(100.0), duration: 1.0, completion: {})
        XCTAssertTrue(yTween.reversed)
        XCTAssertNotNil(yTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 2)
    }

    func testTweenFromProperties() {
        let positionTween = UIView().tween(from: [UIViewTweenProperty.x(100.0), UIViewTweenProperty.y(100.0)], duration: 1.0)
        XCTAssertTrue(positionTween.reversed)
        XCTAssertNil(positionTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 1)

        let sizeTween = UIView().tween(from: [UIViewTweenProperty.width(100.0), UIViewTweenProperty.height(100.0)], duration: 1.0, completion: {})
        XCTAssertTrue(sizeTween.reversed)
        XCTAssertNotNil(sizeTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 2)
    }

}
