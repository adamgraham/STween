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

    // MARK: Assertions

    private func assertInterpolation<T: Interpolatable>(_ start: T, _ end: T, _ middle: T) where T.Value == T {
        var interpolatedValue = T.interpolate(from: start, to: end, with: .linear, elapsed: 0.0, duration: 1.0)
        XCTAssertEqual(interpolatedValue, start)
        interpolatedValue = T.interpolate(from: start, to: end, with: .linear, elapsed: 0.5, duration: 1.0)
        XCTAssertEqual(interpolatedValue, middle)
        interpolatedValue = T.interpolate(from: start, to: end, with: .linear, elapsed: 1.0, duration: 1.0)
        XCTAssertEqual(interpolatedValue, end)
    }

    private func assertInterpolation<T: Interpolatable>(_ start: T, _ end: T, _ middle: T, _ isEqual: (_ lhs: T, _ rhs: T) -> Bool) where T.Value == T {
        var interpolatedValue = T.interpolate(from: start, to: end, with: .linear, elapsed: 0.0, duration: 1.0)
        XCTAssertTrue(isEqual(interpolatedValue, start))
        interpolatedValue = T.interpolate(from: start, to: end, with: .linear, elapsed: 0.5, duration: 1.0)
        XCTAssertTrue(isEqual(interpolatedValue, middle))
        interpolatedValue = T.interpolate(from: start, to: end, with: .linear, elapsed: 1.0, duration: 1.0)
        XCTAssertTrue(isEqual(interpolatedValue, end))
    }

    // MARK: Swift Tests

    func testUInt() {
        let start: UInt = 0
        let end: UInt = 10
        let middle: UInt = 5
        assertInterpolation(start, end, middle)
    }

    func testUInt8() {
        let start: UInt8 = 0
        let end: UInt8 = 10
        let middle: UInt8 = 5
        assertInterpolation(start, end, middle)
    }

    func testUInt16() {
        let start: UInt16 = 0
        let end: UInt16 = 10
        let middle: UInt16 = 5
        assertInterpolation(start, end, middle)
    }

    func testUInt32() {
        let start: UInt32 = 0
        let end: UInt32 = 10
        let middle: UInt32 = 5
        assertInterpolation(start, end, middle)
    }

    func testUInt64() {
        let start: UInt64 = 0
        let end: UInt64 = 10
        let middle: UInt64 = 5
        assertInterpolation(start, end, middle)
    }

    func testInt() {
        let start: Int = 0
        let end: Int = 10
        let middle: Int = 5
        assertInterpolation(start, end, middle)
    }

    func testInt8() {
        let start: Int8 = 0
        let end: Int8 = 10
        let middle: Int8 = 5
        assertInterpolation(start, end, middle)
    }

    func testInt16() {
        let start: Int16 = 0
        let end: Int16 = 10
        let middle: Int16 = 5
        assertInterpolation(start, end, middle)
    }

    func testInt32() {
        let start: Int32 = 0
        let end: Int32 = 10
        let middle: Int32 = 5
        assertInterpolation(start, end, middle)
    }

    func testInt64() {
        let start: Int64 = 0
        let end: Int64 = 10
        let middle: Int64 = 5
        assertInterpolation(start, end, middle)
    }

    func testFloat() {
        let start: Float = 0.0
        let end: Float = 10.0
        let middle: Float = 5.0
        assertInterpolation(start, end, middle)
    }

    func testFloat32() {
        let start: Float32 = 0.0
        let end: Float32 = 10.0
        let middle: Float32 = 5.0
        assertInterpolation(start, end, middle)
    }

    func testFloat64() {
        let start: Float64 = 0.0
        let end: Float64 = 10.0
        let middle: Float64 = 5.0
        assertInterpolation(start, end, middle)
    }

    #if arch(i386) || arch(x86_64)
    func testFloat80() {
        let start: Float80 = 0.0
        let end: Float80 = 10.0
        let middle: Float80 = 5.0
        assertInterpolation(start, end, middle)
    }
    #endif

    func testDouble() {
        let start: Double = 0.0
        let end: Double = 10.0
        let middle: Double = 5.0
        assertInterpolation(start, end, middle)
    }

    func testDate() {
        let start = Date(timeIntervalSince1970: 0.0)
        let end = Date(timeIntervalSince1970: 10.0)
        let middle = Date(timeIntervalSince1970: 5.0)
        assertInterpolation(start, end, middle)
    }

    // MARK: CoreAnimation Tests

    func testCATransform3D() {
        let start = CATransform3D(m11: 0.0, m12: 0.0, m13: 0.0, m14: 0.0,
                                       m21: 0.0, m22: 0.0, m23: 0.0, m24: 0.0,
                                       m31: 0.0, m32: 0.0, m33: 0.0, m34: 0.0,
                                       m41: 0.0, m42: 0.0, m43: 0.0, m44: 0.0)
        let end = CATransform3D(m11: 10.0, m12: 10.0, m13: 10.0, m14: 10.0,
                                     m21: 10.0, m22: 10.0, m23: 10.0, m24: 10.0,
                                     m31: 10.0, m32: 10.0, m33: 10.0, m34: 10.0,
                                     m41: 10.0, m42: 10.0, m43: 10.0, m44: 10.0)
        let middle = CATransform3D(m11: 5.0, m12: 5.0, m13: 5.0, m14: 5.0,
                                        m21: 5.0, m22: 5.0, m23: 5.0, m24: 5.0,
                                        m31: 5.0, m32: 5.0, m33: 5.0, m34: 5.0,
                                        m41: 5.0, m42: 5.0, m43: 5.0, m44: 5.0)
        assertInterpolation(start, end, middle) {
            return $0 == $1
        }
    }

    func testCATransform3DEquatable() {
        let a = CATransform3D(m11: 10.0, m12: 10.0, m13: 10.0, m14: 10.0,
                              m21: 10.0, m22: 10.0, m23: 10.0, m24: 10.0,
                              m31: 10.0, m32: 10.0, m33: 10.0, m34: 10.0,
                              m41: 10.0, m42: 10.0, m43: 10.0, m44: 10.0)
        let b = CATransform3D(m11: 10.0, m12: 10.0, m13: 10.0, m14: 10.0,
                              m21: 10.0, m22: 10.0, m23: 10.0, m24: 10.0,
                              m31: 10.0, m32: 10.0, m33: 10.0, m34: 10.0,
                              m41: 10.0, m42: 10.0, m43: 10.0, m44: 10.0)
        let c = CATransform3D(m11: 0.0, m12: 0.0, m13: 0.0, m14: 0.0,
                              m21: 0.0, m22: 0.0, m23: 0.0, m24: 0.0,
                              m31: 0.0, m32: 0.0, m33: 0.0, m34: 0.0,
                              m41: 0.0, m42: 0.0, m43: 0.0, m44: 0.0)

        XCTAssertEqual(a, a)
        XCTAssertEqual(a, b)
        XCTAssertNotEqual(a, c)
        XCTAssertEqual(b, a)
        XCTAssertEqual(b, b)
        XCTAssertNotEqual(b, c)
        XCTAssertNotEqual(c, a)
        XCTAssertNotEqual(c, b)
        XCTAssertEqual(c, c)
    }

    // MARK: CoreGraphics Tests

    func testCGAffineTransform() {
        let start = CGAffineTransform(a: 0.0, b: 0.0, c: 0.0, d: 0.0, tx: 0.0, ty: 0.0)
        let end = CGAffineTransform(a: 10.0, b: 10.0, c: 10.0, d: 10.0, tx: 10.0, ty: 10.0)
        let middle = CGAffineTransform(a: 5.0, b: 5.0, c: 5.0, d: 5.0, tx: 5.0, ty: 5.0)
        assertInterpolation(start, end, middle)
    }

    func testCGColor() {
        let start = UIColor.red.cgColor
        let end = UIColor.blue.cgColor
        let middle = UIColor.purple.cgColor
        assertInterpolation(start, end, middle)
    }

    func testCGFloat() {
        let start: CGFloat = 0.0
        let end: CGFloat = 10.0
        let middle: CGFloat = 5.0
        assertInterpolation(start, end, middle)
    }

    func testCGPoint() {
        let start = CGPoint(x: 0.0, y: 0.0)
        let end = CGPoint(x: 10.0, y: 10.0)
        let middle = CGPoint(x: 5.0, y: 5.0)
        assertInterpolation(start, end, middle)
    }

    func testCGRect() {
        let start = CGRect(x: 0.0, y: 0.0, width: 0.0, height: 0.0)
        let end = CGRect(x: 10.0, y: 10.0, width: 10.0, height: 10.0)
        let middle = CGRect(x: 5.0, y: 5.0, width: 5.0, height: 5.0)
        assertInterpolation(start, end, middle)
    }

    func testCGSize() {
        let start = CGSize(width: 0.0, height: 0.0)
        let end = CGSize(width: 10.0, height: 10.0)
        let middle = CGSize(width: 5.0, height: 5.0)
        assertInterpolation(start, end, middle)
    }

    func testCGVector() {
        let start = CGVector(dx: 0.0, dy: 0.0)
        let end = CGVector(dx: 10.0, dy: 10.0)
        let middle = CGVector(dx: 5.0, dy: 5.0)
        assertInterpolation(start, end, middle)
    }

    // MARK: CoreImage Tests

    func testCIColor() {
        let start = CIColor(color: UIColor.red)
        let end = CIColor(color: UIColor.blue)
        let middle = CIColor(color: UIColor.purple)
        assertInterpolation(start, end, middle) {
            return $0 == $1
        }
    }

    func testCIVector() {
        let start = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        let end = CIVector(x: 10.0, y: 10.0, z: 10.0, w: 1.0)
        let middle = CIVector(x: 5.0, y: 5.0, z: 5.0, w: 1.0)
        assertInterpolation(start, end, middle)
    }

    // MARK: UIKit Tests

    func testUIColor() {
        let start = UIColor.red
        let end = UIColor.blue
        let middle = UIColor.purple
        assertInterpolation(start, end, middle)
    }

    func testUIEdgeInsets() {
        let start = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
        let end = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)
        let middle = UIEdgeInsets(top: 5.0, left: 5.0, bottom: 5.0, right: 5.0)
        assertInterpolation(start, end, middle)
    }

    func testUIOffset() {
        let start = UIOffset(horizontal: 0.0, vertical: 0.0)
        let end = UIOffset(horizontal: 10.0, vertical: 10.0)
        let middle = UIOffset(horizontal: 5.0, vertical: 5.0)
        assertInterpolation(start, end, middle)
    }

}

// MARK: - Equatable Helpers

extension CATransform3D {

    internal static func ==(lhs: CATransform3D, rhs: CATransform3D) -> Bool {
        return (lhs.m11 == rhs.m11) && (lhs.m12 == rhs.m12) && (lhs.m13 == rhs.m13) && (lhs.m14 == rhs.m14) &&
               (lhs.m21 == rhs.m21) && (lhs.m22 == rhs.m22) && (lhs.m23 == rhs.m23) && (lhs.m24 == rhs.m24) &&
               (lhs.m31 == rhs.m31) && (lhs.m32 == rhs.m32) && (lhs.m33 == rhs.m33) && (lhs.m34 == rhs.m34) &&
               (lhs.m41 == rhs.m41) && (lhs.m42 == rhs.m42) && (lhs.m43 == rhs.m43) && (lhs.m44 == rhs.m44)
    }

}

extension CIColor {

    internal static func ==(lhs: CIColor, rhs: CIColor) -> Bool {
        return lhs.red == rhs.red &&
               lhs.green == rhs.green &&
               lhs.blue == rhs.blue &&
               lhs.alpha == rhs.alpha
    }

}
