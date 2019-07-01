//
//  UITextField+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UITextField_TweeningTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    // MARK: Properties

    func testTextColor() {
        let textField = UITextField()
        textField.textColor = nil
        let value = UIColor.red
        let property = UITextField.TweenPropertyDerived.textColor(value)
        property.animation(textField)(1.0)
        XCTAssertEqual(textField.textColor, value)
    }

    func testMinimumFontSize() {
        let textField = UITextField()
        let value = CGFloat(12.0)
        let property = UITextField.TweenPropertyDerived.minimumFontSize(value)
        property.animation(textField)(1.0)
        XCTAssertEqual(textField.minimumFontSize, value)
    }

    /// MARK: Tweening

    func testTweenTo() {
        let textField = UITextField()
        let tween = textField.tween(to: .textColor(.white))

        guard let animator = tween as? TweenAnimator<UITextField> else {
            XCTFail()
            return
        }

        animator.to(.minimumFontSize(12.0))

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [textField])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertFalse(animator.tweens[0].reversed)
        XCTAssertFalse(animator.tweens[1].reversed)
    }

    func testTweenFrom() {
        let textField = UITextField()
        let tween = textField.tween(from: .textColor(.white))

        guard let animator = tween as? TweenAnimator<UITextField> else {
            XCTFail()
            return
        }

        animator.from(.minimumFontSize(12.0))

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [textField])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertTrue(animator.tweens[0].reversed)
        XCTAssertTrue(animator.tweens[1].reversed)
    }

}
