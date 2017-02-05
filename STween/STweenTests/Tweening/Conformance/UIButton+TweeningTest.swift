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
        let property = UIButton.TweenProperty.contentEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        assertObjectNotConvertible(tweenable: button, property: property, unexpectedTweenable: button.layer)
        assertValidInterpolation(tweenable: button, property: property) {
            return button.contentEdgeInsets == UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        }
    }

    func testTitleEdgeInsets() {
        let button = UIButton()
        let property = UIButton.TweenProperty.titleEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        assertObjectNotConvertible(tweenable: button, property: property, unexpectedTweenable: button.layer)
        assertValidInterpolation(tweenable: button, property: property) {
            return button.titleEdgeInsets == UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        }
    }

    func testImageEdgeInsets() {
        let button = UIButton()
        let property = UIButton.TweenProperty.imageEdgeInsets(UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0))
        assertObjectNotConvertible(tweenable: button, property: property, unexpectedTweenable: button.layer)
        assertValidInterpolation(tweenable: button, property: property) {
            return button.imageEdgeInsets == UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        }
    }

    func testTitleColor() {
        let button = UIButton()
        let property = UIButton.TweenProperty.titleColor(UIColor.lightGray, .normal)
        assertObjectNotConvertible(tweenable: button, property: property, unexpectedTweenable: button.layer)
        assertValidInterpolation(tweenable: button, property: property) {
            return isEqual(button.titleColor(for: .normal) ?? UIColor.clear, UIColor.lightGray)
        }
    }

    func testTitleShadowColor() {
        let button = UIButton()
        let property = UIButton.TweenProperty.titleShadowColor(UIColor.darkGray, .normal)
        assertObjectNotConvertible(tweenable: button, property: property, unexpectedTweenable: button.layer)
        assertValidInterpolation(tweenable: button, property: property) {
            return isEqual(button.titleShadowColor(for: .normal) ?? UIColor.clear, UIColor.darkGray)
        }
    }

    @available(iOS 5.0, *)
    func testTintColor() {
        let button = UIButton()
        let property = UIButtonTweenProperty.tintColor(UIColor.blue)
        assertObjectNotConvertible(tweenable: button, property: property, unexpectedTweenable: button.layer)
        assertValidInterpolation(tweenable: button, property: property) {
            return isEqual(button.tintColor, UIColor.blue)
        }
    }

}
