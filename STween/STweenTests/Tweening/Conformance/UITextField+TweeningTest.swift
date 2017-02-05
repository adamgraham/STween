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
        let property = UITextField.TweenProperty.textColor(UIColor.darkGray)
        assertObjectNotConvertible(tweenable: textField, property: property, unexpectedTweenable: textField.layer)
        assertValidInterpolation(tweenable: textField, property: property) {
            return isEqual(textField.textColor ?? UIColor.clear, UIColor.darkGray)
        }
    }

    func testMinimumFontSize() {
        let textField = UITextField()
        let property = UITextField.TweenProperty.minimumFontSize(12.0)
        assertObjectNotConvertible(tweenable: textField, property: property, unexpectedTweenable: textField.layer)
        assertValidInterpolation(tweenable: textField, property: property) {
            return textField.minimumFontSize == 12.0
        }
    }

}
