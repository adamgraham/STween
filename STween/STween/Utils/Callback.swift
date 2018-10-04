//
//  Callback.swift
//  STween
//
//  Created by Adam Graham on 6/17/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A typealias for the method signature of a "callback" closure. Callbacks are invoked
/// upon completion of many different events, such as when a `Tween` has finished
/// animating.
public typealias Callback = () -> Void
