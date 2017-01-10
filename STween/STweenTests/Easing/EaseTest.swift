//
//  EaseTest.swift
//  STween
//
//  Created by Adam Graham on 7/9/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class EaseTest: XCTestCase {

    // MARK: Linear Ease Tests

    func testLinearProperties() {
        XCTAssertEqual(Ease.linear.classification, EaseClassification.linear)
        XCTAssertEqual(Ease.linear.curve, EaseCurve.none)
        XCTAssertEqual(Ease.linear.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Sinusoidal Ease Tests

    func testSineInProperties() {
        XCTAssertEqual(Ease.sineIn.classification, EaseClassification.sine)
        XCTAssertEqual(Ease.sineIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.sineIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testSineOutProperties() {
        XCTAssertEqual(Ease.sineOut.classification, EaseClassification.sine)
        XCTAssertEqual(Ease.sineOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.sineOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testSineInOutProperties() {
        XCTAssertEqual(Ease.sineInOut.classification, EaseClassification.sine)
        XCTAssertEqual(Ease.sineInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.sineInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Cubic Ease Tests

    func testCubicInProperties() {
        XCTAssertEqual(Ease.cubicIn.classification, EaseClassification.cubic)
        XCTAssertEqual(Ease.cubicIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.cubicIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testCubicOutProperties() {
        XCTAssertEqual(Ease.cubicOut.classification, EaseClassification.cubic)
        XCTAssertEqual(Ease.cubicOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.cubicOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testCubicInOutProperties() {
        XCTAssertEqual(Ease.cubicInOut.classification, EaseClassification.cubic)
        XCTAssertEqual(Ease.cubicInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.cubicInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Quadratic Ease Tests

    func testQuadInProperties() {
        XCTAssertEqual(Ease.quadIn.classification, EaseClassification.quad)
        XCTAssertEqual(Ease.quadIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.quadIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testQuadOutProperties() {
        XCTAssertEqual(Ease.quadOut.classification, EaseClassification.quad)
        XCTAssertEqual(Ease.quadOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.quadOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testQuadInOutProperties() {
        XCTAssertEqual(Ease.quadInOut.classification, EaseClassification.quad)
        XCTAssertEqual(Ease.quadInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.quadInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Quartic Ease Tests

    func testQuartInProperties() {
        XCTAssertEqual(Ease.quartIn.classification, EaseClassification.quart)
        XCTAssertEqual(Ease.quartIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.quartIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testQuartOutProperties() {
        XCTAssertEqual(Ease.quartOut.classification, EaseClassification.quart)
        XCTAssertEqual(Ease.quartOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.quartOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testQuartInOutProperties() {
        XCTAssertEqual(Ease.quartInOut.classification, EaseClassification.quart)
        XCTAssertEqual(Ease.quartInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.quartInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Quintic Ease Tests

    func testQuintInProperties() {
        XCTAssertEqual(Ease.quintIn.classification, EaseClassification.quint)
        XCTAssertEqual(Ease.quintIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.quintIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testQuintOutProperties() {
        XCTAssertEqual(Ease.quintOut.classification, EaseClassification.quint)
        XCTAssertEqual(Ease.quintOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.quintOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testQuintInOutProperties() {
        XCTAssertEqual(Ease.quintInOut.classification, EaseClassification.quint)
        XCTAssertEqual(Ease.quintInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.quintInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Exponential Ease Tests

    func testExpoInProperties() {
        XCTAssertEqual(Ease.expoIn.classification, EaseClassification.expo)
        XCTAssertEqual(Ease.expoIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.expoIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testExpoOutProperties() {
        XCTAssertEqual(Ease.expoOut.classification, EaseClassification.expo)
        XCTAssertEqual(Ease.expoOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.expoOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testExpoInOutProperties() {
        XCTAssertEqual(Ease.expoInOut.classification, EaseClassification.expo)
        XCTAssertEqual(Ease.expoInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.expoInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Circular Ease Tests

    func testCircInProperties() {
        XCTAssertEqual(Ease.circIn.classification, EaseClassification.circ)
        XCTAssertEqual(Ease.circIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.circIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testCircOutProperties() {
        XCTAssertEqual(Ease.circOut.classification, EaseClassification.circ)
        XCTAssertEqual(Ease.circOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.circOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testCircInOutProperties() {
        XCTAssertEqual(Ease.circInOut.classification, EaseClassification.circ)
        XCTAssertEqual(Ease.circInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.circInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Back Ease Tests

    func testBackInProperties() {
        XCTAssertEqual(Ease.backIn.classification, EaseClassification.back)
        XCTAssertEqual(Ease.backIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.backIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testBackOutProperties() {
        XCTAssertEqual(Ease.backOut.classification, EaseClassification.back)
        XCTAssertEqual(Ease.backOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.backOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testBackInOutProperties() {
        XCTAssertEqual(Ease.backInOut.classification, EaseClassification.back)
        XCTAssertEqual(Ease.backInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.backInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Elastic Ease Tests

    func testElasticInProperties() {
        XCTAssertEqual(Ease.elasticIn.classification, EaseClassification.elastic)
        XCTAssertEqual(Ease.elasticIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.elasticIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testElasticOutProperties() {
        XCTAssertEqual(Ease.elasticOut.classification, EaseClassification.elastic)
        XCTAssertEqual(Ease.elasticOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.elasticOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testElasticInOutProperties() {
        XCTAssertEqual(Ease.elasticInOut.classification, EaseClassification.elastic)
        XCTAssertEqual(Ease.elasticInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.elasticInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    // MARK: Bounce Ease Tests

    func testBounceInProperties() {
        XCTAssertEqual(Ease.bounceIn.classification, EaseClassification.bounce)
        XCTAssertEqual(Ease.bounceIn.curve, EaseCurve.in)
        XCTAssertEqual(Ease.bounceIn.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testBounceOutProperties() {
        XCTAssertEqual(Ease.bounceOut.classification, EaseClassification.bounce)
        XCTAssertEqual(Ease.bounceOut.curve, EaseCurve.out)
        XCTAssertEqual(Ease.bounceOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

    func testBounceInOutProperties() {
        XCTAssertEqual(Ease.bounceInOut.classification, EaseClassification.bounce)
        XCTAssertEqual(Ease.bounceInOut.curve, EaseCurve.inOut)
        XCTAssertEqual(Ease.bounceInOut.interpolate(startValue: 0.0, endValue: 0.0, elapsed: 0.0, duration: 1.0), 0.0)
    }

}
