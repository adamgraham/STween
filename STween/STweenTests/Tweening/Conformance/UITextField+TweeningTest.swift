//
//  UITextField+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 2/5/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UITextField_TweeningTest: XCTestCase, TweenableTestable {

    func testTextColor() {
        let textField = UITextField()
        let property = UITextFieldTweenProperty.textColor(UIColor.darkGray)
        assertValidInterpolation(of: property, on: textField) {
            (lhs: UITextFieldTweenProperty, rhs: UITextFieldTweenProperty) -> Bool in

            switch (lhs, rhs) {
            case (.textColor(let lhsColor), .textColor(let rhsColor)):
                return self.isEqual(lhsColor, rhsColor)
            default:
                return false
            }
        }
    }

    func testMinimumFontSize() {
        let textField = UITextField()
        let property = UITextFieldTweenProperty.minimumFontSize(12.0)
        assertValidInterpolation(of: property, on: textField)
    }

    func testInvalidInterpolation() {
        let textField = UITextField()
        let property = UITextFieldTweenProperty.minimumFontSize(12.0)
        let otherProperty = UITextFieldTweenProperty.textColor(UIColor.darkGray)
        assertInvalidInterpolation(of: property, to: otherProperty, on: textField)
    }

}
