//
//  Tween+Chaining.swift
//  STween
//
//  Created by Adam Graham on 6/20/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/**
 Provides method chaining to a tween. This allows multiple properties to be assigned in
 a single statement without requiring a variable to store the intermediate results.

 ```
 view.tween(to: .width(100.0), duration: 1.0)
    .ease(.backOut)
    .delay(0.5)
    .onComplete({ ... })
 ```
 */
public extension Tween {

    // MARK: Chaining Methods

    /// A method chain to assign a value to the `ease` property of the tween.
    /// - parameter value: The `Ease` value to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func ease(_ value: Ease) -> Tween {
        self.ease = value
        return self
    }

    /// A method chain to assign a value to the `delay` property of the tween.
    /// - parameter value: The amount of seconds to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func delay(_ value: TimeInterval) -> Tween {
        self.delay = value
        return self
    }

    /// A method chain to assign a value to the `duration` property of the tween.
    /// - parameter value: The amount of seconds to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func duration(_ value: TimeInterval) -> Tween {
        self.duration = value
        return self
    }

    /// A method chain to assign a value to the `reversed` property of the tween.
    /// - parameter value: The boolean value to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func reversed(_ value: Bool) -> Tween {
        self.reversed = value
        return self
    }

    /// A method chain to assign a value to the `onUpdate` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onUpdate(_ callback: @escaping Callback) -> Tween {
        self.onUpdate = callback
        return self
    }

    /// A method chain to assign a value to the `onStart` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onStart(_ callback: @escaping Callback) -> Tween {
        self.onStart = callback
        return self
    }

    /// A method chain to assign a value to the `onStop` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onStop(_ callback: @escaping Callback) -> Tween {
        self.onStop = callback
        return self
    }

    /// A method chain to assign a value to the `onRestart` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onRestart(_ callback: @escaping Callback) -> Tween {
        self.onRestart = callback
        return self
    }

    /// A method chain to assign a value to the `onPause` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onPause(_ callback: @escaping Callback) -> Tween {
        self.onPause = callback
        return self
    }

    /// A method chain to assign a value to the `onResume` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onResume(_ callback: @escaping Callback) -> Tween {
        self.onResume = callback
        return self
    }

    /// A method chain to assign a value to the `onComplete` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onComplete(_ callback: @escaping Callback) -> Tween {
        self.onComplete = callback
        return self
    }

    /// A method chain to assign a value to the `onKill` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onKill(_ callback: @escaping Callback) -> Tween {
        self.onKill = callback
        return self
    }

    /// A method chain to assign a value to the `onRevive` property of the tween.
    /// - parameter value: The callback closure to be assigned.
    /// - returns: The tween to allow for additional method chaining.
    @discardableResult
    func onRevive(_ callback: @escaping Callback) -> Tween {
        self.onRevive = callback
        return self
    }

}
