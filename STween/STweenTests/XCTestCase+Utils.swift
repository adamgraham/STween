//
//  XCTestCase+Utils.swift
//  STween
//
//  Created by Adam Graham on 10/12/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

extension XCTestCase {

    func XCTAssertColor(_ lhs: UIColor, _ rhs: UIColor, includeAlpha: Bool = true) {
        var lhsRed: CGFloat = 0.0
        var lhsGreen: CGFloat = 0.0
        var lhsBlue: CGFloat = 0.0
        var lhsAlpha: CGFloat = 0.0

        lhs.getRed(&lhsRed, green: &lhsGreen, blue: &lhsBlue, alpha: &lhsAlpha)

        var rhsRed: CGFloat = 0.0
        var rhsGreen: CGFloat = 0.0
        var rhsBlue: CGFloat = 0.0
        var rhsAlpha: CGFloat = 0.0

        rhs.getRed(&rhsRed, green: &rhsGreen, blue: &rhsBlue, alpha: &rhsAlpha)

        XCTAssertEqualWithAccuracy(lhsRed, rhsRed, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(lhsGreen, rhsGreen, accuracy: CGFloat(FLT_EPSILON))
        XCTAssertEqualWithAccuracy(lhsBlue, rhsBlue, accuracy: CGFloat(FLT_EPSILON))

        if includeAlpha {
            XCTAssertEqualWithAccuracy(lhsAlpha, rhsAlpha, accuracy: CGFloat(FLT_EPSILON))
        }
    }

}
