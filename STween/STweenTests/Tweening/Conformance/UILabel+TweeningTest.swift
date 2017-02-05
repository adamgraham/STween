//
//  UILabel+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 2/2/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UILabel_TweeningTest: XCTestCase, TweenableTestable {

    func testTextColor() {
        let label = UILabel()
        let property = UILabel.TweenProperty.textColor(UIColor.lightGray)
        assertObjectNotConvertible(tweenable: label, property: property, unexpectedTweenable: label.layer)
        assertValidInterpolation(tweenable: label, property: property) {
            return isEqual(label.textColor, UIColor.lightGray)
        }
    }

    func testHighlightedTextColor() {
        let label = UILabel()
        let property = UILabel.TweenProperty.highlightedTextColor(UIColor.gray)
        assertObjectNotConvertible(tweenable: label, property: property, unexpectedTweenable: label.layer)
        assertValidInterpolation(tweenable: label, property: property) {
            return isEqual(label.highlightedTextColor ?? UIColor.clear, UIColor.gray)
        }
    }

    func testShadowColor() {
        let label = UILabel()
        let property = UILabel.TweenProperty.shadowColor(UIColor.darkGray)
        assertObjectNotConvertible(tweenable: label, property: property, unexpectedTweenable: label.layer)
        assertValidInterpolation(tweenable: label, property: property) {
            return isEqual(label.shadowColor ?? UIColor.clear, UIColor.darkGray)
        }
    }

    func testShadowOffset() {
        let label = UILabel()
        let property = UILabel.TweenProperty.shadowOffset(CGSize(width: 2.0, height: 2.0))
        assertObjectNotConvertible(tweenable: label, property: property, unexpectedTweenable: label.layer)
        assertValidInterpolation(tweenable: label, property: property) {
            return label.shadowOffset == CGSize(width: 2.0, height: 2.0)
        }
    }

    @available(iOS 6.0, *)
    func testMinimumScaleFactor() {
        let label = UILabel()
        let property = UILabel.TweenProperty.minimumScaleFactor(0.5)
        assertObjectNotConvertible(tweenable: label, property: property, unexpectedTweenable: label.layer)
        assertValidInterpolation(tweenable: label, property: property) {
            return label.minimumScaleFactor == 0.5
        }
    }

    @available(iOS 6.0, *)
    func testPreferredMaxLayoutWidth() {
        let label = UILabel()
        let property = UILabel.TweenProperty.preferredMaxLayoutWidth(100.0)
        assertObjectNotConvertible(tweenable: label, property: property, unexpectedTweenable: label.layer)
        assertValidInterpolation(tweenable: label, property: property) {
            return label.preferredMaxLayoutWidth == 100.0
        }
    }

}
