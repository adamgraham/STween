//
//  TweenableProperty.swift
//  STween
//
//  Created by Adam Graham on 1/23/17.
//  Copyright © 2017 Adam Graham. All rights reserved.
//

public protocol TweenableProperty: Interpolatable {

    typealias Value = Self

    func value<T: Tweenable>(from object: T) throws -> Self
    func apply<T: Tweenable>(to object: T) throws

}
