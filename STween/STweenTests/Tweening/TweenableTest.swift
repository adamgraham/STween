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

    func testTweenTo() {
        let view = UIView()
        let tween = view.tween(to: .x(100.0), .y(100.0))

        guard let animator = tween as? TweenAnimator<UIView> else {
            XCTFail()
            return
        }

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [view])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertFalse(animator.tweens[0].reversed)
        XCTAssertFalse(animator.tweens[1].reversed)
    }

    func testTweenFrom() {
        let view = UIView()
        let tween = view.tween(from: .x(100.0), .y(100.0))

        guard let animator = tween as? TweenAnimator<UIView> else {
            XCTFail()
            return
        }

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [view])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertTrue(animator.tweens[0].reversed)
        XCTAssertTrue(animator.tweens[1].reversed)
    }

}
