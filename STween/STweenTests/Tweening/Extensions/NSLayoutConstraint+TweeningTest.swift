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

    func testConstantTweenableProperty() {
        let property = NSLayoutConstraint.TweenProperty.constant(100.0)
        XCTAssertEqual(property.associatedValue as? CGFloat, 100.0)

        let constraint = NSLayoutConstraint()
        XCTAssertEqual(constraint.tweenableValue(get: property) as? CGFloat, CGFloat(0.0))
        try? constraint.tweenableValue(set: property, newValue: CGFloat(100.0))
        XCTAssertEqual(constraint.tweenableValue(get: property) as? CGFloat, CGFloat(100.0))
    }

}
