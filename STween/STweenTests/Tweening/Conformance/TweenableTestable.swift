//
//  TweenableTestable.swift
//  STween
//
//  Created by Adam Graham on 1/13/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

protocol TweenableTestable {}

extension TweenableTestable {

    func assertValidInterpolation<Property: TweenableProperty>(
        of property: Property, on target: Property.Target,
        assertEqual: ((Property, Property) -> Bool)? = nil) {
        
        let startValue = property.value(from: target)
        let values = InterpolationValues(start: startValue, end: property)
        let interpolatedValue = values.interpolate(
            with: .linear, elapsed: 1.0, duration: 1.0)

        if let assert = assertEqual {
            XCTAssertFalse(assert(values.start, values.end))
            XCTAssertTrue(assert(values.end, interpolatedValue))
            interpolatedValue.apply(to: target)
            XCTAssertTrue(assert(property.value(from: target), interpolatedValue))
        } else {
            XCTAssertNotEqual(values.start, values.end)
            XCTAssertEqual(values.end, interpolatedValue)
            interpolatedValue.apply(to: target)
            XCTAssertEqual(property.value(from: target), interpolatedValue)
        }
    }

    func assertInvalidInterpolation<Property: TweenableProperty>(
        of property: Property, to endValue: Property,
        on target: Property.Target,
        assertEqual: ((Property, Property) -> Bool)? = nil) {

        let startValue = property.value(from: target)
        let values = InterpolationValues(start: startValue, end: endValue)
        let interpolatedValue = values.interpolate(
            with: .linear, elapsed: 1.0, duration: 1.0)

        if let assert = assertEqual {
            XCTAssertTrue(assert(values.start, interpolatedValue))
            XCTAssertFalse(assert(values.start, property))
            XCTAssertFalse(assert(values.start, values.end))
            XCTAssertFalse(assert(values.end, interpolatedValue))
            interpolatedValue.apply(to: target)
            XCTAssertTrue(assert(property.value(from: target), interpolatedValue))
        } else {
            XCTAssertEqual(values.start, interpolatedValue)
            XCTAssertNotEqual(values.start, property)
            XCTAssertNotEqual(values.start, values.end)
            XCTAssertNotEqual(values.end, interpolatedValue)
            interpolatedValue.apply(to: target)
            XCTAssertEqual(property.value(from: target), interpolatedValue)
        }
    }

}
