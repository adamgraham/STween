//
//  UIView+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UIView_TweeningTest: XCTestCase, TweenableTestable {

    func testXTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.x(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testYTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.y(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testOriginTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.origin(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(of: property, on: view)
    }

    func testWidthTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.width(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testHeightTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.height(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testSizeTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.size(CGSize(width: 100.0, height: 100.0))
        assertValidInterpolation(of: property, on: view)
    }

    func testLeftTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.left(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testRightTweenProperty() {
        let view = UIView()
        view.frame.size.width = 25.0
        let property = UIViewTweenProperty.right(100.0)
        assertValidInterpolation(of: property, on: view)
        XCTAssertEqual(view.frame.origin.x, 75.0)
    }

    func testTopTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.top(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testBottomTweenProperty() {
        let view = UIView()
        view.frame.size.height = 25.0
        let property = UIViewTweenProperty.bottom(100.0)
        assertValidInterpolation(of: property, on: view)
        XCTAssertEqual(view.frame.origin.y, 75.0)
    }

    func testFrameTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.frame(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(of: property, on: view)
    }

    func testBoundsTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.bounds(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(of: property, on: view)
    }

    func testTransformTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.transform(CGAffineTransform(a: 1.0, b: 1.0, c: 1.0, d: 1.0, tx: 1.0, ty: 1.0))
        assertValidInterpolation(of: property, on: view)
    }

    func testCenterTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.center(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(of: property, on: view)
    }

    func testCenterXTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.centerX(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testCenterYTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.centerY(100.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testAlphaTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.alpha(0.0)
        assertValidInterpolation(of: property, on: view)
    }

    func testBackgroundColorTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.backgroundColor(UIColor.blue)
        assertValidInterpolation(of: property, on: view)
    }

    @available(iOS 7.0, *)
    func testTintColorTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.tintColor(UIColor.red)
        assertValidInterpolation(of: property, on: view)
    }

    @available(iOS 4.0, *)
    func testContentScaleFactorTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.contentScaleFactor(0.5)
        assertValidInterpolation(of: property, on: view)
    }

    @available(iOS 8.0, *)
    func testLayoutMarginsTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.layoutMargins(UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0))
        assertValidInterpolation(of: property, on: view)
    }

    func testInvalidInterpolation() {
        let view = UIView()
        let property = UIViewTweenProperty.x(100.0)
        let otherProperty = UIViewTweenProperty.y(100.0)
        assertInvalidInterpolation(of: property, to: otherProperty, on: view)
    }

}
