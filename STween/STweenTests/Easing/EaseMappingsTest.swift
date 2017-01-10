//
//  EasingMappingsTest.swift
//  STween
//
//  Created by Adam Graham on 8/14/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class EasingMappingsTest: XCTestCase {

    // MARK: Ease Mapping Tests

    // Linear

    func testLinearMappings() {
        XCTAssertEqual(EaseMappings.eases[.linear]?.classification, EaseClassification.linear)
        XCTAssertEqual(EaseMappings.eases[.linear]?.curve, EaseCurve.none)
    }

    // Sinusoidal

    func testSineInMappings() {
        XCTAssertEqual(EaseMappings.eases[.sineIn]?.classification, EaseClassification.sine)
        XCTAssertEqual(EaseMappings.eases[.sineIn]?.curve, EaseCurve.in)
    }

    func testSineOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.sineOut]?.classification, EaseClassification.sine)
        XCTAssertEqual(EaseMappings.eases[.sineOut]?.curve, EaseCurve.out)
    }

    func testSineInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.sineInOut]?.classification, EaseClassification.sine)
        XCTAssertEqual(EaseMappings.eases[.sineInOut]?.curve, EaseCurve.inOut)
    }

    // Cubic

    func testCubicInMappings() {
        XCTAssertEqual(EaseMappings.eases[.cubicIn]?.classification, EaseClassification.cubic)
        XCTAssertEqual(EaseMappings.eases[.cubicIn]?.curve, EaseCurve.in)
    }

    func testCubicOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.cubicOut]?.classification, EaseClassification.cubic)
        XCTAssertEqual(EaseMappings.eases[.cubicOut]?.curve, EaseCurve.out)
    }

    func testCubicInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.cubicInOut]?.classification, EaseClassification.cubic)
        XCTAssertEqual(EaseMappings.eases[.cubicInOut]?.curve, EaseCurve.inOut)
    }

    // Quadratic

    func testQuadInMappings() {
        XCTAssertEqual(EaseMappings.eases[.quadIn]?.classification, EaseClassification.quad)
        XCTAssertEqual(EaseMappings.eases[.quadIn]?.curve, EaseCurve.in)
    }

    func testQuadOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.quadOut]?.classification, EaseClassification.quad)
        XCTAssertEqual(EaseMappings.eases[.quadOut]?.curve, EaseCurve.out)
    }

    func testQuadInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.quadInOut]?.classification, EaseClassification.quad)
        XCTAssertEqual(EaseMappings.eases[.quadInOut]?.curve, EaseCurve.inOut)
    }

    // Quartic

    func testQuartInMappings() {
        XCTAssertEqual(EaseMappings.eases[.quartIn]?.classification, EaseClassification.quart)
        XCTAssertEqual(EaseMappings.eases[.quartIn]?.curve, EaseCurve.in)
    }

    func testQuartOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.quartOut]?.classification, EaseClassification.quart)
        XCTAssertEqual(EaseMappings.eases[.quartOut]?.curve, EaseCurve.out)
    }

    func testQuartInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.quartInOut]?.classification, EaseClassification.quart)
        XCTAssertEqual(EaseMappings.eases[.quartInOut]?.curve, EaseCurve.inOut)
    }

    // Quintic

    func testQuintInMappings() {
        XCTAssertEqual(EaseMappings.eases[.quintIn]?.classification, EaseClassification.quint)
        XCTAssertEqual(EaseMappings.eases[.quintIn]?.curve, EaseCurve.in)
    }

    func testQuintOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.quintOut]?.classification, EaseClassification.quint)
        XCTAssertEqual(EaseMappings.eases[.quintOut]?.curve, EaseCurve.out)
    }

    func testQuintInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.quintInOut]?.classification, EaseClassification.quint)
        XCTAssertEqual(EaseMappings.eases[.quintInOut]?.curve, EaseCurve.inOut)
    }

    // Exponential

    func testExpoInMappings() {
        XCTAssertEqual(EaseMappings.eases[.expoIn]?.classification, EaseClassification.expo)
        XCTAssertEqual(EaseMappings.eases[.expoIn]?.curve, EaseCurve.in)
    }

    func testExpoOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.expoOut]?.classification, EaseClassification.expo)
        XCTAssertEqual(EaseMappings.eases[.expoOut]?.curve, EaseCurve.out)
    }

    func testExpoInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.expoInOut]?.classification, EaseClassification.expo)
        XCTAssertEqual(EaseMappings.eases[.expoInOut]?.curve, EaseCurve.inOut)
    }

    // Circular

    func testCircInMappings() {
        XCTAssertEqual(EaseMappings.eases[.circIn]?.classification, EaseClassification.circ)
        XCTAssertEqual(EaseMappings.eases[.circIn]?.curve, EaseCurve.in)
    }

    func testCircOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.circOut]?.classification, EaseClassification.circ)
        XCTAssertEqual(EaseMappings.eases[.circOut]?.curve, EaseCurve.out)
    }

    func testCircInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.circInOut]?.classification, EaseClassification.circ)
        XCTAssertEqual(EaseMappings.eases[.circInOut]?.curve, EaseCurve.inOut)
    }

    // Back

    func testBackInMappings() {
        XCTAssertEqual(EaseMappings.eases[.backIn]?.classification, EaseClassification.back)
        XCTAssertEqual(EaseMappings.eases[.backIn]?.curve, EaseCurve.in)
    }

    func testBackOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.backOut]?.classification, EaseClassification.back)
        XCTAssertEqual(EaseMappings.eases[.backOut]?.curve, EaseCurve.out)
    }

    func testBackInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.backInOut]?.classification, EaseClassification.back)
        XCTAssertEqual(EaseMappings.eases[.backInOut]?.curve, EaseCurve.inOut)
    }

    // Elastic

    func testElasticInMappings() {
        XCTAssertEqual(EaseMappings.eases[.elasticIn]?.classification, EaseClassification.elastic)
        XCTAssertEqual(EaseMappings.eases[.elasticIn]?.curve, EaseCurve.in)
    }

    func testElasticOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.elasticOut]?.classification, EaseClassification.elastic)
        XCTAssertEqual(EaseMappings.eases[.elasticOut]?.curve, EaseCurve.out)
    }

    func testElasticInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.elasticInOut]?.classification, EaseClassification.elastic)
        XCTAssertEqual(EaseMappings.eases[.elasticInOut]?.curve, EaseCurve.inOut)
    }

    // Bounce

    func testBounceInMappings() {
        XCTAssertEqual(EaseMappings.eases[.bounceIn]?.classification, EaseClassification.bounce)
        XCTAssertEqual(EaseMappings.eases[.bounceIn]?.curve, EaseCurve.in)
    }

    func testBounceOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.bounceOut]?.classification, EaseClassification.bounce)
        XCTAssertEqual(EaseMappings.eases[.bounceOut]?.curve, EaseCurve.out)
    }

    func testBounceInOutMappings() {
        XCTAssertEqual(EaseMappings.eases[.bounceInOut]?.classification, EaseClassification.bounce)
        XCTAssertEqual(EaseMappings.eases[.bounceInOut]?.curve, EaseCurve.inOut)
    }

    // MARK: Classification Mapping Tests

    func testLinearClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.linear]?[.in], Ease.linear)
        XCTAssertEqual(EaseMappings.classificationMappings[.linear]?[.out], Ease.linear)
        XCTAssertEqual(EaseMappings.classificationMappings[.linear]?[.inOut], Ease.linear)
        XCTAssertNil(EaseMappings.classificationMappings[.linear]?[.none])
    }

    func testSineClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.sine]?[.in], Ease.sineIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.sine]?[.out], Ease.sineOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.sine]?[.inOut], Ease.sineInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.sine]?[.none])
    }

    func testCubicClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.cubic]?[.in], Ease.cubicIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.cubic]?[.out], Ease.cubicOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.cubic]?[.inOut], Ease.cubicInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.cubic]?[.none])
    }

    func testQuadClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.quad]?[.in], Ease.quadIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.quad]?[.out], Ease.quadOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.quad]?[.inOut], Ease.quadInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.quad]?[.none])
    }

    func testQuartClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.quart]?[.in], Ease.quartIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.quart]?[.out], Ease.quartOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.quart]?[.inOut], Ease.quartInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.quart]?[.none])
    }

    func testQuintClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.quint]?[.in], Ease.quintIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.quint]?[.out], Ease.quintOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.quint]?[.inOut], Ease.quintInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.quint]?[.none])
    }

    func testExpoClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.expo]?[.in], Ease.expoIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.expo]?[.out], Ease.expoOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.expo]?[.inOut], Ease.expoInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.expo]?[.none])
    }

    func testCircClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.circ]?[.in], Ease.circIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.circ]?[.out], Ease.circOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.circ]?[.inOut], Ease.circInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.circ]?[.none])
    }

    func testBackClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.back]?[.in], Ease.backIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.back]?[.out], Ease.backOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.back]?[.inOut], Ease.backInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.back]?[.none])
    }

    func testElasticClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.elastic]?[.in], Ease.elasticIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.elastic]?[.out], Ease.elasticOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.elastic]?[.inOut], Ease.elasticInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.elastic]?[.none])
    }

    func testBounceClassificationMappings() {
        XCTAssertEqual(EaseMappings.classificationMappings[.bounce]?[.in], Ease.bounceIn)
        XCTAssertEqual(EaseMappings.classificationMappings[.bounce]?[.out], Ease.bounceOut)
        XCTAssertEqual(EaseMappings.classificationMappings[.bounce]?[.inOut], Ease.bounceInOut)
        XCTAssertNil(EaseMappings.classificationMappings[.bounce]?[.none])
    }

}
