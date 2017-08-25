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

    func assertValidInterpolation<TargetProperty: TweenableProperty>(
        of property: TargetProperty, on target: TargetProperty.Target, interpolationAssert: (() -> Bool)) {
        
        let startValue = property.value(from: target)
        let values = InterpolationValues(start: startValue, end: property)
        let interpolatedValue = values.interpolate(with: .linear, elapsed: 1.0, duration: 1.0)
        interpolatedValue.apply(to: target)
        XCTAssertTrue(interpolationAssert())
    }

}
