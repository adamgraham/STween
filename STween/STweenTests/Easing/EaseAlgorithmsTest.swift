//
//  EaseAlgorithmsTest.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class EaseAlgorithmsTest: XCTestCase {

    // MARK: Linear Tests

    func testLinear() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.linear
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.25, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.75, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Sinusoidal Tests

    func testSineIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.sineIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.07612046748871326, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.2928932188134524, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.6173165676349102, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testSineOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.sineOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.3826834323650898, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.7071067811865475, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.9238795325112867, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testSineInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.sineInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.1464466094067262, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.8535533905932737, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Cubic Tests

    func testCubicIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.cubicIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.015625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.125, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.421875, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testCubicOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.cubicOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.578125, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.875, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.984375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testCubicInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.cubicInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.0625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.9375, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Quadratic Tests

    func testQuadIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quadIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.0625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.25, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.5625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testQuadOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quadOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.4375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.75, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.9375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testQuadInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quadInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.125, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.875, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Quartic Tests

    func testQuartIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quartIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.00390625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.0625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.31640625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testQuartOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quartOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.68359375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.9375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.99609375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testQuartInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quartInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.03125, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.96875, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Quintic Tests

    func testQuintIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quintIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.0009765625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.03125, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.2373046875, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testQuintOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quintOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.7626953125, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.96875, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.9990234375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testQuintInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.quintInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.015625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.984375, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Exponential Tests

    func testExpoIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.expoIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.005524271728019903, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.03125, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.1767766952966369, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testExpoOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.expoOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.8232233047033631, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.96875, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.99447572827198, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testExpoInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.expoInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.015625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.984375, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Circular Tests

    func testCircIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.circIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.031754163448145745, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.1339745962155614, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.3385621722338523, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testCircOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.circOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.6614378277661477, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.8660254037844386, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.9682458365518543, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testCircInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.circInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.0669872981077807, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.9330127018922193, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Back Tests

    func testBackIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.backIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, -0.06413656250000001, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, -0.08769750000000004, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.1825903124999999, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testBackOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.backOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.8174096875000001, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 1.0876975, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 1.0641365625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testBackInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.backInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, -0.09968184375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 1.09968184375, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Elastic Tests

    func testElasticIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.elasticIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, -0.005524271728019903, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, -0.015625000000000045, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.08838834764831845, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testElasticOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.elasticOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.9116116523516815, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 1.015625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 1.00552427172802, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testElasticInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.elasticInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.011969444423734026, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.988030555576266, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    // MARK: Bounce Tests

    func testBounceIn() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.bounceIn
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.02734375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.234375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.52734375, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testBounceOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.bounceOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.47265625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.765625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.97265625, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

    func testBounceInOut() {
        let algorithm: EaseAlgorithm<Double> = EaseAlgorithms.bounceInOut
        var value: Double

        value = algorithm(0.0, 1.0, 0.00, 1.0) // 0%
        XCTAssertEqualWithAccuracy(value, 0.0, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.25, 1.0) // 25%
        XCTAssertEqualWithAccuracy(value, 0.1171875, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.50, 1.0) // 50%
        XCTAssertEqualWithAccuracy(value, 0.5, accuracy: DBL_EPSILON)

        value = algorithm(0.0, 1.0, 0.75, 1.0) // 75%
        XCTAssertEqualWithAccuracy(value, 0.8828125, accuracy: DBL_EPSILON)
        
        value = algorithm(0.0, 1.0, 1.00, 1.0) // 100%
        XCTAssertEqualWithAccuracy(value, 1.00, accuracy: DBL_EPSILON)
    }

}
