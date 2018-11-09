//
//  Tween+Chaining.swift
//  STween
//
//  Created by Adam Graham on 6/20/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/**
 An extension of `Tween` to provide query method chaining. This allows multiple
 properties to be set on `self` in a simpler and more readable way.

 ```
 let tween = self.tween(to: .width(50.0), duration: 1.0)
    .set(ease: .backOut)
    .set(delay: 0.5)
    .set(onComplete: { ... })
 ```
 */
extension Tween {

    // MARK: Chaining Methods

    /**
     A query chaining method to assign a value to `self.ease`.
     
     - Parameters:
        - ease: The `Ease` to be assigned to `self.ease`.
    
     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(ease: Ease) -> Tween {
        self.ease = ease
        return self
    }

    /**
     A query chaining method to assign a value to `self.delay`.

     - Parameters:
        - delay: The amount of time, in seconds, to be assigned to `self.delay`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(delay: TimeInterval) -> Tween {
        self.delay = delay
        return self
    }

    /**
     A query chaining method to assign a value to `self.duration`.

     - Parameters:
        - duration: The amount of time, in seconds, to be assigned to `self.duration`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(duration: TimeInterval) -> Tween {
        self.duration = duration
        return self
    }

    /**
     A query chaining method to assign a value to `self.reversed`.

     - Parameters:
        - reversed: The boolean value to be assigned to `self.reversed`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(reversed: Bool) -> Tween {
        self.reversed = reversed
        return self
    }

    /**
     A query chaining method to assign a value to `self.onUpdate`.

     - Parameters:
        - callback: The callback to be assigned to `self.onUpdate`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onUpdate callback: @escaping Callback) -> Tween {
        self.onUpdate = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onStart`.

     - Parameters:
        - callback: The callback to be assigned to `self.onStart`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onStart callback: @escaping Callback) -> Tween {
        self.onStart = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onStop`.

     - Parameters:
        - callback: The callback to be assigned to `self.onStop`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onStop callback: @escaping Callback) -> Tween {
        self.onStop = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onRestart`.

     - Parameters:
        - callback: The callback to be assigned to `self.onRestart`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onRestart callback: @escaping Callback) -> Tween {
        self.onRestart = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onPause`.

     - Parameters:
        - callback: The callback to be assigned to `self.onPause`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onPause callback: @escaping Callback) -> Tween {
        self.onPause = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onResume`.

     - Parameters:
        - callback: The callback to be assigned to `self.onResume`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onResume callback: @escaping Callback) -> Tween {
        self.onResume = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onComplete`.

     - Parameters:
        - callback: The callback to be assigned to `self.onComplete`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onComplete callback: @escaping Callback) -> Tween {
        self.onComplete = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onKill`.

     - Parameters:
        - callback: The callback to be assigned to `self.onKill`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onKill callback: @escaping Callback) -> Tween {
        self.onKill = callback
        return self
    }

    /**
     A query chaining method to assign a value to `self.onReset`.

     - Parameters:
        - callback: The callback to be assigned to `self.onReset`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public func set(onReset callback: @escaping Callback) -> Tween {
        self.onReset = callback
        return self
    }

}
