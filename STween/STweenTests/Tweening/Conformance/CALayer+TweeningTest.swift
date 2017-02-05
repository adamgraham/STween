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
        let property = CALayer.TweenProperty.frame(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.frame == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testBoundsTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.bounds(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.bounds == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testPositionTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.position(CGPoint(x: 100.0, y: 100.0))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.position == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testZPositionTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.zPosition(100.0)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.zPosition == 100.0
        }
    }

    func testAnchorPointTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.anchorPoint(CGPoint(x: 100.0, y: 100.0))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.anchorPoint == CGPoint(x: 100.0, y: 100.0)
        }
    }

    func testAnchorPointZTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.anchorPointZ(100.0)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.anchorPointZ == 100.0
        }
    }

    func testTransformTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.transform(CATransform3DMakeScale(0.5, 0.5, 0.5))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.transform == CATransform3DMakeScale(0.5, 0.5, 0.5)
        }
    }

    func testSublayerTransformTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.sublayerTransform(CATransform3DMakeScale(0.5, 0.5, 0.5))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.sublayerTransform == CATransform3DMakeScale(0.5, 0.5, 0.5)
        }
    }

    func testContentsRectTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.contentsRect(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.contentsRect == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    func testContentsCenterTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.contentsCenter(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.contentsCenter == CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0)
        }
    }

    @available(iOS 4.0, *)
    func testContentsScaleTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.contentsScale(0.5)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.contentsScale == 0.5
        }
    }

    func testCornerRadiusTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.cornerRadius(5.0)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.cornerRadius == 5.0
        }
    }

    func testBorderWidthTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.borderWidth(1.0)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.borderWidth == 1.0
        }
    }

    func testBorderColorTweenProperty() {
        let layer = UIView().layer
        var property = CALayer.TweenProperty.borderColor(UIColor.lightGray.cgColor)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.borderColor == UIColor.lightGray.cgColor
        }
        layer.borderColor = nil
        property = CALayer.TweenProperty.borderColor(UIColor.lightGray.cgColor)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.borderColor == UIColor.lightGray.cgColor
        }
    }

    func testBackgroundColorTweenProperty() {
        let layer = UIView().layer
        var property = CALayer.TweenProperty.backgroundColor(UIColor.gray.cgColor)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.backgroundColor == UIColor.gray.cgColor
        }
        layer.backgroundColor = nil
        property = CALayer.TweenProperty.backgroundColor(UIColor.gray.cgColor)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.backgroundColor == UIColor.gray.cgColor
        }
    }

    func testOpacityTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.opacity(0.5)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.opacity == 0.5
        }
    }

    func testShadowColorTweenProperty() {
        let layer = UIView().layer
        var property = CALayer.TweenProperty.shadowColor(UIColor.darkGray.cgColor)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowColor == UIColor.darkGray.cgColor
        }
        layer.shadowColor = nil
        property = CALayer.TweenProperty.shadowColor(UIColor.darkGray.cgColor)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowColor == UIColor.darkGray.cgColor
        }
    }

    func testShadowOpacityTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.shadowOpacity(0.5)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowOpacity == 0.5
        }
    }

    func testShadowOffsetTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.shadowOffset(CGSize(width: 3.0, height: 3.0))
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowOffset == CGSize(width: 3.0, height: 3.0)
        }
    }

    func testShadowRadiusTweenProperty() {
        let layer = UIView().layer
        let property = CALayer.TweenProperty.shadowRadius(5.0)
        assertObjectNotConvertible(tweenable: layer, property: property, unexpectedTweenable: UIView())
        assertValidInterpolation(tweenable: layer, property: property) {
            return layer.shadowRadius == 5.0
        }
    }

}
