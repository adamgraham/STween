//
//  CALayer+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 1/19/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class CALayer_TweeningTest: XCTestCase {

    func testFrameTweenProperty() {
        let layer = UIView().layer
        let value = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        let property = CALayer.TweenProperty.frame(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.frame, value)
    }

    func testBoundsTweenProperty() {
        let layer = UIView().layer
        let value = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        let property = CALayer.TweenProperty.bounds(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.bounds, value)
    }

    func testPositionTweenProperty() {
        let layer = UIView().layer
        let value = CGPoint(x: 100.0, y: 100.0)
        let property = CALayer.TweenProperty.position(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.position, value)
    }

    func testZPositionTweenProperty() {
        let layer = UIView().layer
        let value = CGFloat(100.0)
        let property = CALayer.TweenProperty.zPosition(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.zPosition, value)
    }

    func testAnchorPointTweenProperty() {
        let layer = UIView().layer
        let value = CGPoint(x: 100.0, y: 100.0)
        let property = CALayer.TweenProperty.anchorPoint(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.anchorPoint, value)
    }

    func testAnchorPointZTweenProperty() {
        let layer = UIView().layer
        let value = CGFloat(100.0)
        let property = CALayer.TweenProperty.anchorPointZ(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.anchorPointZ, value)
    }

    func testTransformTweenProperty() {
        let layer = UIView().layer
        let value = CATransform3DMakeScale(0.5, 0.5, 0.5)
        let property = CALayer.TweenProperty.transform(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.transform, value)
    }

    func testSublayerTransformTweenProperty() {
        let layer = UIView().layer
        let value = CATransform3DMakeScale(0.5, 0.5, 0.5)
        let property = CALayer.TweenProperty.sublayerTransform(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.sublayerTransform, value)
    }

    func testContentsRectTweenProperty() {
        let layer = UIView().layer
        let value = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        let property = CALayer.TweenProperty.contentsRect(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.contentsRect, value)
    }

    func testContentsCenterTweenProperty() {
        let layer = UIView().layer
        let value = CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        let property = CALayer.TweenProperty.contentsCenter(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.contentsCenter, value)
    }

    @available(iOS 4.0, *)
    func testContentsScaleTweenProperty() {
        let layer = UIView().layer
        let value = CGFloat(0.5)
        let property = CALayer.TweenProperty.contentsScale(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.contentsScale, value)
    }

    func testCornerRadiusTweenProperty() {
        let layer = UIView().layer
        let value = CGFloat(5.0)
        let property = CALayer.TweenProperty.cornerRadius(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.cornerRadius, value)
    }

    func testBorderWidthTweenProperty() {
        let layer = UIView().layer
        let value = CGFloat(1.0)
        let property = CALayer.TweenProperty.borderWidth(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.borderWidth, value)
    }

    func testBorderColorTweenProperty() {
        let layer = UIView().layer
        layer.borderColor = nil
        let value = UIColor.red
        let property = CALayer.TweenProperty.borderColor(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.borderColor, value.cgColor)
    }

    func testBackgroundColorTweenProperty() {
        let layer = UIView().layer
        layer.backgroundColor = nil
        let value = UIColor.green
        let property = CALayer.TweenProperty.backgroundColor(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.backgroundColor, value.cgColor)
    }

    func testOpacityTweenProperty() {
        let layer = UIView().layer
        let value = Float(0.5)
        let property = CALayer.TweenProperty.opacity(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.opacity, value)
    }

    func testShadowColorTweenProperty() {
        let layer = UIView().layer
        layer.shadowColor = nil
        let value = UIColor.blue
        let property = CALayer.TweenProperty.shadowColor(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.shadowColor, value.cgColor)
    }

    func testShadowOpacityTweenProperty() {
        let layer = UIView().layer
        let value = Float(0.5)
        let property = CALayer.TweenProperty.shadowOpacity(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.shadowOpacity, value)
    }

    func testShadowOffsetTweenProperty() {
        let layer = UIView().layer
        let value = CGSize(width: 3.0, height: 3.0)
        let property = CALayer.TweenProperty.shadowOffset(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.shadowOffset, value)
    }

    func testShadowRadiusTweenProperty() {
        let layer = UIView().layer
        let value = CGFloat(5.0)
        let property = CALayer.TweenProperty.shadowRadius(value)
        property.animation(layer)(1.0)
        XCTAssertEqual(layer.shadowRadius, value)
    }

}
