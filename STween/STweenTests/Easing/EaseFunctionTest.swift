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

    private let accuracy = Double.ulpOfOne

    // MARK: Linear

    func testLinear() {
        let function = EaseFunction.linear
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.25, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.75, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Sinusoidal

    func testSineIn() {
        let function = EaseFunction.sineIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.07612046748871326, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.2928932188134524, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.6173165676349102, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testSineOut() {
        let function = EaseFunction.sineOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.3826834323650898, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.7071067811865475, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.9238795325112867, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testSineInOut() {
        let function = EaseFunction.sineInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.1464466094067262, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.8535533905932737, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Cubic

    func testCubicIn() {
        let function = EaseFunction.cubicIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.015625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.125, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.421875, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testCubicOut() {
        let function = EaseFunction.cubicOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.578125, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.875, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.984375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testCubicInOut() {
        let function = EaseFunction.cubicInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.0625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.9375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Quadratic

    func testQuadIn() {
        let function = EaseFunction.quadIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.0625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.25, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.5625, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testQuadOut() {
        let function = EaseFunction.quadOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.4375, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.75, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.9375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testQuadInOut() {
        let function = EaseFunction.quadInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.125, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.875, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Quartic

    func testQuartIn() {
        let function = EaseFunction.quartIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.00390625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.0625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.31640625, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testQuartOut() {
        let function = EaseFunction.quartOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.68359375, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.9375, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.99609375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testQuartInOut() {
        let function = EaseFunction.quartInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.03125, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.96875, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Quintic

    func testQuintIn() {
        let function = EaseFunction.quintIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.0009765625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.03125, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.2373046875, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testQuintOut() {
        let function = EaseFunction.quintOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.7626953125, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.96875, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.9990234375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testQuintInOut() {
        let function = EaseFunction.quintInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.015625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.984375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Exponential

    func testExpoIn() {
        let function = EaseFunction.expoIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.005524271728019903, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.03125, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.1767766952966369, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testExpoOut() {
        let function = EaseFunction.expoOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.8232233047033631, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.96875, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.99447572827198, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testExpoInOut() {
        let function = EaseFunction.expoInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.015625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.984375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Circular

    func testCircIn() {
        let function = EaseFunction.circIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.031754163448145745, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.1339745962155614, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.3385621722338523, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testCircOut() {
        let function = EaseFunction.circOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.6614378277661477, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.8660254037844386, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.9682458365518543, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testCircInOut() {
        let function = EaseFunction.circInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.0669872981077807, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.9330127018922193, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Back

    func testBackIn() {
        let function = EaseFunction.backIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), -0.06413656250000001, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), -0.08769750000000004, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.1825903124999999, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testBackOut() {
        let function = EaseFunction.backOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.8174096875000001, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 1.0876975, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 1.0641365625, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testBackInOut() {
        let function = EaseFunction.backInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), -0.09968184375, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 1.09968184375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Elastic

    func testElasticIn() {
        let function = EaseFunction.elasticIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), -0.005524271728019903, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), -0.015625000000000045, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.08838834764831845, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testElasticOut() {
        let function = EaseFunction.elasticOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.9116116523516815, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 1.015625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 1.00552427172802, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testElasticInOut() {
        let function = EaseFunction.elasticInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.011969444423734026, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.988030555576266, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    // MARK: Bounce

    func testBounceIn() {
        let function = EaseFunction.bounceIn
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.02734375, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.234375, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.52734375, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testBounceOut() {
        let function = EaseFunction.bounceOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.47265625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.765625, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.97265625, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

    func testBounceInOut() {
        let function = EaseFunction.bounceInOut
        XCTAssertEqual(function(0.0), 0.0, accuracy: self.accuracy)
        XCTAssertEqual(function(0.25), 0.1171875, accuracy: self.accuracy)
        XCTAssertEqual(function(0.5), 0.5, accuracy: self.accuracy)
        XCTAssertEqual(function(0.75), 0.8828125, accuracy: self.accuracy)
        XCTAssertEqual(function(1.0), 1.0, accuracy: self.accuracy)
    }

}
