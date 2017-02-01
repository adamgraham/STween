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

    func assertValidInterpolation<T: Tweenable>(tweenable: T, property: T.TweenProperty, interpolationAssert: (() -> Bool))
        where T.TweenProperty.Value == T.TweenProperty {
        do {
            let startValue = try property.value(from: tweenable)
            let values = InterpolationValues(start: startValue, end: property)
            let interpolatedValue = values.interpolate(with: .linear, elapsed: 1.0, duration: 1.0)
            try interpolatedValue.apply(to: tweenable)
            XCTAssertTrue(interpolationAssert())
        } catch {
            XCTFail("Unexpected exception")
        }
    }

    func assertObjectNotConvertible<A: Tweenable, B: Tweenable>(tweenable: A, property: A.TweenProperty, unexpectedTweenable: B)
        where A.TweenProperty.Value == A.TweenProperty {
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
