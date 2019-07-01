//
//  UIView+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UIView_TweeningTest: XCTestCase {

    func testXTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.x(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.origin.x, value)
    }

    func testYTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.y(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.origin.y, value)
    }

    func testOriginTweenProperty() {
        let view = UIView()
        let value = CGPoint(x: 100.0, y: 100.0)
        let property = UIView.TweenProperty.origin(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.origin, value)
    }

    func testWidthTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.width(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.width, value)
    }

    func testHeightTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.height(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.height, value)
    }

    func testSizeTweenProperty() {
        let view = UIView()
        let value = CGSize(width: 100.0, height: 100.0)
        let property = UIView.TweenProperty.size(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.size, value)
    }

    func testLeftTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.left(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.minX, value)
    }

    func testRightTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.right(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.maxX, value)
    }

    func testTopTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.top(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.minY, value)
    }

    func testBottomTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.bottom(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame.maxY, value)
    }

    func testFrameTweenProperty() {
        let view = UIView()
        let value = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        let property = UIView.TweenProperty.frame(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.frame, value)
    }

    func testBoundsTweenProperty() {
        let view = UIView()
        let value = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        let property = UIView.TweenProperty.bounds(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.bounds, value)
    }

    func testTransformTweenProperty() {
        let view = UIView()
        let value = CGAffineTransform(a: 1.0, b: 1.0, c: 1.0, d: 1.0, tx: 1.0, ty: 1.0)
        let property = UIView.TweenProperty.transform(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.transform, value)
    }

    func testCenterTweenProperty() {
        let view = UIView()
        let value = CGPoint(x: 100.0, y: 100.0)
        let property = UIView.TweenProperty.center(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.center, value)
    }

    func testCenterXTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.centerX(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.center.x, value)
    }

    func testCenterYTweenProperty() {
        let view = UIView()
        let value = CGFloat(100.0)
        let property = UIView.TweenProperty.centerY(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.center.y, value)
    }

    func testAlphaTweenProperty() {
        let view = UIView()
        let value = CGFloat(0.0)
        let property = UIView.TweenProperty.alpha(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.alpha, value)
    }

    func testBackgroundColorTweenProperty() {
        let view = UIView()
        let value = UIColor.red
        let property = UIView.TweenProperty.backgroundColor(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.backgroundColor, value)
    }

    @available(iOS 7.0, *)
    func testTintColorTweenProperty() {
        let view = UIView()
        let value = UIColor.blue
        let property = UIView.TweenProperty.tintColor(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.tintColor, value)
    }

    @available(iOS 4.0, *)
    func testContentScaleFactorTweenProperty() {
        let view = UIView()
        let value = CGFloat(0.5)
        let property = UIView.TweenProperty.contentScaleFactor(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.contentScaleFactor, value)
    }

    @available(iOS 8.0, *)
    func testLayoutMarginsTweenProperty() {
        let view = UIView()
        let value = UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0)
        let property = UIView.TweenProperty.layoutMargins(value)
        property.animation(view)(1.0)
        XCTAssertEqual(view.layoutMargins, value)
    }

}
