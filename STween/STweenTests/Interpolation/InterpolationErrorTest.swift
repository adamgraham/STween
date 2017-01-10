//
//  InterpolationErrorTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class InterpolationErrorTest: XCTestCase {

    func testValueNotConvertible() {
        let error = InterpolationError.valueNotConvertible(value: CGPoint(), to: Double.self)
        XCTAssertEqual(error.description, "InterpolationError.valueNotConvertible: An unexpected (0.0, 0.0) was found that is not convertible to Double.")
    }

}
