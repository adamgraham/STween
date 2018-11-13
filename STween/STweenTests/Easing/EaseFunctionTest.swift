//
//  EaseFunctionTest.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class EaseFunctionTest: XCTestCase {

    func testFloat32() {
        assertType(Float32.self, accuracy: Float32.ulpOfOne.double)
    }

    func testFloat64() {
        assertType(Float64.self, accuracy: Float64.ulpOfOne.double)
    }

    #if arch(i386) || arch(x86_64)
    func testFloat80() {
        // using XCTAssertEqual(_, _, accuracy:) crashes with Float80
        // assertType(Float80.self, accuracy: Float80.ulpOfOne.double)
    }
    #endif

    func testCGFloat() {
        assertType(CGFloat.self, accuracy: CGFloat.ulpOfOne.double)
    }

    private func assertType<Number: InterpolatableNumber>(_ type: Number.Type, accuracy: Number) {
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

    private func assertLinear<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.linear
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.25), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.75), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Sinusoidal Asserts

    private func assertSineIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.sineIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.07612046748871326), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.2928932188134524), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.6173165676349102), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertSineOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.sineOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.3826834323650898), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.7071067811865475), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.9238795325112867), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertSineInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.sineInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.1464466094067262), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.8535533905932737), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Cubic Asserts

    private func assertCubicIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.cubicIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.015625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.125), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.421875), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertCubicOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.cubicOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.578125), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.875), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.984375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertCubicInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.cubicInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.0625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.9375), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Quadratic Asserts

    private func assertQuadIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quadIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.0625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.25), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.5625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertQuadOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quadOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.4375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.75), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.9375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertQuadInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quadInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.125), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.875), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Quartic Asserts

    private func assertQuartIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quartIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.00390625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.0625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.31640625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertQuartOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quartOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.68359375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.9375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.99609375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertQuartInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quartInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.03125), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.96875), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Quintic Asserts

    private func assertQuintIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quintIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.0009765625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.03125), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.2373046875), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertQuintOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quintOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.7626953125), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.96875), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.9990234375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertQuintInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.quintInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.015625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.984375), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Exponential Asserts

    private func assertExpoIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.expoIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.005524271728019903), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.03125), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.1767766952966369), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertExpoOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.expoOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.8232233047033631), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.96875), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.99447572827198), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertExpoInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.expoInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.015625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.984375), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Circular Asserts

    private func assertCircIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.circIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.031754163448145745), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.1339745962155614), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.3385621722338523), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertCircOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.circOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.6614378277661477), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.8660254037844386), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.9682458365518543), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertCircInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.circInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.0669872981077807), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.9330127018922193), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Back Asserts

    private func assertBackIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.backIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(-0.06413656250000001), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(-0.08769750000000004), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.1825903124999999), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertBackOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.backOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.8174096875000001), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(1.0876975), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(1.0641365625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertBackInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.backInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(-0.09968184375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(1.09968184375), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Elastic Asserts

    private func assertElasticIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.elasticIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(-0.005524271728019903), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(-0.015625000000000045), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.08838834764831845), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertElasticOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.elasticOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.9116116523516815), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(1.015625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(1.00552427172802), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertElasticInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.elasticInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.011969444423734026), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.988030555576266), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    // MARK: Bounce Asserts

    private func assertBounceIn<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.bounceIn
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.02734375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.234375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.52734375), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertBounceOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.bounceOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.47265625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.765625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.97265625), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

    private func assertBounceInOut<Number: InterpolatableNumber>(_ type: Number.Type, _ accuracy: Number) {
        let function: EaseFunction<Number>.Definition = EaseFunction.bounceInOut
        var value: Number

        value = function(Number(0), Number(1), Number(0.00), Number(1)) // 0%
        XCTAssertEqual(value, Number(0), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.25), Number(1)) // 25%
        XCTAssertEqual(value, Number(0.1171875), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.50), Number(1)) // 50%
        XCTAssertEqual(value, Number(0.5), accuracy: accuracy)

        value = function(Number(0), Number(1), Number(0.75), Number(1)) // 75%
        XCTAssertEqual(value, Number(0.8828125), accuracy: accuracy)
        
        value = function(Number(0), Number(1), Number(1.00), Number(1)) // 100%
        XCTAssertEqual(value, Number(1.00), accuracy: accuracy)
    }

}
