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
        assertValidInterpolation(tweenable: textField, property: property) {
            return isEqual(textField.textColor ?? UIColor.clear, UIColor.darkGray)
        }
    }

    func testMinimumFontSize() {
        let textField = UITextField()
        let property = UITextFieldTweenProperty.minimumFontSize(12.0)
        assertValidInterpolation(tweenable: textField, property: property) {
            return textField.minimumFontSize == 12.0
        }
    }

}
