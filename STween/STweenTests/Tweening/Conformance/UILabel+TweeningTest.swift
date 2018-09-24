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
            (lhs: UILabelTweenProperty, rhs: UILabelTweenProperty) -> Bool in

            switch (lhs, rhs) {
            case (.textColor(let lhsColor), .textColor(let rhsColor)):
                return self.isEqual(lhsColor, rhsColor)
            default:
                return false
            }
        }
    }

    func testHighlightedTextColor() {
        let label = UILabel()
        let property = UILabelTweenProperty.highlightedTextColor(UIColor.gray)
        assertValidInterpolation(of: property, on: label) {
            (lhs: UILabelTweenProperty, rhs: UILabelTweenProperty) -> Bool in

            switch (lhs, rhs) {
            case (.highlightedTextColor(let lhsColor), .highlightedTextColor(let rhsColor)):
                return self.isEqual(lhsColor, rhsColor)
            default:
                return false
            }
        }
    }

    func testShadowColor() {
        let label = UILabel()
        let property = UILabelTweenProperty.shadowColor(UIColor.darkGray)
        assertValidInterpolation(of: property, on: label) {
            (lhs: UILabelTweenProperty, rhs: UILabelTweenProperty) -> Bool in

            switch (lhs, rhs) {
            case (.shadowColor(let lhsColor), .shadowColor(let rhsColor)):
                return self.isEqual(lhsColor, rhsColor)
            default:
                return false
            }
        }
    }

    func testShadowOffset() {
        let label = UILabel()
        let property = UILabelTweenProperty.shadowOffset(CGSize(width: 2.0, height: 2.0))
        assertValidInterpolation(of: property, on: label)
    }

    @available(iOS 6.0, *)
    func testMinimumScaleFactor() {
        let label = UILabel()
        let property = UILabelTweenProperty.minimumScaleFactor(0.5)
        assertValidInterpolation(of: property, on: label)
    }

    @available(iOS 6.0, *)
    func testPreferredMaxLayoutWidth() {
        let label = UILabel()
        let property = UILabelTweenProperty.preferredMaxLayoutWidth(100.0)
        assertValidInterpolation(of: property, on: label)
    }

    func testInvalidInterpolation() {
        let label = UILabel()
        let property = UILabelTweenProperty.shadowOffset(CGSize(width: 2.0, height: 2.0))
        let otherProperty = UILabelTweenProperty.shadowColor(UIColor.darkGray)
        assertInvalidInterpolation(of: property, to: otherProperty, on: label)
    }

}
