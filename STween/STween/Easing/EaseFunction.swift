//
//  EaseFunction.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An easing function that determines the path used to get from point *A* to point *B* by
 calculating the position given a specific point in time.

 These easing functions are based upon [Robert Penner's Easing Functions](http://robertpenner.com/easing/).
 A visualized cheat-sheet of these functions can be found at [easings.net](http://easings.net/).

 * * * * *

 > *The aspect of time is crucial to motion — things change over time. Nothing can move in
 > “zero time”, or be in two places at once. In other words, a position needs time to
 > change, and it can have only one value at a specific point in time.*
 >
 > *Because position and time have this one-to-one relationship, we can say that position
 > is a function of time. This means that, given a specific point in time, we can find one,
 > and only one, corresponding position.*
 >
 > \- [Robert Penner](http://robertpenner.com/easing/penner_chapter7_tweening.pdf)
 */
public enum EaseFunction {

    private static var c1: Double { return Defaults.overshoot }
    private static var c2: Double { return c1 * 1.525 }
    private static var c3: Double { return c1 + 1.0 }
    private static var c4: Double { return (2.0 * .pi) / 3.0 }
    private static var c5: Double { return (2.0 * .pi) / 4.5 }

}

/// The "linear" easing function.
extension EaseFunction {

    // MARK: Linear

    /// Calculates the `y` value for coordinate `x` using linear easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func linear(_ x: Double) -> Double {
        return x
    }

}

/// The "sinusoidal" easing functions.
extension EaseFunction {

    // MARK: Sinusoidal

    /// Calculates the `y` value for coordinate `x` using sinusoidal-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func sineIn(_ x: Double) -> Double {
        return 1.0 - cos(x * .pi / 2.0)
    }

    /// Calculates the `y` value for coordinate `x` using sinusoidal-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func sineOut(_ x: Double) -> Double {
        return sin(x * .pi / 2.0)
    }

    /// Calculates the `y` value for coordinate `x` using sinusoidal-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func sineInOut(_ x: Double) -> Double {
        return -(cos(.pi * x) - 1.0) / 2.0
    }

}

/// The "cubic" easing functions.
extension EaseFunction {

    // MARK: Cubic

    /// Calculates the `y` value for coordinate `x` using cubic-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func cubicIn(_ x: Double) -> Double {
        return x * x * x
    }

    /// Calculates the `y` value for coordinate `x` using cubic-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func cubicOut(_ x: Double) -> Double {
        return 1.0 - pow(1.0 - x, 3.0)
    }

    /// Calculates the `y` value for coordinate `x` using cubic-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func cubicInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            4.0 * x * x * x :
            1.0 - pow(-2.0 * x + 2.0, 3.0) / 2.0
    }
    
}

/// The "quadratic" easing functions.
extension EaseFunction {

    // MARK: Quadratic

    /// Calculates the `y` value for coordinate `x` using quadratic-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quadIn(_ x: Double) -> Double {
        return x * x
    }

    /// Calculates the `y` value for coordinate `x` using quadratic-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quadOut(_ x: Double) -> Double {
        return 1.0 - (1.0 - x) * (1.0 - x)
    }

    /// Calculates the `y` value for coordinate `x` using quadratic-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quadInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            2.0 * x * x :
            1.0 - pow(-2.0 * x + 2.0, 2.0) / 2.0

    }
    
}

/// The "quartic" easing functions.
extension EaseFunction {

    // MARK: Quartic

    /// Calculates the `y` value for coordinate `x` using quartic-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quartIn(_ x: Double) -> Double {
        return x * x * x * x
    }

    /// Calculates the `y` value for coordinate `x` using quartic-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quartOut(_ x: Double) -> Double {
        return 1.0 - pow(1.0 - x, 4.0)
    }

    /// Calculates the `y` value for coordinate `x` using quartic-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quartInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            8.0 * x * x * x * x :
            1.0 - pow(-2.0 * x + 2.0, 4.0) / 2.0
    }
    
}

/// The "quintic" easing functions.
extension EaseFunction {

    // MARK: Quintic

    /// Calculates the `y` value for coordinate `x` using quintic-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quintIn(_ x: Double) -> Double {
        return x * x * x * x * x
    }

    /// Calculates the `y` value for coordinate `x` using quintic-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quintOut(_ x: Double) -> Double {
        return 1.0 - pow(1.0 - x, 5.0)
    }

    /// Calculates the `y` value for coordinate `x` using quintic-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func quintInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            16.0 * x * x * x * x * x :
            1.0 - pow(-2.0 * x + 2.0, 5.0) / 2.0
    }
    
}

/// The "exponential" easing functions.
extension EaseFunction {

    // MARK: Exponential

    /// Calculates the `y` value for coordinate `x` using exponential-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func expoIn(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : pow(2.0, 10.0 * x - 10.0)
    }

    /// Calculates the `y` value for coordinate `x` using exponential-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func expoOut(_ x: Double) -> Double {
        return x >= 1.0 ? 1.0 : 1.0 - pow(2.0, -10.0 * x)
    }

    /// Calculates the `y` value for coordinate `x` using exponential-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func expoInOut(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 : x < 0.5 ?
            pow(2.0, 20.0 * x - 10.0) / 2.0 :
            (2.0 - pow(2.0, -20.0 * x + 10.0)) / 2.0
    }
    
}

/// The "circular" easing functions.
extension EaseFunction {

    // MARK: Circular

    /// Calculates the `y` value for coordinate `x` using circular-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func circIn(_ x: Double) -> Double {
        return 1.0 - sqrt(1.0 - pow(x, 2.0))
    }

    /// Calculates the `y` value for coordinate `x` using circular-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func circOut(_ x: Double) -> Double {
        return sqrt(1.0 - pow(x - 1.0, 2.0))
    }

    /// Calculates the `y` value for coordinate `x` using circular-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func circInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            (1.0 - sqrt(1.0 - pow(2.0 * x, 2.0))) / 2.0 :
            (sqrt(1.0 - pow(-2.0 * x + 2.0, 2.0)) + 1.0) / 2.0
    }
    
}

/// The "back" easing functions.
extension EaseFunction {

    // MARK: Back

    /// Calculates the `y` value for coordinate `x` using back-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func backIn(_ x: Double) -> Double {
        return c3 * x * x * x - c1 * x * x
    }

    /// Calculates the `y` value for coordinate `x` using back-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func backOut(_ x: Double) -> Double {
        return 1.0 + c3 * pow(x - 1.0, 3.0) + c1 * pow(x - 1.0, 2.0)
    }

    /// Calculates the `y` value for coordinate `x` using back-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func backInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            (pow(2.0 * x, 2.0) * ((c2 + 1.0) * 2.0 * x - c2)) / 2.0 :
            (pow(2.0 * x - 2.0, 2.0) * ((c2 + 1.0) * (x * 2.0 - 2.0) + c2) + 2.0) / 2.0
    }
    
}

/// The "elastic" easing functions.
extension EaseFunction {

    // MARK: Elastic

    /// Calculates the `y` value for coordinate `x` using elastic-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func elasticIn(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 :
            -pow(2.0, 10.0 * x - 10.0) * sin((x * 10.0 - 10.75) * c4)
    }

    /// Calculates the `y` value for coordinate `x` using elastic-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func elasticOut(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 :
            pow(2.0, -10.0 * x) * sin((x * 10.0 - 0.75) * c4) + 1.0
    }

    /// Calculates the `y` value for coordinate `x` using elastic-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func elasticInOut(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 : x < 0.5 ?
            -(pow(2.0, 20.0 * x - 10.0) * sin((20.0 * x - 11.125) * c5)) / 2.0 :
            pow(2.0, -20.0 * x + 10.0) * sin((20.0 * x - 11.125) * c5) / 2.0 + 1.0
    }
    
}

/// The "bounce" easing functions.
extension EaseFunction {

    // MARK: Bounce

    /// Calculates the `y` value for coordinate `x` using bounce-in easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func bounceIn(_ x: Double) -> Double {
        return 1.0 - bounceOut(1.0 - x)
    }

    /// Calculates the `y` value for coordinate `x` using bounce-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func bounceOut(_ x: Double) -> Double {
        var x = x

        if (x < 1.0 / 2.75) {
            return 7.5625 * x * x
        } else if (x < 2.0 / 2.75) {
            x -= (1.5 / 2.75)
            return 7.5625 * x * x + 0.75
        } else if (x < 2.5 / 2.75) {
            x -= (2.25 / 2.75)
            return 7.5625 * x * x + 0.9375
        }

        x -= (2.625 / 2.75)
        return 7.5625 * x * x + 0.984375
    }

    /// Calculates the `y` value for coordinate `x` using bounce-in-out easing.
    /// - parameter x: The `x` coordinate to which the `y` value is returned, between [0, 1].
    /// - returns: The `y` value for coordinate `x`, between [0, 1].
    public static func bounceInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            (1.0 - bounceOut(1.0 - 2.0 * x)) / 2.0 :
            (1.0 + bounceOut(2.0 * x - 1.0)) / 2.0
    }
    
}
