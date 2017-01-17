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
        let startValue = tweenable.interpolationStartValue(for: property)
        let endValue = property
        let values = InterpolationValues(start: startValue, end: endValue)

        do {
            try tweenable.interpolate(with: .linear, values: values, elapsed: 1.0, duration: 1.0)
            XCTAssertTrue(interpolationAssert())
        } catch {
            XCTFail("Unexpected exception")
        }
    }

    func assertInvalidInterpolation<T: Tweenable>(tweenable: T, propertyA: T.TweenProperty, propertyB: T.TweenProperty) {
        let values = InterpolationValues(start: propertyA, end: propertyB)

        do {
            try tweenable.interpolate(with: .linear, values: values, elapsed: 1.0, duration: 1.0)
            XCTFail("Unexpected success")
        } catch let error as TweenError {
            XCTAssertTrue(error.description.contains("TweenError.invalidInterpolation"))
        } catch {
            XCTFail("Unexpected exception")
        }
    }

}
