//
//  InterpolationValueTest.swift
//  STween
//
//  Created by Adam Graham on 7/7/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class InterpolationValueTest: XCTestCase {

    func testNSObject() {
        let object: NSObject = NSObject()

        XCTAssertNil(object as? InterpolationValue)
        XCTAssertNil(object as? Interpolatable)
        XCTAssertNil(object as? SerializationValue)
    }

    func testUInt() {
        let value: UInt = 0

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Interpolatable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: 1 as UInt, elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

    func testInt() {
        let value: Int = 0

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Interpolatable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: 1 as Int, elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

    func testDouble() {
        let value: Double = 0.0

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Interpolatable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: 1.0 as Double, elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

    func testFloat() {
        let value: Float = 0.0

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Interpolatable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: 1.0 as Float, elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

    func testCGFloat() {
        let value: CGFloat = 0.0

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Interpolatable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: 1.0 as CGFloat, elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

    func testCGPoint() {
        let value: CGPoint = CGPoint()

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Serializable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: CGPoint(), elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

    func testCGSize() {
        let value: CGSize = CGSize()

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Interpolatable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: CGSize(), elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

    func testCGRect() {
        let value: CGRect = CGRect()

        XCTAssertNotNil(value as InterpolationValue)
        XCTAssertNotNil(value as Interpolatable)
        XCTAssertNotNil(value as SerializationValue)

        do {
            _ = try value.interpolate(with: .linear, endValue: CGRect(), elapsed: 0.5, duration: 1.0)
        } catch let error as InterpolationError {
            XCTFail(error.description)
        } catch {
            XCTFail("The class failed to interpolate a value with an unknown error.")
        }
    }

}
