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
        assertValidInterpolation(of: property, on: constraint)
    }

}
