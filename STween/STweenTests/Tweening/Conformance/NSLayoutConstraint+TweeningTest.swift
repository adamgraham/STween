//
//  NSLayoutConstraint+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 8/28/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class NSLayoutConstraint_TweeningTest: XCTestCase {

    func testConstantTweenProperty() {
        let constraint = NSLayoutConstraint()
        let value = CGFloat(100.0)
        let property = NSLayoutConstraint.TweenProperty.constant(value)
        property.animation(constraint)(1.0)
        XCTAssertEqual(constraint.constant, value)
    }

}
