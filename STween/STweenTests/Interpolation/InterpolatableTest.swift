//
//  InterpolatableTest.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class InterpolatableTest: XCTestCase {

    // MARK: Custom Implementation Tests

    func testUIntInterpolation() {
        let startValue: UInt = 0
        let endValue: UInt = 10
        let middleValue: UInt = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testUInt8Interpolation() {
        let startValue: UInt8 = 0
        let endValue: UInt8 = 10
        let middleValue: UInt8 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testUInt16Interpolation() {
        let startValue: UInt16 = 0
        let endValue: UInt16 = 10
        let middleValue: UInt16 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testUInt32Interpolation() {
        let startValue: UInt32 = 0
        let endValue: UInt32 = 10
        let middleValue: UInt32 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testUInt64Interpolation() {
        let startValue: UInt64 = 0
        let endValue: UInt64 = 10
        let middleValue: UInt64 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testIntInterpolation() {
        let startValue: Int = 0
        let endValue: Int = 10
        let middleValue: Int = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testInt8Interpolation() {
        let startValue: Int8 = 0
        let endValue: Int8 = 10
        let middleValue: Int8 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testInt16Interpolation() {
        let startValue: Int16 = 0
        let endValue: Int16 = 10
        let middleValue: Int16 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testInt32Interpolation() {
        let startValue: Int32 = 0
        let endValue: Int32 = 10
        let middleValue: Int32 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testInt64Interpolation() {
        let startValue: Int64 = 0
        let endValue: Int64 = 10
        let middleValue: Int64 = 5
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testFloatInterpolation() {
        let startValue: Float = 0.0
        let endValue: Float = 10.0
        let middleValue: Float = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testFloat32Interpolation() {
        let startValue: Float32 = 0.0
        let endValue: Float32 = 10.0
        let middleValue: Float32 = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testFloat64Interpolation() {
        let startValue: Float64 = 0.0
        let endValue: Float64 = 10.0
        let middleValue: Float64 = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testFloat80Interpolation() {
        let startValue: Float80 = 0.0
        let endValue: Float80 = 10.0
        let middleValue: Float80 = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testDoubleInterpolation() {
        let startValue: Double = 0.0
        let endValue: Double = 10.0
        let middleValue: Double = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCGFloatInterpolation() {
        let startValue: CGFloat = 0.0
        let endValue: CGFloat = 10.0
        let middleValue: CGFloat = 5.0
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCGPointInterpolation() {
        let startValue = CGPoint(x: 0.0, y: 0.0)
        let endValue = CGPoint(x: 10.0, y: 10.0)
        let middleValue = CGPoint(x: 5.0, y: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCGSizeInterpolation() {
        let startValue = CGSize(width: 0.0, height: 0.0)
        let endValue = CGSize(width: 10.0, height: 10.0)
        let middleValue = CGSize(width: 5.0, height: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCGRectInterpolation() {
        let startValue = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        let endValue = CGRect(x: 10.0, y: 10.0, width: 10.0, height: 10.0)
        let middleValue = CGRect(x: 5.0, y: 5.0, width: 5.0, height: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCGVectorInterpolation() {
        let startValue = CGVector(dx: 0.0, dy: 0.0)
        let endValue = CGVector(dx: 10.0, dy: 10.0)
        let middleValue = CGVector(dx: 5.0, dy: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCGAffineTransformInterpolation() {
        let startValue = CGAffineTransform(a: 0.0, b: 0.0, c: 0.0, d: 0.0, tx: 0.0, ty: 0.0)
        let endValue = CGAffineTransform(a: 10.0, b: 10.0, c: 10.0, d: 10.0, tx: 10.0, ty: 10.0)
        let middleValue = CGAffineTransform(a: 5.0, b: 5.0, c: 5.0, d: 5.0, tx: 5.0, ty: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCGColorInterpolation() {
        let startValue = UIColor.red.cgColor
        let endValue = UIColor.blue.cgColor
        let middleValue = UIColor.purple.cgColor
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testCATransform3DInterpolation() {
        let startValue = CATransform3D(m11: 0.0, m12: 0.0, m13: 0.0, m14: 0.0,
                                       m21: 0.0, m22: 0.0, m23: 0.0, m24: 0.0,
                                       m31: 0.0, m32: 0.0, m33: 0.0, m34: 0.0,
                                       m41: 0.0, m42: 0.0, m43: 0.0, m44: 0.0)
        let endValue = CATransform3D(m11: 10.0, m12: 10.0, m13: 10.0, m14: 10.0,
                                     m21: 10.0, m22: 10.0, m23: 10.0, m24: 10.0,
                                     m31: 10.0, m32: 10.0, m33: 10.0, m34: 10.0,
                                     m41: 10.0, m42: 10.0, m43: 10.0, m44: 10.0)
        let middleValue = CATransform3D(m11: 5.0, m12: 5.0, m13: 5.0, m14: 5.0,
                                        m21: 5.0, m22: 5.0, m23: 5.0, m24: 5.0,
                                        m31: 5.0, m32: 5.0, m33: 5.0, m34: 5.0,
                                        m41: 5.0, m42: 5.0, m43: 5.0, m44: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testUIEdgeInsetsInterpolation() {
        let startValue = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        let endValue = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let middleValue = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testUIColorInterpolation() {
        let startValue = UIColor.red
        let endValue = UIColor.blue
        let middleValue = UIColor.purple
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    func testRGBAInterpolation() {
        let startValue = RGBA(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        let endValue = RGBA(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        let middleValue = RGBA(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        assertInterpolation(startValue: startValue, endValue: endValue, middleValue: middleValue)
    }

    // MARK: Assertions

    private func assertInterpolation<T: Interpolatable & Equatable>(startValue: T, endValue: T, middleValue: T) where T.InterpolationType == T {
        var interpolatedValue = T.interpolate(with: .linear, startValue: startValue, endValue: endValue, elapsed: 0.0, duration: 1.0)
        XCTAssertEqual(interpolatedValue, startValue)
        interpolatedValue = T.interpolate(with: .linear, startValue: startValue, endValue: endValue, elapsed: 0.5, duration: 1.0)
        XCTAssertEqual(interpolatedValue, middleValue)
        interpolatedValue = T.interpolate(with: .linear, startValue: startValue, endValue: endValue, elapsed: 1.0, duration: 1.0)
        XCTAssertEqual(interpolatedValue, endValue)
    }

}

extension CATransform3D: Equatable {

    public static func ==(lhs: CATransform3D, rhs: CATransform3D) -> Bool {
        return (lhs.m11 == rhs.m11) && (lhs.m12 == rhs.m12) && (lhs.m13 == rhs.m13) && (lhs.m14 == rhs.m14) &&
               (lhs.m21 == rhs.m21) && (lhs.m22 == rhs.m22) && (lhs.m23 == rhs.m23) && (lhs.m24 == rhs.m24) &&
               (lhs.m31 == rhs.m31) && (lhs.m32 == rhs.m32) && (lhs.m33 == rhs.m33) && (lhs.m34 == rhs.m34) &&
               (lhs.m41 == rhs.m41) && (lhs.m42 == rhs.m42) && (lhs.m43 == rhs.m43) && (lhs.m44 == rhs.m44)
    }

}
