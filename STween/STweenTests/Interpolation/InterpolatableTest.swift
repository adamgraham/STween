//
//  InterpolatableTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class InterpolatableTest: XCTestCase {

    // MARK: Custom Implementation Tests

    func testUIntInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: UInt.self, validValue: UInt())
    }

    func testIntInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: Int.self, validValue: Int())
    }

    func testDoubleInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: Double.self, validValue: Double())
    }

    func testFloatInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: Float.self, validValue: Float())
    }

    func testCGFloatInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: CGFloat.self, validValue: CGFloat())
    }

    func testCGPointInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: CGPoint.self, validValue: CGPoint())
    }

    func testCGSizeInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: CGSize.self, validValue: CGSize())
    }

    func testCGRectInterpolation() {
        InterpolatableTest.assertInterpolation(interpolatable: CGRect.self, validValue: CGRect())
    }

    // MARK: Assertions

    static func assertInterpolation(interpolatable: Interpolatable.Type, validValue: InterpolationValue) {
        class InvalidValue: InterpolationValue {
            public static func interpolate(with ease: Ease,
                                           startValue: InterpolationValue,
                                           endValue: InterpolationValue,
                                           elapsed: TimeInterval,
                                           duration: TimeInterval) throws -> InterpolationValue {
                return 0.0
            }
        }

        // Test for no errors

        do {
            _ = try interpolatable.interpolate(
                with: .linear,
                startValue: validValue,
                endValue: validValue,
                elapsed: 0.5,
                duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }

        // Test for error `valueNotConvertible` on `startValue`

        do {
            _ = try interpolatable.interpolate(
                with: .linear,
                startValue: InvalidValue(),
                endValue: validValue,
                elapsed: 0.5,
                duration: 1.0)
            XCTFail("The class succeeded to interpolate a value when it was intended to fail.")
        } catch let error as InterpolationError {
            XCTAssertTrue(error.description.contains("InterpolationError.valueNotConvertible:"))
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }

        // Test for error `valueNotConvertible` on `endValue`

        do {
            _ = try interpolatable.interpolate(
                with: .linear,
                startValue: validValue,
                endValue: InvalidValue(),
                elapsed: 0.5,
                duration: 1.0)
            XCTFail("The class succeeded to interpolate a value when it was intended to fail.")
        } catch let error as InterpolationError {
            XCTAssertTrue(error.description.contains("InterpolationError.valueNotConvertible:"))
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

}
