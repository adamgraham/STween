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
extension Tween {

    // MARK: Chaining Methods

    /**
     A method chain to assign a value to the `ease` property of the tween.
     
     - Parameters:
        - value: The `Ease` value to be assigned.
    
     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func ease(_ value: Ease) -> Tween {
        self.ease = value
        return self
    }

    /**
     A method chain to assign a value to the `delay` property of the tween.

     - Parameters:
        - value: The amount of seconds to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func delay(_ value: TimeInterval) -> Tween {
        self.delay = value
        return self
    }

    /**
     A method chain to assign a value to the `duration` property of the tween.

     - Parameters:
        - value: The amount of seconds to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func duration(_ value: TimeInterval) -> Tween {
        self.duration = value
        return self
    }

    /**
     A method chain to assign a value to the `reversed` property of the tween.

     - Parameters:
        - value: The boolean value to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func reversed(_ value: Bool) -> Tween {
        self.reversed = value
        return self
    }

    /**
     A method chain to assign a callback to the `onUpdate` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onUpdate(_ callback: @escaping Callback) -> Tween {
        self.onUpdate = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onStart` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onStart(_ callback: @escaping Callback) -> Tween {
        self.onStart = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onStop` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onStop(_ callback: @escaping Callback) -> Tween {
        self.onStop = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onRestart` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onRestart(_ callback: @escaping Callback) -> Tween {
        self.onRestart = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onPause` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onPause(_ callback: @escaping Callback) -> Tween {
        self.onPause = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onResume` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onResume(_ callback: @escaping Callback) -> Tween {
        self.onResume = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onComplete` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onComplete(_ callback: @escaping Callback) -> Tween {
        self.onComplete = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onKill` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onKill(_ callback: @escaping Callback) -> Tween {
        self.onKill = callback
        return self
    }

    /**
     A method chain to assign a callback to the `onRevive` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func onRevive(_ callback: @escaping Callback) -> Tween {
        self.onRevive = callback
        return self
    }

}
