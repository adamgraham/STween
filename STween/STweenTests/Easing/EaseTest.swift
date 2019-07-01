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

    // MARK: Linear

    func testLinear() {
        XCTAssertEqual(Ease.linear.classification, EaseClassification.linear)
        XCTAssertEqual(Ease.linear.curve, EaseCurve.none)
    }

    // MARK: Sinusoidal

    func testSineIn() {
        XCTAssertEqual(Ease.sineIn.classification, EaseClassification.sine)
        XCTAssertEqual(Ease.sineIn.curve, EaseCurve.in)
    }

    func testSineOut() {
        XCTAssertEqual(Ease.sineOut.classification, EaseClassification.sine)
        XCTAssertEqual(Ease.sineOut.curve, EaseCurve.out)
    }

    func testSineInOut() {
        XCTAssertEqual(Ease.sineInOut.classification, EaseClassification.sine)
        XCTAssertEqual(Ease.sineInOut.curve, EaseCurve.inOut)
    }

    // MARK: Cubic

    func testCubicIn() {
        XCTAssertEqual(Ease.cubicIn.classification, EaseClassification.cubic)
        XCTAssertEqual(Ease.cubicIn.curve, EaseCurve.in)
    }

    func testCubicOut() {
        XCTAssertEqual(Ease.cubicOut.classification, EaseClassification.cubic)
        XCTAssertEqual(Ease.cubicOut.curve, EaseCurve.out)
    }

    func testCubicInOut() {
        XCTAssertEqual(Ease.cubicInOut.classification, EaseClassification.cubic)
        XCTAssertEqual(Ease.cubicInOut.curve, EaseCurve.inOut)
    }

    // MARK: Quadratic

    func testQuadIn() {
        XCTAssertEqual(Ease.quadIn.classification, EaseClassification.quad)
        XCTAssertEqual(Ease.quadIn.curve, EaseCurve.in)
    }

    func testQuadOut() {
        XCTAssertEqual(Ease.quadOut.classification, EaseClassification.quad)
        XCTAssertEqual(Ease.quadOut.curve, EaseCurve.out)
    }

    func testQuadInOut() {
        XCTAssertEqual(Ease.quadInOut.classification, EaseClassification.quad)
        XCTAssertEqual(Ease.quadInOut.curve, EaseCurve.inOut)
    }

    // MARK: Quartic

    func testQuartIn() {
        XCTAssertEqual(Ease.quartIn.classification, EaseClassification.quart)
        XCTAssertEqual(Ease.quartIn.curve, EaseCurve.in)
    }

    func testQuartOut() {
        XCTAssertEqual(Ease.quartOut.classification, EaseClassification.quart)
        XCTAssertEqual(Ease.quartOut.curve, EaseCurve.out)
    }

    func testQuartInOut() {
        XCTAssertEqual(Ease.quartInOut.classification, EaseClassification.quart)
        XCTAssertEqual(Ease.quartInOut.curve, EaseCurve.inOut)
    }

    // MARK: Quintic

    func testQuintIn() {
        XCTAssertEqual(Ease.quintIn.classification, EaseClassification.quint)
        XCTAssertEqual(Ease.quintIn.curve, EaseCurve.in)
    }

    func testQuintOut() {
        XCTAssertEqual(Ease.quintOut.classification, EaseClassification.quint)
        XCTAssertEqual(Ease.quintOut.curve, EaseCurve.out)
    }

    func testQuintInOut() {
        XCTAssertEqual(Ease.quintInOut.classification, EaseClassification.quint)
        XCTAssertEqual(Ease.quintInOut.curve, EaseCurve.inOut)
    }

    // MARK: Exponential

    func testExpoIn() {
        XCTAssertEqual(Ease.expoIn.classification, EaseClassification.expo)
        XCTAssertEqual(Ease.expoIn.curve, EaseCurve.in)
    }

    func testExpoOut() {
        XCTAssertEqual(Ease.expoOut.classification, EaseClassification.expo)
        XCTAssertEqual(Ease.expoOut.curve, EaseCurve.out)
    }

    func testExpoInOut() {
        XCTAssertEqual(Ease.expoInOut.classification, EaseClassification.expo)
        XCTAssertEqual(Ease.expoInOut.curve, EaseCurve.inOut)
    }

    // MARK: Circular

    func testCircIn() {
        XCTAssertEqual(Ease.circIn.classification, EaseClassification.circ)
        XCTAssertEqual(Ease.circIn.curve, EaseCurve.in)
    }

    func testCircOut() {
        XCTAssertEqual(Ease.circOut.classification, EaseClassification.circ)
        XCTAssertEqual(Ease.circOut.curve, EaseCurve.out)
    }

    func testCircInOut() {
        XCTAssertEqual(Ease.circInOut.classification, EaseClassification.circ)
        XCTAssertEqual(Ease.circInOut.curve, EaseCurve.inOut)
    }

    // MARK: Back

    func testBackIn() {
        XCTAssertEqual(Ease.backIn.classification, EaseClassification.back)
        XCTAssertEqual(Ease.backIn.curve, EaseCurve.in)
    }

    func testBackOut() {
        XCTAssertEqual(Ease.backOut.classification, EaseClassification.back)
        XCTAssertEqual(Ease.backOut.curve, EaseCurve.out)
    }

    func testBackInOut() {
        XCTAssertEqual(Ease.backInOut.classification, EaseClassification.back)
        XCTAssertEqual(Ease.backInOut.curve, EaseCurve.inOut)
    }

    // MARK: Elastic

    func testElasticIn() {
        XCTAssertEqual(Ease.elasticIn.classification, EaseClassification.elastic)
        XCTAssertEqual(Ease.elasticIn.curve, EaseCurve.in)
    }

    func testElasticOut() {
        XCTAssertEqual(Ease.elasticOut.classification, EaseClassification.elastic)
        XCTAssertEqual(Ease.elasticOut.curve, EaseCurve.out)
    }

    func testElasticInOut() {
        XCTAssertEqual(Ease.elasticInOut.classification, EaseClassification.elastic)
        XCTAssertEqual(Ease.elasticInOut.curve, EaseCurve.inOut)
    }

    // MARK: Bounce

    func testBounceIn() {
        XCTAssertEqual(Ease.bounceIn.classification, EaseClassification.bounce)
        XCTAssertEqual(Ease.bounceIn.curve, EaseCurve.in)
    }

    func testBounceOut() {
        XCTAssertEqual(Ease.bounceOut.classification, EaseClassification.bounce)
        XCTAssertEqual(Ease.bounceOut.curve, EaseCurve.out)
    }

    func testBounceInOut() {
        XCTAssertEqual(Ease.bounceInOut.classification, EaseClassification.bounce)
        XCTAssertEqual(Ease.bounceInOut.curve, EaseCurve.inOut)
    }

    // MARK: Custom

    func testCustom() {
        let ease = Ease.custom(function: { return $0 })
        XCTAssertEqual(ease.classification, .custom)
        XCTAssertEqual(ease.curve, .custom)
    }

    // MARK: Equatable

    func testEquatable() {
        var ease = Ease(classification: .quad, curve: .in, function: { return $0 })
        XCTAssertEqual(ease, .quadIn)

        ease = Ease(classification: .cubic, curve: .in, function: { return $0 })
        XCTAssertNotEqual(ease, .quadIn)

        ease = Ease(classification: .quad, curve: .out, function: { return $0 })
        XCTAssertNotEqual(ease, .quadIn)

        ease = Ease(classification: .custom, curve: .in, function: { return $0 })
        XCTAssertNotEqual(ease, .quadIn)

        ease = Ease(classification: .quad, curve: .custom, function: { return $0 })
        XCTAssertNotEqual(ease, .quadIn)

        ease = Ease(classification: .custom, curve: .custom, function: { return $0 })
        XCTAssertNotEqual(ease, Ease.custom(function: { return $0 }))
    }

}
