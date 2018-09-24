//
//  UIButton+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UIButton_TweeningTest: XCTestCase, TweenableTestable {

    func testContentEdgeInsets() {
        let button = UIButton()
        let property = UIButtonTweenProperty.contentEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        assertValidInterpolation(of: property, on: button)
    }

    func testTitleEdgeInsets() {
        let button = UIButton()
        let property = UIButtonTweenProperty.titleEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        assertValidInterpolation(of: property, on: button)
    }

    func testImageEdgeInsets() {
        let button = UIButton()
        let property = UIButtonTweenProperty.imageEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        assertValidInterpolation(of: property, on: button)
    }

    func testTitleColor() {
        let button = UIButton()
        let property = UIButtonTweenProperty.titleColor(UIColor.lightGray, .normal)
        assertValidInterpolation(of: property, on: button) {
            (lhs: UIButtonTweenProperty, rhs: UIButtonTweenProperty) -> Bool in

            switch (lhs, rhs) {
            case (.titleColor(let lhsValues), .titleColor(let rhsValues)):
                return self.isEqual(lhsValues.0, rhsValues.0) && lhsValues.1 == rhsValues.1
            default:
                return false
            }
        }
    }

    func testTitleShadowColor() {
        let button = UIButton()
        let property = UIButtonTweenProperty.titleShadowColor(UIColor.darkGray, .normal)
        assertValidInterpolation(of: property, on: button) {
            (lhs: UIButtonTweenProperty, rhs: UIButtonTweenProperty) -> Bool in

            switch (lhs, rhs) {
            case (.titleShadowColor(let lhsValues), .titleShadowColor(let rhsValues)):
                return self.isEqual(lhsValues.0, rhsValues.0) && lhsValues.1 == rhsValues.1
            default:
                return false
            }
        }
    }

    @available(iOS 5.0, *)
    func testTintColor() {
        let button = UIButton()
        let property = UIButtonTweenProperty.tintColor(UIColor.blue)
        assertValidInterpolation(of: property, on: button)
    }

    func testInvalidInterpolation() {
        let button = UIButton()
        let property = UIButtonTweenProperty.contentEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        let otherProperty = UIButtonTweenProperty.titleEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        assertInvalidInterpolation(of: property, to: otherProperty, on: button)
    }

}
