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
        let tweenable = UIView()
        let property = UIView.TweenProperty.x(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.origin.x == 100.0
        }
    }

    func testYTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.y(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.origin.y == 100.0
        }
    }

    func testOriginTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.origin(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.origin == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testWidthTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.width(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.size.width == 100.0
        }
    }

    func testHeightTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.height(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.size.height == 100.0
        }
    }

    func testSizeTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.size(CGSize(width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.size == CGSize(width: 100.0, height: 100.0)
        }
    }

    func testLeftTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.left(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.origin.x == 100.0
        }
    }

    func testRightTweenableProperty() {
        let tweenable = UIView()
        tweenable.frame.size.width = 100.0
        let property = UIView.TweenProperty.right(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.origin.x == 0.0
        }
    }

    func testTopTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.top(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.origin.y == 100.0
        }
    }

    func testBottomTweenableProperty() {
        let tweenable = UIView()
        tweenable.frame.size.height = 100.0
        let property = UIView.TweenProperty.bottom(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame.origin.y == 0.0
        }
    }

    func testFrameTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.frame(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.frame == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testBoundsTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.bounds(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.bounds == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testCenterTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.center(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.center == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testCenterXTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.centerX(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.center.x == 100.0
        }
    }

    func testCenterYTweenableProperty() {
        let tweenable = UIView()
        let property = UIView.TweenProperty.centerY(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.center.y == 100.0
        }
    }

    // MARK: Invalid Interpolation Tests

    func testInvalidInterpolation() {
        let tweenable = UIView()
        let propertyA = UIView.TweenProperty.x(100.0)
        let propertyB = UIView.TweenProperty.y(100.0)
        assertInvalidInterpolation(tweenable: tweenable, propertyA: propertyA, propertyB: propertyB)
    }

}
