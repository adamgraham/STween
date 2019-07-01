//
//  UIButton+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UIButton_TweeningTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    // MARK: Properties

    func testContentEdgeInsets() {
        let button = UIButton()
        let value = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        let property = UIButton.TweenPropertyDerived.contentEdgeInsets(value)
        property.animation(button)(1.0)
        XCTAssertEqual(button.contentEdgeInsets, value)
    }

    func testTitleEdgeInsets() {
        let button = UIButton()
        let value = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        let property = UIButton.TweenPropertyDerived.titleEdgeInsets(value)
        property.animation(button)(1.0)
        XCTAssertEqual(button.titleEdgeInsets, value)
    }

    func testImageEdgeInsets() {
        let button = UIButton()
        let value = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        let property = UIButton.TweenPropertyDerived.imageEdgeInsets(value)
        property.animation(button)(1.0)
        XCTAssertEqual(button.imageEdgeInsets, value)
    }

    func testTitleColor() {
        let button = UIButton()
        button.setTitleColor(nil, for: .normal)
        let value = UIColor.red
        let property = UIButton.TweenPropertyDerived.titleColor(value, state: .normal)
        property.animation(button)(1.0)
        XCTAssertEqual(button.titleColor(for: .normal), value)
    }

    func testTitleShadowColor() {
        let button = UIButton()
        button.setTitleShadowColor(nil, for: .normal)
        let value = UIColor.green
        let property = UIButton.TweenPropertyDerived.titleShadowColor(value, state: .normal)
        property.animation(button)(1.0)
        XCTAssertEqual(button.titleShadowColor(for: .normal), value)
    }

    @available(iOS 5.0, *)
    func testTintColor() {
        let button = UIButton()
        let value = UIColor.blue
        let property = UIButton.TweenPropertyDerived.tintColor(value)
        property.animation(button)(1.0)
        XCTAssertEqual(button.tintColor, value)
    }

    // MARK: Tweening

    func testTweenTo() {
        let button = UIButton()
        let tween = button.tween(to: .titleEdgeInsets(.zero))

        guard let animator = tween as? TweenAnimator<UIButton> else {
            XCTFail()
            return
        }

        animator.to(.imageEdgeInsets(.zero))

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [button])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertFalse(animator.tweens[0].reversed)
        XCTAssertFalse(animator.tweens[1].reversed)
    }

    func testTweenFrom() {
        let button = UIButton()
        let tween = button.tween(from: .titleEdgeInsets(.zero))

        guard let animator = tween as? TweenAnimator<UIButton> else {
            XCTFail()
            return
        }

        animator.from(.imageEdgeInsets(.zero))

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [button])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertTrue(animator.tweens[0].reversed)
        XCTAssertTrue(animator.tweens[1].reversed)
    }

}
