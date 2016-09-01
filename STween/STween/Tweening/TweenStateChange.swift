//
//  TweenStateChange.swift
//  STween
//
//  Created by Adam Graham on 8/27/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to describe a change of state method of a `Tween`.
public enum TweenStateChange {

    /// A case to denote a method to start a `Tween`.
    case start
    /// A case to denote a method to stop a `Tween`.
    case stop
    /// A case to denote a method to restart a `Tween`.
    case restart
    /// A case to denote a method to pause a `Tween`.
    case pause
    /// A case to denote a method to resume a `Tween`.
    case resume
    /// A case to denote a method to complete a `Tween`.
    case complete
    /// A case to denote a method to kill a `Tween`.
    case kill
    /// A case to denote a method to reset a `Tween`.
    case reset
    /// A case to denote a method to update a `Tween`.
    case update

}
