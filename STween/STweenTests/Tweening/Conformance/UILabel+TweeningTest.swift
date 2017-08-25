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
        let property = UILabelTweenProperty.textColor(UIColor.lightGray)
        assertValidInterpolation(of: property, on: label) {
            return isEqual(label.textColor, UIColor.lightGray)
        }
    }

    func testHighlightedTextColor() {
        let label = UILabel()
        let property = UILabelTweenProperty.highlightedTextColor(UIColor.gray)
        assertValidInterpolation(of: property, on: label) {
            return isEqual(label.highlightedTextColor ?? UIColor.clear, UIColor.gray)
        }
    }

    func testShadowColor() {
        let label = UILabel()
        let property = UILabelTweenProperty.shadowColor(UIColor.darkGray)
        assertValidInterpolation(of: property, on: label) {
            return isEqual(label.shadowColor ?? UIColor.clear, UIColor.darkGray)
        }
    }

    func testShadowOffset() {
        let label = UILabel()
        let property = UILabelTweenProperty.shadowOffset(CGSize(width: 2.0, height: 2.0))
        assertValidInterpolation(of: property, on: label) {
            return label.shadowOffset == CGSize(width: 2.0, height: 2.0)
        }
    }

    @available(iOS 6.0, *)
    func testMinimumScaleFactor() {
        let label = UILabel()
        let property = UILabelTweenProperty.minimumScaleFactor(0.5)
        assertValidInterpolation(of: property, on: label) {
            return label.minimumScaleFactor == 0.5
        }
    }

    @available(iOS 6.0, *)
    func testPreferredMaxLayoutWidth() {
        let label = UILabel()
        let property = UILabelTweenProperty.preferredMaxLayoutWidth(100.0)
        assertValidInterpolation(of: property, on: label) {
            return label.preferredMaxLayoutWidth == 100.0
        }
    }

}
