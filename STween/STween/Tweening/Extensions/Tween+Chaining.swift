//
//  Tween+Chaining.swift
//  STween
//
//  Created by Adam Graham on 6/20/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/**
 Provides query method chaining to a tween. This allows multiple properties to be set on
 the tween during initialization in a simpler and more readable way.

 ```
 view.tween(to: .y(100.0), duration: 1.0)
    .set(ease: .backOut)
    .set(delay: 0.5)
    .set(onComplete: { ... })
 ```
 */
extension Tween {

    // MARK: Chaining Methods

    /**
     Assigns a value to the `ease` property of the tween.
     
     - Parameters:
        - ease: The `Ease` value to be assigned.
    
     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(ease: Ease) -> Tween {
        self.ease = ease
        return self
    }

    /**
     Assigns a value to the `delay` property of the tween.

     - Parameters:
        - delay: The amount of seconds to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(delay: TimeInterval) -> Tween {
        self.delay = delay
        return self
    }

    /**
     Assigns a value to the `duration` property of the tween.

     - Parameters:
        - duration: The amount of seconds to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(duration: TimeInterval) -> Tween {
        self.duration = duration
        return self
    }

    /**
     Assigns a value to the `reversed` property of the tween.

     - Parameters:
        - reversed: The boolean value to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(reversed: Bool) -> Tween {
        self.reversed = reversed
        return self
    }

    /**
     Assigns a callback to the `onUpdate` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onUpdate callback: @escaping Callback) -> Tween {
        self.onUpdate = callback
        return self
    }

    /**
     Assigns a callback to the `onStart` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onStart callback: @escaping Callback) -> Tween {
        self.onStart = callback
        return self
    }

    /**
     Assigns a callback to the `onStop` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onStop callback: @escaping Callback) -> Tween {
        self.onStop = callback
        return self
    }

    /**
     Assigns a callback to the `onRestart` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onRestart callback: @escaping Callback) -> Tween {
        self.onRestart = callback
        return self
    }

    /**
     Assigns a callback to the `onPause` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onPause callback: @escaping Callback) -> Tween {
        self.onPause = callback
        return self
    }

    /**
     Assigns a callback to the `onResume` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onResume callback: @escaping Callback) -> Tween {
        self.onResume = callback
        return self
    }

    /**
     Assigns a callback to the `onComplete` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onComplete callback: @escaping Callback) -> Tween {
        self.onComplete = callback
        return self
    }

    /**
     Assigns a callback to the `onKill` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onKill callback: @escaping Callback) -> Tween {
        self.onKill = callback
        return self
    }

    /**
     Assigns a callback to the `onReset` property of the tween.

     - Parameters:
        - callback: The callback closure to be assigned.

     - Returns: The tween to allow for additional method chaining.
     */
    @discardableResult public func set(onReset callback: @escaping Callback) -> Tween {
        self.onReset = callback
        return self
    }

}
