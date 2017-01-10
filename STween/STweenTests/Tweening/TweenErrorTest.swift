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
        let error = TweenError.propertyNotTweenable(property: UIView.TweenProperty.width(100.0), on: self)
        XCTAssertEqual(error.description, "TweeningError.propertyNotTweenable: An unexpected width(100.0) was found that is not tweenable on -[TweenErrorTest testPropertyNotTweenable].")
    }

}
