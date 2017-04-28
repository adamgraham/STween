//
//  TweenableTestable.swift
//  STween
//
//  Created by Adam Graham on 1/13/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

protocol TweenableTestable {

}

extension TweenableTestable {

    func assertValidInterpolation<Target: Tweenable, TargetProperty: TweenableProperty>(
        tweenable: Target, property: TargetProperty, interpolationAssert: (() -> Bool))
        where TargetProperty.TweenableType == Target, TargetProperty.Value == TargetProperty {

        let startValue = property.value(from: tweenable)
        let values = InterpolationValues(start: startValue, end: property)
        let interpolatedValue = values.interpolate(with: .linear, elapsed: 1.0, duration: 1.0)
        interpolatedValue.apply(to: tweenable)
        XCTAssertTrue(interpolationAssert())
    }

}
