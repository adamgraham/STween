//
//  EaseClassificationTest.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class EaseClassificationTest: XCTestCase {

    func testLinearProperties() {
        XCTAssertEqual(EaseClassification.linear.in, Ease.linear)
        XCTAssertEqual(EaseClassification.linear.out, Ease.linear)
        XCTAssertEqual(EaseClassification.linear.inOut, Ease.linear)
    }

    func testSineProperties() {
        XCTAssertEqual(EaseClassification.sine.in, Ease.sineIn)
        XCTAssertEqual(EaseClassification.sine.out, Ease.sineOut)
        XCTAssertEqual(EaseClassification.sine.inOut, Ease.sineInOut)
    }

    func testCubicProperties() {
        XCTAssertEqual(EaseClassification.cubic.in, Ease.cubicIn)
        XCTAssertEqual(EaseClassification.cubic.out, Ease.cubicOut)
        XCTAssertEqual(EaseClassification.cubic.inOut, Ease.cubicInOut)
    }

    func testQuadProperties() {
        XCTAssertEqual(EaseClassification.quad.in, Ease.quadIn)
        XCTAssertEqual(EaseClassification.quad.out, Ease.quadOut)
        XCTAssertEqual(EaseClassification.quad.inOut, Ease.quadInOut)
    }

    func testQuartProperties() {
        XCTAssertEqual(EaseClassification.quart.in, Ease.quartIn)
        XCTAssertEqual(EaseClassification.quart.out, Ease.quartOut)
        XCTAssertEqual(EaseClassification.quart.inOut, Ease.quartInOut)
    }

    func testQuintProperties() {
        XCTAssertEqual(EaseClassification.quint.in, Ease.quintIn)
        XCTAssertEqual(EaseClassification.quint.out, Ease.quintOut)
        XCTAssertEqual(EaseClassification.quint.inOut, Ease.quintInOut)
    }

    func testExpoProperties() {
        XCTAssertEqual(EaseClassification.expo.in, Ease.expoIn)
        XCTAssertEqual(EaseClassification.expo.out, Ease.expoOut)
        XCTAssertEqual(EaseClassification.expo.inOut, Ease.expoInOut)
    }

    func testCircProperties() {
        XCTAssertEqual(EaseClassification.circ.in, Ease.circIn)
        XCTAssertEqual(EaseClassification.circ.out, Ease.circOut)
        XCTAssertEqual(EaseClassification.circ.inOut, Ease.circInOut)
    }

    func testBackProperties() {
        XCTAssertEqual(EaseClassification.back.in, Ease.backIn)
        XCTAssertEqual(EaseClassification.back.out, Ease.backOut)
        XCTAssertEqual(EaseClassification.back.inOut, Ease.backInOut)
    }

    func testElasticProperties() {
        XCTAssertEqual(EaseClassification.elastic.in, Ease.elasticIn)
        XCTAssertEqual(EaseClassification.elastic.out, Ease.elasticOut)
        XCTAssertEqual(EaseClassification.elastic.inOut, Ease.elasticInOut)
    }

    func testBounceProperties() {
        XCTAssertEqual(EaseClassification.bounce.in, Ease.bounceIn)
        XCTAssertEqual(EaseClassification.bounce.out, Ease.bounceOut)
        XCTAssertEqual(EaseClassification.bounce.inOut, Ease.bounceInOut)
    }

}
