//
//  Tweenable.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide tweening animation functionality.
public protocol Tweenable {

    associatedtype PropertyType = TweenableProperty

    /**
     A method to retrieve the value of a tweenable property on `self`.

     - Parameters:
        - property: The property of which its value will be retrieved.

     - Returns: The value of the `property` on `self`.
     */
    func tweenableValue(get property: PropertyType) -> InterpolationValue

    /**
     A method to assign a new value to a tweenable property on `self`.

     - Parameters:
        - property: The property to which a new value will be assigned.
        - newValue: The value to be assigned to the `property` on `self`.
     
     - Throws: `DeserializationError.valueNotDeserializable` if `newValue` 
                cannot be converted to its expected type.
     */
    func tweenableValue(set property: Self.PropertyType, newValue: InterpolationValue) throws

    /**
     A method to animate a tweenable property on `self` with a given
     duration.
     
     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    func tween(property: Self.PropertyType, duration: Foundation.TimeInterval, completion: Callback?) -> Tween

    /**
     A method to animate an array of tweenable properties on `self` with a 
     given duration.
     
     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    func tween(properties: [Self.PropertyType], duration: Foundation.TimeInterval, completion: Callback?) -> Tween

}

// MARK: - Default Implementation

extension Tweenable {

    public final func tween(property: Self.PropertyType, duration: Foundation.TimeInterval, completion: Callback? = nil) -> Tween {
        return tween(properties: [property], duration: duration, completion: completion)
    }

    public final func tween(properties: [Self.PropertyType], duration: Foundation.TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.to(target: self, properties: properties, duration: duration, completion: completion)
    }

}
