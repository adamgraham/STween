//
//  EaseFunctionsTest.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class EaseFunctionsTest: XCTestCase {

    func testFloat32() {
        assertType(Float32.self, accuracy: Float32.ulpOfOne.double)
    }

    func testFloat64() {
        assertType(Float64.self, accuracy: Float64.ulpOfOne.double)
    }

    func testFloat80() {
        //iOS_BUG: XCTAssertEqualWithAccuracy using Float80 crashes
        //assertType(Float80.self, accuracy: Float80.ulpOfOne.double)
    }

    func testCGFloat() {
        assertType(CGFloat.self, accuracy: CGFloat.ulpOfOne.double)
    }

    private func assertType<T: FloatingPoint>(_ type: T.Type, accuracy: T) {
        assertLinear(type, accuracy)

        assertSineIn(type, accuracy)
        assertSineOut(type, accuracy)
        assertSineInOut(type, accuracy)

        assertCubicIn(type, accuracy)
        assertCubicOut(type, accuracy)
        assertCubicInOut(type, accuracy)

        assertQuadIn(type, accuracy)
        assertQuadOut(type, accuracy)
        assertQuadInOut(type, accuracy)

        assertQuartIn(type, accuracy)
        assertQuartOut(type, accuracy)
        assertQuartInOut(type, accuracy)

        assertQuintIn(type, accuracy)
        assertQuintOut(type, accuracy)
        assertQuintInOut(type, accuracy)

        assertExpoIn(type, accuracy)
        assertExpoOut(type, accuracy)
        assertExpoInOut(type, accuracy)

        assertCircIn(type, accuracy)
        assertCircOut(type, accuracy)
        assertCircInOut(type, accuracy)

        assertBackIn(type, accuracy)
        assertBackOut(type, accuracy)
        assertBackInOut(type, accuracy)

        assertElasticIn(type, accuracy)
        assertElasticOut(type, accuracy)
        assertElasticInOut(type, accuracy)

        assertBounceIn(type, accuracy)
        assertBounceOut(type, accuracy)
        assertBounceInOut(type, accuracy)
    }

    // MARK: Linear Asserts

    private func assertLinear<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.linear
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.25), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.75), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Sinusoidal Asserts

    private func assertSineIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.sineIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.07612046748871326), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.2928932188134524), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.6173165676349102), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertSineOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.sineOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.3826834323650898), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.7071067811865475), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.9238795325112867), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertSineInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.sineInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.1464466094067262), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.8535533905932737), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Cubic Asserts

    private func assertCubicIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.cubicIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.015625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.125), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.421875), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertCubicOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.cubicOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.578125), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.875), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.984375), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertCubicInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.cubicInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.0625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.9375), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Quadratic Asserts

    private func assertQuadIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quadIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.0625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.25), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.5625), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertQuadOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quadOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.4375), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.75), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.9375), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertQuadInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quadInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.125), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.875), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Quartic Asserts

    private func assertQuartIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quartIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.00390625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.0625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.31640625), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertQuartOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quartOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.68359375), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.9375), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.99609375), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertQuartInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quartInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.03125), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.96875), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Quintic Asserts

    private func assertQuintIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quintIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.0009765625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.03125), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.2373046875), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertQuintOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quintOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.7626953125), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.96875), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.9990234375), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertQuintInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.quintInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.015625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.984375), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Exponential Asserts

    private func assertExpoIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.expoIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.005524271728019903), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.03125), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.1767766952966369), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertExpoOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.expoOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.8232233047033631), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.96875), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.99447572827198), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertExpoInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.expoInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.015625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.984375), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Circular Asserts

    private func assertCircIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.circIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.031754163448145745), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.1339745962155614), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.3385621722338523), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertCircOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.circOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.6614378277661477), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.8660254037844386), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.9682458365518543), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertCircInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.circInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.0669872981077807), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.9330127018922193), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Back Asserts

    private func assertBackIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.backIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(-0.06413656250000001), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(-0.08769750000000004), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.1825903124999999), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertBackOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.backOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.8174096875000001), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(1.0876975), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(1.0641365625), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertBackInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.backInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(-0.09968184375), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(1.09968184375), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Elastic Asserts

    private func assertElasticIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.elasticIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(-0.005524271728019903), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(-0.015625000000000045), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.08838834764831845), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertElasticOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.elasticOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.9116116523516815), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(1.015625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(1.00552427172802), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertElasticInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.elasticInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.011969444423734026), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.988030555576266), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    // MARK: Bounce Asserts

    private func assertBounceIn<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.bounceIn
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.02734375), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.234375), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.52734375), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertBounceOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.bounceOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.47265625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.765625), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.97265625), accuracy: accuracy)

        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

    private func assertBounceInOut<T: FloatingPoint>(_ type: T.Type, _ accuracy: T) {
        let function: EaseFunction<T> = EaseFunctions.bounceInOut
        var value: T

        value = function(T(0), T(1), T(0.00), T(1)) // 0%
        XCTAssertEqualWithAccuracy(value, T(0), accuracy: accuracy)

        value = function(T(0), T(1), T(0.25), T(1)) // 25%
        XCTAssertEqualWithAccuracy(value, T(0.1171875), accuracy: accuracy)

        value = function(T(0), T(1), T(0.50), T(1)) // 50%
        XCTAssertEqualWithAccuracy(value, T(0.5), accuracy: accuracy)

        value = function(T(0), T(1), T(0.75), T(1)) // 75%
        XCTAssertEqualWithAccuracy(value, T(0.8828125), accuracy: accuracy)
        
        value = function(T(0), T(1), T(1.00), T(1)) // 100%
        XCTAssertEqualWithAccuracy(value, T(1.00), accuracy: accuracy)
    }

}
