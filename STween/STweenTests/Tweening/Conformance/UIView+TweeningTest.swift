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

    // MARK: Tweenable Property Tests

    func testXTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.x(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.x == 100.0
        }
    }

    func testYTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.y(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.y == 100.0
        }
    }

    func testOriginTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.origin(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testWidthTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.width(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.size.width == 100.0
        }
    }

    func testHeightTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.height(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.size.height == 100.0
        }
    }

    func testSizeTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.size(CGSize(width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.size == CGSize(width: 100.0, height: 100.0)
        }
    }

    func testLeftTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.left(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.x == 100.0
        }
    }

    func testRightTweenableProperty() {
        let view = UIView()
        view.frame.size.width = 100.0
        let property = UIView.TweenProperty.right(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.x == 0.0
        }
    }

    func testTopTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.top(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.y == 100.0
        }
    }

    func testBottomTweenableProperty() {
        let view = UIView()
        view.frame.size.height = 100.0
        let property = UIView.TweenProperty.bottom(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame.origin.y == 0.0
        }
    }

    func testFrameTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.frame(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: view, property: property) {
            return view.frame == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testBoundsTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.bounds(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: view, property: property) {
            return view.bounds == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testTransformTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.transform(CGAffineTransform(a: 1.0, b: 1.0, c: 1.0, d: 1.0, tx: 1.0, ty: 1.0))
        assertValidInterpolation(tweenable: view, property: property) {
            return view.transform == CGAffineTransform(a: 1.0, b: 1.0, c: 1.0, d: 1.0, tx: 1.0, ty: 1.0)
        }
    }

    func testCenterTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.center(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(tweenable: view, property: property) {
            return view.center == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testCenterXTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.centerX(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.center.x == 100.0
        }
    }

    func testCenterYTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.centerY(100.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.center.y == 100.0
        }
    }

    func testAlphaTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.alpha(0.0)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.alpha == 0.0
        }
    }

    func testBackgroundColorTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.backgroundColor(UIColor.blue)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.backgroundColor == UIColor.blue
        }
    }

    @available(iOS 7.0, *)
    func testTintColorTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.tintColor(UIColor.red)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.tintColor == UIColor.red
        }
    }

    @available(iOS 4.0, *)
    func testContentScaleFactorTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.contentScaleFactor(0.5)
        assertValidInterpolation(tweenable: view, property: property) {
            return view.contentScaleFactor == 0.5
        }
    }

    @available(iOS 8.0, *)
    func testLayoutMarginsTweenableProperty() {
        let view = UIView()
        let property = UIView.TweenProperty.layoutMargins(UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0))
        assertValidInterpolation(tweenable: view, property: property) {
            return view.layoutMargins == UIEdgeInsets(top: 50.0, left: 50.0, bottom: 50.0, right: 50.0)
        }
    }

    // MARK: Invalid Interpolation Tests

    func testInvalidInterpolation() {
        let view = UIView()
        let propertyA = UIView.TweenProperty.x(100.0)
        let propertyB = UIView.TweenProperty.y(100.0)
        assertInvalidInterpolation(tweenable: view, propertyA: propertyA, propertyB: propertyB)
    }

}
