//
//  TweeningError.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An enum to encapsulate errors that may arise while working with `Tween`, 
 `Tweenable`, and `TweenableProperty`.
 */
public enum TweeningError: Swift.Error {

    /**
     A case to denote an unexpected `TweenableProperty` `property`
     was found that is not `Tweenable` `on` type.
     */
    case propertyNotTweenable(property: TweenableProperty, on: Any)

}

// MARK: - CustomStringConvertible

extension TweeningError: Swift.CustomStringConvertible {

    /// A textual representation of `self`.
    public var description: Swift.String {
        switch self {
        case let .propertyNotTweenable(property, type):
            return "TweeningError.propertyNotTweenable: An unexpected \(property) was found that is not tweenable on \(type)."
        }
    }

}
