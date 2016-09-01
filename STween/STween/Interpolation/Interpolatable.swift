//
//  Interpolatable.swift
//  STween
//
//  Created by Adam Graham on 7/5/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide interpolation functionality.
public protocol Interpolatable {

    /**
     The method of interpolation that determines how a value or object is
     converted or broken-down such that it can be interpolated.
     */
    static var interpolationMethod: InterpolationMethod { get }

    /**
     A class method to calculate the value between a start and end value at a 
     specific point in time.
     
     - Parameters:
        - ease: The `Ease` used to interpolate values.
        - startValue: The start value passed to the `ease` algorithm.
        - endValue: The end value passed to the `ease` algorithm.
        - elapsed: The elapsed amount of time passed to the `ease` algorithm.
        - duration: The duration of time passed to the `ease` algorithm.
     
     - Throws: `InterpolationError.valueNotConvertible` if `startValue` or
               `endValue` fails to convert to an expected type.

     - Returns: The value interpolated between the `startValue` and `endValue`.
     */
    static func interpolate(with ease: Ease,
                            startValue: InterpolationValue,
                            endValue: InterpolationValue,
                            elapsed: Foundation.TimeInterval,
                            duration: Foundation.TimeInterval) throws -> InterpolationValue

}

// MARK: - Default Implementation

extension Interpolatable {

    public static var interpolationMethod: InterpolationMethod {
        return .doubleConversion
    }

    public static final func interpolate(with ease: Ease,
                                         startValue: InterpolationValue,
                                         endValue: InterpolationValue,
                                         elapsed: Foundation.TimeInterval,
                                         duration: Foundation.TimeInterval) throws -> InterpolationValue {

        switch self.interpolationMethod {
        case .doubleConversion:
            if let startValueDouble = startValue.doubleValue {
                if let endValueDouble = endValue.doubleValue {
                    return ease.algorithm(startValueDouble, endValueDouble - startValueDouble, elapsed, duration)
                } else {
                    throw InterpolationError.valueNotConvertible(value: endValue, to: Swift.Double.self)
                }
            } else {
                throw InterpolationError.valueNotConvertible(value: startValue, to: Swift.Double.self)
            }
        case let .custom(method):
            return try method(ease, startValue, endValue, elapsed, duration)
        }
    }

}

// MARK: - Conformance

extension Swift.UInt: Interpolatable {

}

extension Swift.Int: Interpolatable {

}

extension Swift.Double: Interpolatable {

}

extension Swift.Float: Interpolatable {

}

extension CoreGraphics.CGFloat: Interpolatable {

}

extension CoreGraphics.CGPoint: Interpolatable {

    public static var interpolationMethod: InterpolationMethod {
        return .custom(method: {
            (ease: Ease,
            startValue: InterpolationValue,
            endValue: InterpolationValue,
            elapsed: Foundation.TimeInterval,
            duration: Foundation.TimeInterval) throws in

            if let _startValue = startValue as? CoreGraphics.CGPoint {
                if let _endValue = endValue as? CoreGraphics.CGPoint {

                    let algorithm = ease.algorithm

                    let interpolate: (Swift.Double, Swift.Double) -> Swift.Double = { (start, end) in
                        return algorithm(start, end - start, elapsed, duration)
                    }

                    let x = interpolate(_startValue.x.native, _endValue.x.native)
                    let y = interpolate(_startValue.y.native, _endValue.y.native)

                    return CoreGraphics.CGPoint(x: x, y: y)

                } else {
                    throw InterpolationError.valueNotConvertible(value: endValue, to: CoreGraphics.CGPoint.self)
                }
            } else {
                throw InterpolationError.valueNotConvertible(value: startValue, to: CoreGraphics.CGPoint.self)
            }
        })
    }

}

extension CoreGraphics.CGSize: Interpolatable {

    public static var interpolationMethod: InterpolationMethod {
        return .custom(method: {
            (ease: Ease,
            startValue: InterpolationValue,
            endValue: InterpolationValue,
            elapsed: Foundation.TimeInterval,
            duration: Foundation.TimeInterval) throws in

            if let _startValue = startValue as? CoreGraphics.CGSize {
                if let _endValue = endValue as? CoreGraphics.CGSize {

                    let algorithm = ease.algorithm

                    let interpolate: (Swift.Double, Swift.Double) -> Swift.Double = { (start, end) in
                        return algorithm(start, end - start, elapsed, duration)
                    }

                    let width = interpolate(_startValue.width.native, _endValue.width.native)
                    let height = interpolate(_startValue.height.native, _endValue.height.native)

                    return CoreGraphics.CGSize(width: width, height: height)

                } else {
                    throw InterpolationError.valueNotConvertible(value: endValue, to: CoreGraphics.CGSize.self)
                }
            } else {
                throw InterpolationError.valueNotConvertible(value: startValue, to: CoreGraphics.CGSize.self)
            }
        })
    }

}

extension CoreGraphics.CGRect: Interpolatable {

    public static var interpolationMethod: InterpolationMethod {
        return .custom(method: {
            (ease: Ease,
            startValue: InterpolationValue,
            endValue: InterpolationValue,
            elapsed: Foundation.TimeInterval,
            duration: Foundation.TimeInterval) throws in

            if let _startValue = startValue as? CoreGraphics.CGRect {
                if let _endValue = endValue as? CoreGraphics.CGRect {

                    let algorithm = ease.algorithm

                    let interpolate: (Swift.Double, Swift.Double) -> Swift.Double = { (start, end) in
                        return algorithm(start, end - start, elapsed, duration)
                    }

                    let x = interpolate(_startValue.midX.native, _endValue.midX.native)
                    let y = interpolate(_startValue.midY.native, _endValue.midY.native)
                    let width = interpolate(_startValue.width.native, _endValue.width.native)
                    let height = interpolate(_startValue.height.native, _endValue.height.native)

                    return CoreGraphics.CGRect(x: x, y: y, width: width, height: height)

                } else {
                    throw InterpolationError.valueNotConvertible(value: endValue, to: CoreGraphics.CGRect.self)
                }
            } else {
                throw InterpolationError.valueNotConvertible(value: startValue, to: CoreGraphics.CGRect.self)
            }
        })
    }

}
