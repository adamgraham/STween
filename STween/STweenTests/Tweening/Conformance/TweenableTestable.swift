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
        
        let start = property.value(from: target)
        let values = (start: start, end: property)
        let interpolatedValue = Property.interpolate(
            from: values.start, to: values.end,
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

        let start = property.value(from: target)
        let values = (start: start, end: endValue)
        let interpolatedValue = Property.interpolate(
            from: values.start, to: values.end,
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
