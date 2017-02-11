//
//  TweenableTestable.swift
//  STween
//
//  Created by Adam Graham on 1/13/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

protocol TweenableTestable {

}

extension TweenableTestable {

    func assertValidInterpolation<T: Tweenable>(tweenable: T, property: T.TweenProperty, interpolationAssert: (() -> Bool)) {
        let startValue = tweenable.value(of: property)
        let values = InterpolationValues(start: startValue, end: property)
        let interpolatedValue = values.interpolate(with: .linear, elapsed: 1.0, duration: 1.0)
        tweenable.apply(interpolatedValue)
        XCTAssertTrue(interpolationAssert())
    }

}
