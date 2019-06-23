//
//  FloatRepresentable.swift
//  STween
//
//  Created by Adam Graham on 6/22/19.
//  Copyright © 2019 Adam Graham. All rights reserved.
//

import CoreGraphics
import Foundation
import QuartzCore
import UIKit

/// A type that can be represented and initialized by floats.
public protocol FloatRepresentable {

    typealias FloatType = CGFloat

    var floats: [FloatType] { get }

    init(floats: [FloatType])

}

// MARK: - Conformance: Foundation

/// :nodoc:
extension Date: FloatRepresentable {

    public var floats: [FloatType] {
        return [FloatType(self.timeIntervalSince1970)]
    }

    public init(floats: [FloatType]) {
        self.init(timeIntervalSince1970: TimeInterval(floats[0]))
    }

}

// MARK: - Conformance: CoreAnimation

/// :nodoc:
extension CATransform3D: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.m11, self.m12, self.m13, self.m14,
                self.m21, self.m22, self.m23, self.m24,
                self.m31, self.m32, self.m33, self.m34,
                self.m41, self.m42, self.m43, self.m44]
    }

    public init(floats: [FloatType]) {
        self.init(m11: floats[0], m12: floats[1], m13: floats[2], m14: floats[3],
                  m21: floats[4], m22: floats[5], m23: floats[6], m24: floats[7],
                  m31: floats[8], m32: floats[9], m33: floats[10], m34: floats[11],
                  m41: floats[12], m42: floats[13], m43: floats[14], m44: floats[15])
    }

}

// MARK: - Conformance: CoreGraphics

/// :nodoc:
extension CGAffineTransform: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.a, self.b, self.c, self.d,
                self.tx, self.ty]
    }

    public init(floats: [FloatType]) {
        self.init(a: floats[0], b: floats[1], c: floats[2], d: floats[3],
                  tx: floats[4], ty: floats[5])
    }

}

/// :nodoc:
extension CGPoint: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.x, self.y]
    }

    public init(floats: [FloatType]) {
        self.init(x: floats[0], y: floats[1])
    }

}

/// :nodoc:
extension CGRect: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.origin.x, self.origin.y,
                self.size.width, self.size.height]
    }

    public init(floats: [FloatType]) {
        self.init(x: floats[0], y: floats[1],
                  width: floats[2], height: floats[3])
    }

}

/// :nodoc:
extension CGSize: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.width, self.height]
    }

    public init(floats: [FloatType]) {
        self.init(width: floats[0], height: floats[1])
    }

}

/// :nodoc:
extension CGVector: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.dx, self.dy]
    }

    public init(floats: [FloatType]) {
        self.init(dx: floats[0], dy: floats[1])
    }

}

// MARK: - Conformance: UIKit

/// :nodoc:
extension UIEdgeInsets: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.top, self.left, self.bottom, self.right]
    }

    public init(floats: [FloatType]) {
        self.init(top: floats[0], left: floats[1], bottom: floats[2], right: floats[3])
    }

}

/// :nodoc:
extension UIOffset: FloatRepresentable {

    public var floats: [FloatType] {
        return [self.horizontal, self.vertical]
    }

    public init(floats: [FloatType]) {
        self.init(horizontal: floats[0], vertical: floats[1])
    }

}
