//
//  TweenableProperty.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to define a property that can be animated with a tween.
public protocol TweenableProperty {

    /// The `InterpolationValue` associated with `self`.
    var interpolationValue: InterpolationValue { get }

}
