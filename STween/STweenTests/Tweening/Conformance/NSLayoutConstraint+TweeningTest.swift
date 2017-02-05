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

    func testConstantTweenProperty() {
        let constraint = NSLayoutConstraint()
        let property = NSLayoutConstraintTweenProperty.constant(100.0)
        assertObjectNotConvertible(tweenable: constraint, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: constraint, property: property) {
            return constraint.constant == 100.0
        }
    }

    func testPriorityTweenProperty() {
        let constraint = NSLayoutConstraint()
        let property = NSLayoutConstraintTweenProperty.priority(UILayoutPriorityDefaultHigh)
        assertObjectNotConvertible(tweenable: constraint, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: constraint, property: property) {
            return constraint.priority == UILayoutPriorityDefaultHigh
        }
    }

}
