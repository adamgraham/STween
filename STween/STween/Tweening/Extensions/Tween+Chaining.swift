//
//  Tween+Chaining.swift
//  STween
//
//  Created by Adam Graham on 6/20/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An extension of `Tween` to provide query method chaining. This allows
 multiple properties to be set on `self` in a simpler and more readable way.
 For example,

 ```
 let tween = self.tween(property: .x(50.0), duration: 1.0)
    .set(ease: Ease.backOut)
    .set(delay: 0.5)
    .set(callback: { ... }, for: TweenStateChange.complete)
 ```
 */
extension Tween {

    /**
     A query chaining method to assign a value to `self.ease`.
     
     - Parameters:
        - ease: The `Ease` to be assigned to `self.ease`.
    
     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public final func set(ease: Ease) -> Tween {
        self.ease = ease
        return self
    }

    /**
     A query chaining method to assign a value to `self.delay`.

     - Parameters:
        - delay: The amount of time, in seconds, to be assigned to 
                 `self.delay`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public final func set(delay: Foundation.TimeInterval) -> Tween {
        self.delay = delay
        return self
    }

    /**
     A query chaining method to assign a value to `self.duration`.

     - Parameters:
        - duration: The amount of time, in seconds, to be assigned to 
                    `self.duration`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public final func set(duration: Foundation.TimeInterval) -> Tween {
        self.duration = duration
        return self
    }

    /**
     A query chaining method to assign a value to `self.reversed`.

     - Parameters:
        - reversed: The boolean value to be assigned to `self.reversed`.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public final func set(reversed: Swift.Bool) -> Tween {
        self.reversed = reversed
        return self
    }

    /**
     A query chaining method to assign a callback to a change of state on
     `self`. Any time `self` changes to the specified state, the callback is
     invoked.

     - Parameters:
        - callback: The callback to be assigned to a change of state on `self`.
        - stateChange: The change of state the `callback` will be assigned to.

     - Returns: `self` to allow for additional method chaining.
     */
    @discardableResult public final func set(callback: @escaping Callback, for stateChange: TweenStateChange) -> Tween {
        self.callback(set: stateChange, value: callback)
        return self
    }

}
