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
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.x == 100.0
        }
    }

    func testYTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.y(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.y == 100.0
        }
    }

    func testOriginTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.origin(CGPoint(x: 100.0, y: 100.0))
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testWidthTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.width(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.size.width == 100.0
        }
    }

    func testHeightTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.height(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.size.height == 100.0
        }
    }

    func testSizeTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.size(CGSize(width: 100.0, height: 100.0))
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.size == CGSize(width: 100.0, height: 100.0)
        }
    }

    func testLeftTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.left(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.x == 100.0
        }
    }

    func testRightTweenProperty() {
        let view = UIView()
        view.frame.size.width = 100.0
        let property = UIViewTweenProperty.right(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.x == 0.0
        }
    }

    func testTopTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.top(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.y == 100.0
        }
    }

    func testBottomTweenProperty() {
        let view = UIView()
        view.frame.size.height = 100.0
        let property = UIViewTweenProperty.bottom(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.y == 0.0
        }
    }

    func testFrameTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.frame(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testBoundsTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.bounds(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.bounds == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testTransformTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.transform(CGAffineTransform(a: 1.0, b: 1.0, c: 1.0, d: 1.0, tx: 1.0, ty: 1.0))
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.transform == CGAffineTransform(a: 1.0, b: 1.0, c: 1.0, d: 1.0, tx: 1.0, ty: 1.0)
        }
    }

    func testCenterTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.center(CGPoint(x: 100.0, y: 100.0))
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.center == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testCenterXTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.centerX(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.center.x == 100.0
        }
    }

    func testCenterYTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.centerY(100.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.center.y == 100.0
        }
    }

    func testAlphaTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.alpha(0.0)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.alpha == 0.0
        }
    }

    func testBackgroundColorTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.backgroundColor(UIColor.blue)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.backgroundColor == UIColor.blue
        }
    }

    @available(iOS 7.0, *)
    func testTintColorTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.tintColor(UIColor.red)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.tintColor == UIColor.red
        }
    }

    @available(iOS 4.0, *)
    func testContentScaleFactorTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.contentScaleFactor(0.5)
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.contentScaleFactor == 0.5
        }
    }

    @available(iOS 8.0, *)
    func testLayoutMarginsTweenProperty() {
        let view = UIView()
        let property = UIViewTweenProperty.layoutMargins(UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0))
        assertObjectNotConvertible(tweenable: view, property: property, unexpectedTweenable: view.layer)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.layoutMargins == UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0)
        }
    }

}
