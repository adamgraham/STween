//
//  CALayer+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 1/19/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class CALayer_TweeningTest: XCTestCase, TweenableTestable {

    func testFrameTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.frame(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(of: property, on: layer)
    }

    func testBoundsTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.bounds(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(of: property, on: layer)
    }

    func testPositionTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.position(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(of: property, on: layer)
    }

    func testZPositionTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.zPosition(100.0)
        assertValidInterpolation(of: property, on: layer)
    }

    func testAnchorPointTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.anchorPoint(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(of: property, on: layer)
    }

    func testAnchorPointZTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.anchorPointZ(100.0)
        assertValidInterpolation(of: property, on: layer)
    }

    func testTransformTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.transform(CATransform3DMakeScale(0.5, 0.5, 0.5))
        assertValidInterpolation(of: property, on: layer)
    }

    func testSublayerTransformTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.sublayerTransform(CATransform3DMakeScale(0.5, 0.5, 0.5))
        assertValidInterpolation(of: property, on: layer)
    }

    func testContentsRectTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.contentsRect(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(of: property, on: layer)
    }

    func testContentsCenterTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.contentsCenter(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(of: property, on: layer)
    }

    @available(iOS 4.0, *)
    func testContentsScaleTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.contentsScale(0.5)
        assertValidInterpolation(of: property, on: layer)
    }

    func testCornerRadiusTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.cornerRadius(5.0)
        assertValidInterpolation(of: property, on: layer)
    }

    func testBorderWidthTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.borderWidth(1.0)
        assertValidInterpolation(of: property, on: layer)
    }

    func testBorderColorTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.borderColor(UIColor.lightGray.cgColor)
        assertValidInterpolation(of: property, on: layer)
        layer.borderColor = nil
        assertValidInterpolation(of: property, on: layer)
    }

    func testBackgroundColorTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.backgroundColor(UIColor.gray.cgColor)
        assertValidInterpolation(of: property, on: layer)
        layer.backgroundColor = nil
        assertValidInterpolation(of: property, on: layer)
    }

    func testOpacityTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.opacity(0.5)
        assertValidInterpolation(of: property, on: layer)
    }

    func testShadowColorTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.shadowColor(UIColor.darkGray.cgColor)
        assertValidInterpolation(of: property, on: layer)
        layer.shadowColor = nil
        assertValidInterpolation(of: property, on: layer)
    }

    func testShadowOpacityTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.shadowOpacity(0.5)
        assertValidInterpolation(of: property, on: layer)
    }

    func testShadowOffsetTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.shadowOffset(CGSize(width: 3.0, height: 3.0))
        assertValidInterpolation(of: property, on: layer)
    }

    func testShadowRadiusTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.shadowRadius(5.0)
        assertValidInterpolation(of: property, on: layer)
    }

    func testInvalidInterpolation() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.borderWidth(1.0)
        let otherProperty = CALayerTweenProperty.borderColor(UIColor.white.cgColor)
        assertInvalidInterpolation(of: property, to: otherProperty, on: layer)
    }

}
