//
//  FloatRepresentableTest.swift
//  STweenTests
//
//  Created by Adam Graham on 6/30/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class FloatRepresentableTest: XCTestCase {

    // MARK: Foundation

    func testDate() {
        let date = Date(timeIntervalSince1970: 123456789.0)
        XCTAssertEqual(date.floats, [123456789.0])
        XCTAssertEqual(Date(floats: [123456789.0]).timeIntervalSince1970, date.timeIntervalSince1970)
    }

    // MARK: CoreAnimation

    func testCATransform3D() {
        let transform = CATransform3D(m11: 1.0, m12: 2.0, m13: 3.0, m14: 4.0, m21: 5.0, m22: 6.0, m23: 7.0, m24: 8.0, m31: 9.0, m32: 10.0, m33: 11.0, m34: 12.0, m41: 13.0, m42: 14.0, m43: 15.0, m44: 16.0)
        XCTAssertEqual(transform.floats, [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0])
        XCTAssertEqual(CATransform3D(floats: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0]), transform)
    }

    // MARK: CoreGraphics

    func testCGAffineTransform() {
        let transform = CGAffineTransform(a: 1.0, b: 2.0, c: 3.0, d: 4.0, tx: 5.0, ty: 6.0)
        XCTAssertEqual(transform.floats, [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
        XCTAssertEqual(CGAffineTransform(floats: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]), transform)
    }

    func testCGPoint() {
        let point = CGPoint(x: 1.0, y: 2.0)
        XCTAssertEqual(point.floats, [1.0, 2.0])
        XCTAssertEqual(CGPoint(floats: [1.0, 2.0]), point)
    }

    func testCGRect() {
        let rect = CGRect(x: 1.0, y: 2.0, width: 3.0, height: 4.0)
        XCTAssertEqual(rect.floats, [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(CGRect(floats: [1.0, 2.0, 3.0, 4.0]), rect)
    }

    func testCGSize() {
        let size = CGSize(width: 1.0, height: 2.0)
        XCTAssertEqual(size.floats, [1.0, 2.0])
        XCTAssertEqual(CGSize(floats: [1.0, 2.0]), size)
    }

    func testCGVector() {
        let vector = CGVector(dx: 1.0, dy: 2.0)
        XCTAssertEqual(vector.floats, [1.0, 2.0])
        XCTAssertEqual(CGVector(floats: [1.0, 2.0]), vector)
    }

    // MARK: UIKit

    func testUIEdgeInsets() {
        let insets = UIEdgeInsets(top: 1.0, left: 2.0, bottom: 3.0, right: 4.0)
        XCTAssertEqual(insets.floats, [1.0, 2.0, 3.0, 4.0])
        XCTAssertEqual(UIEdgeInsets(floats: [1.0, 2.0, 3.0, 4.0]), insets)
    }

    func testUIOffset() {
        let offset = UIOffset(horizontal: 1.0, vertical: 2.0)
        XCTAssertEqual(offset.floats, [1.0, 2.0])
        XCTAssertEqual(UIOffset(floats: [1.0, 2.0]), offset)
    }

}
