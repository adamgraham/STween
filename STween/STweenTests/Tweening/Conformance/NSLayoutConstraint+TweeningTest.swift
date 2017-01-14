//
//  NSLayoutConstraint+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 8/28/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class NSLayoutConstraint_TweeningTest: XCTestCase, TweenableTestable {

    // MARK: Tweenable Property Tests

    func testConstantTweenableProperty() {
        let tweenable = NSLayoutConstraint()
        let property = NSLayoutConstraint.TweenProperty.constant(100.0)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.constant == 100.0
        }
    }

    func testPriorityTweenableProperty() {
        let tweenable = NSLayoutConstraint()
        let property = NSLayoutConstraint.TweenProperty.priority(UILayoutPriorityDefaultHigh)
        assertValidInterpolation(tweenable: tweenable, property: property) {
            return tweenable.priority == UILayoutPriorityDefaultHigh
        }
    }

    // MARK: Invalid Interpolation Tests

    func testInvalidInterpolation() {
        let tweenable = NSLayoutConstraint()
        let propertyA = NSLayoutConstraint.TweenProperty.constant(100.0)
        let propertyB = NSLayoutConstraint.TweenProperty.priority(UILayoutPriorityDefaultHigh)
        assertInvalidInterpolation(tweenable: tweenable, propertyA: propertyA, propertyB: propertyB)
    }

}
