//
//  Tweenable.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A protocol to provide tweening animation functionality.
public protocol Tweenable {

    associatedtype TweenProperty

    /**
     A method to retrieve the interpolation start value for a tweenable 
     property on `self`.
     
     - Parameters:
        - property: The property for which the start value should be retrieved.
     
     - Returns: The start value on `self` for the given `property`.
     */
    func interpolationStartValue(for property: Self.TweenProperty) -> Self.TweenProperty

    /**
     A method to interpolate a set of values for a tweenable property on
     `self` and apply the result to `self`.
     
     - Parameters:
        - ease: The `Ease` used to interpolate values.
        - values: The start and end value passed to the `ease` algorithm.
        - elapsed: The elapsed amount of time passed to the `ease` algorithm.
        - duration: The duration of time passed to the `ease` algorithm.
     
     - Throws: `TweenError.invalidInterpolation` if the values can not be
                interpolated with each other.
     */
    func interpolate(with ease: Ease, values: InterpolationValues<Self.TweenProperty>,
                     elapsed: TimeInterval, duration: TimeInterval) throws

    /**
     A method to create an animation of a tweenable property on `self` with a 
     given duration.
     
     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    func tween(_ property: Self.TweenProperty, duration: TimeInterval, completion: Callback?) -> Tween

    /**
     A method to create an animation of an array of tweenable properties on 
     `self` with a given duration.
     
     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.
     
     - Returns: The `Tween` control for the animation.
     */
    func tween(_ properties: [Self.TweenProperty], duration: TimeInterval, completion: Callback?) -> Tween

}

extension Tweenable {

    // MARK: Default Implementation

    /**
     A method to create an animation of a tweenable property on `self` with a
     given duration.

     - Parameters:
        - property: The property to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    public final func tween(_ property: Self.TweenProperty, duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.to(target: self, properties: [property], duration: duration, completion: completion)
    }

    /**
     A method to create an animation of an array of tweenable properties on
     `self` with a given duration.

     - Parameters:
        - properties: The array of properties to be animated.
        - duration: The amount of time, in seconds, the animation will run.
        - completion: A callback invoked when the animation is finished.

     - Returns: The `Tween` control for the animation.
     */
    public final func tween(_ properties: [Self.TweenProperty], duration: TimeInterval, completion: Callback? = nil) -> Tween {
        return Tweener.to(target: self, properties: properties, duration: duration, completion: completion)
    }

}

extension Tweenable {

    // MARK: Helper Methods

    /**
     A class method to calculate the value between a starting and ending position at a
     specific point in time.

     - Parameters:
        - ease: The `Ease` used to interpolate values.
        - startValue: The start value passed to the `ease` algorithm.
        - endValue: The end value passed to the `ease` algorithm.
        - elapsed: The elapsed amount of time passed to the `ease` algorithm.
        - duration: The duration of time passed to the `ease` algorithm.

     - Returns: The value interpolated between the start and end value.
     */
    public final func interpolate<Type: Interpolatable>(
        with ease: Ease, startValue: Type, endValue: Type,
        elapsed: TimeInterval, duration: TimeInterval) -> Type where Type.InterpolationType == Type {

        return Type.interpolate(with: ease, startValue: startValue, endValue: endValue,
                                elapsed: elapsed, duration: duration)
    }

}
