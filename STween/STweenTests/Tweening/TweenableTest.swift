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

    func testTweenProperty() {
        let xTween = UIView().tween(.x(100.0), duration: 1.0)
        XCTAssertFalse(xTween.reversed)
        XCTAssertNil(xTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 1)

        let yTween = UIView().tween(.y(100.0), duration: 1.0, completion: {})
        XCTAssertFalse(yTween.reversed)
        XCTAssertNotNil(yTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 2)
    }

    func testTweenProperties() {
        let positionTween = UIView().tween([.x(100.0), .y(100.0)], duration: 1.0)
        XCTAssertFalse(positionTween.reversed)
        XCTAssertNil(positionTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 1)

        let sizeTween = UIView().tween([.width(100.0), .height(100.0)], duration: 1.0, completion: {})
        XCTAssertFalse(sizeTween.reversed)
        XCTAssertNotNil(sizeTween.callback(get: .complete))
        XCTAssertEqual(Tweener.count, 2)
    }

}
