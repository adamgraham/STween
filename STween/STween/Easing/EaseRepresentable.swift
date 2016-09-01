//
//  EaseRepresentable.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to represent a type with easing properties.
public protocol EaseRepresentable {

    /// The `Ease` represented by `self`.
    var ease: Ease { get }

}
