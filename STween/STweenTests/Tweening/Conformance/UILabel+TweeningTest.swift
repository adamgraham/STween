//
//  UILabel+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 2/2/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UILabel_TweeningTest: XCTestCase {

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
        let label = UILabel()
        label.textColor = nil
        let value = UIColor.red
        let property = UILabel.TweenPropertyDerived.textColor(value)
        property.animation(label)(1.0)
        XCTAssertEqual(label.textColor, value)
    }

    func testHighlightedTextColor() {
        let label = UILabel()
        label.highlightedTextColor = nil
        let value = UIColor.blue
        let property = UILabel.TweenPropertyDerived.highlightedTextColor(value)
        property.animation(label)(1.0)
        XCTAssertEqual(label.highlightedTextColor, value)
    }

    func testShadowColor() {
        let label = UILabel()
        label.shadowColor = nil
        let value = UIColor.green
        let property = UILabel.TweenPropertyDerived.shadowColor(value)
        property.animation(label)(1.0)
        XCTAssertEqual(label.shadowColor, value)
    }

    func testShadowOffset() {
        let label = UILabel()
        let value = CGSize(width: 2.0, height: 2.0)
        let property = UILabel.TweenPropertyDerived.shadowOffset(value)
        property.animation(label)(1.0)
        XCTAssertEqual(label.shadowOffset, value)
    }

    @available(iOS 6.0, *)
    func testMinimumScaleFactor() {
        let label = UILabel()
        let value = CGFloat(0.5)
        let property = UILabel.TweenPropertyDerived.minimumScaleFactor(value)
        property.animation(label)(1.0)
        XCTAssertEqual(label.minimumScaleFactor, value)
    }

    @available(iOS 6.0, *)
    func testPreferredMaxLayoutWidth() {
        let label = UILabel()
        let value = CGFloat(100.0)
        let property = UILabel.TweenPropertyDerived.preferredMaxLayoutWidth(value)
        property.animation(label)(1.0)
        XCTAssertEqual(label.preferredMaxLayoutWidth, value)
    }

    // MARK: Tweening

    func testTweenTo() {
        let label = UILabel()
        let tween = label.tween(to: .textColor(.white))

        guard let animator = tween as? TweenAnimator<UILabel> else {
            XCTFail()
            return
        }

        animator.to(.highlightedTextColor(.black))

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [label])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertFalse(animator.tweens[0].reversed)
        XCTAssertFalse(animator.tweens[1].reversed)
    }

    func testTweenFrom() {
        let label = UILabel()
        let tween = label.tween(from: .textColor(.white))

        guard let animator = tween as? TweenAnimator<UILabel> else {
            XCTFail()
            return
        }

        animator.from(.highlightedTextColor(.black))

        XCTAssertEqual(Tweener.default.count, 1)
        XCTAssertEqual(animator.targets, [label])
        XCTAssertEqual(animator.tweens.count, 2)
        XCTAssertTrue(animator.tweens[0].reversed)
        XCTAssertTrue(animator.tweens[1].reversed)
    }

}
