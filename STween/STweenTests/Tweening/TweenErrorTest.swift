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

    func testObjectNotConvertible() {
        let object = UIView()
        let type = CALayer.self
        let error = TweenError.objectNotConvertible(object, to: type)
        XCTAssertEqual(error.description, "TweenError.objectNotConvertible: An unexpected \(object) was found that is not convertible to \(type).")
    }

}
