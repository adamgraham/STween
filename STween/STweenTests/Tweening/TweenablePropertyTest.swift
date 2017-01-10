//
//  TweenablePropertyTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenablePropertyTest: XCTestCase {

    func testInterpolationValue() {
        class TestClass: TweenableProperty {
            var associatedValue: InterpolationValue = 100.0
        }

        let test = TestClass()
        XCTAssertEqual(test.associatedValue as? Double, 100.0)
    }

}
