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
        do {
            let startValue = try property.value(from: tweenable)
            let values = InterpolationValues(start: startValue, end: property)
            let interpolatedValue = values.interpolate(withEase: .linear, elapsed: 1.0, duration: 1.0)
            try interpolatedValue.apply(to: tweenable)
            XCTAssertTrue(interpolationAssert())
        } catch {
            XCTFail("Unexpected exception")
        }
    }

    func assertObjectNotConvertible<A: Tweenable, B: Tweenable>(tweenable: A, property: A.TweenProperty, unexpectedTweenable: B) {
        do {
            _ = try property.value(from: unexpectedTweenable)
            XCTFail("Unexpected success")
        } catch let error as TweenError {
            XCTAssertTrue(error.description.contains("TweenError.objectNotConvertible"))
        } catch {
            XCTFail("Unexpected exception")
        }

        do {
            try property.apply(to: unexpectedTweenable)
            XCTFail("Unexpected success")
        } catch let error as TweenError {
            XCTAssertTrue(error.description.contains("TweenError.objectNotConvertible"))
        } catch {
            XCTFail("Unexpected exception")
        }
    }

}
