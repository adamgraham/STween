//
//  UIView+TweeningTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class UIView_TweeningTest: XCTestCase {

    func testXTweenableProperty() {
        let property = UIView.TweenProperty.x(100.0)
        XCTAssertEqual(property.associatedValue as? CGFloat, 100.0)

        let view = UIView()
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(0.0))
        try? view.tweenableValue(set: property, newValue: CGFloat(100.0))
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(100.0))
    }

    func testYTweenableProperty() {
        let property = UIView.TweenProperty.y(100.0)
        XCTAssertEqual(property.associatedValue as? CGFloat, 100.0)

        let view = UIView()
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(0.0))
        try? view.tweenableValue(set: property, newValue: CGFloat(100.0))
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(100.0))
    }

    func testWidthTweenableProperty() {
        let property = UIView.TweenProperty.width(100.0)
        XCTAssertEqual(property.associatedValue as? CGFloat, 100.0)

        let view = UIView()
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(0.0))
        try? view.tweenableValue(set: property, newValue: CGFloat(100.0))
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(100.0))
    }

    func testHeightTweenableProperty() {
        let property = UIView.TweenProperty.height(100.0)
        XCTAssertEqual(property.associatedValue as? CGFloat, 100.0)

        let view = UIView()
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(0.0))
        try? view.tweenableValue(set: property, newValue: CGFloat(100.0))
        XCTAssertEqual(view.tweenableValue(get: property) as? CGFloat, CGFloat(100.0))
    }

    func testOriginTweenableProperty() {
        let property = UIView.TweenProperty.origin(CGPoint(x: 100.0, y: 100.0))
        XCTAssertEqual(property.associatedValue as? CGPoint, CGPoint(x: 100.0, y: 100.0))

        let view = UIView()
        XCTAssertEqual(view.tweenableValue(get: property) as? CGPoint, CGPoint.zero)
        try? view.tweenableValue(set: property, newValue: CGPoint(x: 100.0, y: 100.0))
        XCTAssertEqual(view.tweenableValue(get: property) as? CGPoint, CGPoint(x: 100.0, y: 100.0))
    }

    func testSizeTweenableProperty() {
        let property = UIView.TweenProperty.size(CGSize(width: 100.0, height: 100.0))
        XCTAssertEqual(property.associatedValue as? CGSize, CGSize(width: 100.0, height: 100.0))

        let view = UIView()
        XCTAssertEqual(view.tweenableValue(get: property) as? CGSize, CGSize.zero)
        try? view.tweenableValue(set: property, newValue: CGSize(width: 100.0, height: 100.0))
        XCTAssertEqual(view.tweenableValue(get: property) as? CGSize, CGSize(width: 100.0, height: 100.0))
    }

    func testFrameTweenableProperty() {
        let property = UIView.TweenProperty.frame(CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        XCTAssertEqual(property.associatedValue as? CGRect, CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))

        let view = UIView()
        XCTAssertEqual(view.tweenableValue(get: property) as? CGRect, CGRect.zero)
        try? view.tweenableValue(set: property, newValue: CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
        XCTAssertEqual(view.tweenableValue(get: property) as? CGRect, CGRect(x: 100.0, y: 100.0, width: 100.0, height: 100.0))
    }

}
