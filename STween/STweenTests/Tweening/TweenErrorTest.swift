//
//  TweenErrorTest.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenErrorTest: XCTestCase {

    func testPropertyNotTweenable() {
        let valueA = UIView.TweenProperty.x(0.0)
        let valueB = UIView.TweenProperty.y(0.0)
        let tweenable = UIView()
        let error = TweenError.invalidInterpolation(valueA: valueA, valueB: valueB, tweenable: tweenable)
        XCTAssertEqual(error.description, "TweenError.invalidInterpolation: A mismatched set of values, \(valueA) and \(valueB), could not be interpolated on \(tweenable).")
    }

}
