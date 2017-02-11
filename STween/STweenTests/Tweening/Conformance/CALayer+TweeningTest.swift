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
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.frame == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testBoundsTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.bounds(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.bounds == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testPositionTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.position(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.position == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testZPositionTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.zPosition(100.0)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.zPosition == 100.0
        }
    }

    func testAnchorPointTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.anchorPoint(CGPoint(x: 100.0, y: 100.0))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.anchorPoint == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testAnchorPointZTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.anchorPointZ(100.0)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.anchorPointZ == 100.0
        }
    }

    func testTransformTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.transform(CATransform3DMakeScale(0.5, 0.5, 0.5))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.transform == CATransform3DMakeScale(0.5, 0.5, 0.5)
        }
    }

    func testSublayerTransformTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.sublayerTransform(CATransform3DMakeScale(0.5, 0.5, 0.5))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.sublayerTransform == CATransform3DMakeScale(0.5, 0.5, 0.5)
        }
    }

    func testContentsRectTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.contentsRect(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.contentsRect == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testContentsCenterTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.contentsCenter(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.contentsCenter == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    @available(iOS 4.0, *)
    func testContentsScaleTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.contentsScale(0.5)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.contentsScale == 0.5
        }
    }

    func testCornerRadiusTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.cornerRadius(5.0)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.cornerRadius == 5.0
        }
    }

    func testBorderWidthTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.borderWidth(1.0)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.borderWidth == 1.0
        }
    }

    func testBorderColorTweenProperty() {
        let layer = UIView().layer
        var property = CALayerTweenProperty.borderColor(UIColor.lightGray.cgColor)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.borderColor == UIColor.lightGray.cgColor
        }

        layer.borderColor = nil
        property = CALayerTweenProperty.borderColor(UIColor.lightGray.cgColor)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.borderColor == UIColor.lightGray.cgColor
        }
    }

    func testBackgroundColorTweenProperty() {
        let layer = UIView().layer
        var property = CALayerTweenProperty.backgroundColor(UIColor.gray.cgColor)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.backgroundColor == UIColor.gray.cgColor
        }

        layer.backgroundColor = nil
        property = CALayerTweenProperty.backgroundColor(UIColor.gray.cgColor)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.backgroundColor == UIColor.gray.cgColor
        }
    }

    func testOpacityTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.opacity(0.5)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.opacity == 0.5
        }
    }

    func testShadowColorTweenProperty() {
        let layer = UIView().layer
        var property = CALayerTweenProperty.shadowColor(UIColor.darkGray.cgColor)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowColor == UIColor.darkGray.cgColor
        }

        layer.shadowColor = nil
        property = CALayerTweenProperty.shadowColor(UIColor.darkGray.cgColor)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowColor == UIColor.darkGray.cgColor
        }
    }

    func testShadowOpacityTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.shadowOpacity(0.5)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowOpacity == 0.5
        }
    }

    func testShadowOffsetTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.shadowOffset(CGSize(width: 3.0, height: 3.0))
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowOffset == CGSize(width: 3.0, height: 3.0)
        }
    }

    func testShadowRadiusTweenProperty() {
        let layer = UIView().layer
        let property = CALayerTweenProperty.shadowRadius(5.0)
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowRadius == 5.0
        }
    }

}
