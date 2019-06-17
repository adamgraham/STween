//
//  EaseFunction.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 Calculates the number between a start and end value at a specific point in time.
 In simpler terms, an easing function determines the path used to get from point *A*
 to point *B*.

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

    public static func linear(_ x: Double) -> Double {
        return x
    }

}

/// The "sinusoidal" easing functions.
extension EaseFunction {

    // MARK: Sinusoidal

    public static func sineIn(_ x: Double) -> Double {
        return 1.0 - cos(x * .pi / 2.0)
    }

    public static func sineOut(_ x: Double) -> Double {
        return sin(x * .pi / 2.0)
    }

    public static func sineInOut(_ x: Double) -> Double {
        return -(cos(.pi * x) - 1.0) / 2.0
    }

}

/// The "cubic" easing functions.
extension EaseFunction {

    // MARK: Cubic

    public static func cubicIn(_ x: Double) -> Double {
        return x * x * x
    }

    public static func cubicOut(_ x: Double) -> Double {
        return 1.0 - pow(1.0 - x, 3.0)
    }

    public static func cubicInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            4.0 * x * x * x :
            1.0 - pow(-2.0 * x + 2.0, 3.0) / 2.0
    }
    
}

/// The "quadratic" easing functions.
extension EaseFunction {

    // MARK: Quadratic

    public static func quadIn(_ x: Double) -> Double {
        return x * x
    }

    public static func quadOut(_ x: Double) -> Double {
        return 1.0 - (1.0 - x) * (1.0 - x)
    }

    public static func quadInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            2.0 * x * x :
            1.0 - pow(-2.0 * x + 2.0, 2.0) / 2.0

    }
    
}

/// The "quartic" easing functions.
extension EaseFunction {

    // MARK: Quartic

    public static func quartIn(_ x: Double) -> Double {
        return x * x * x * x
    }

    public static func quartOut(_ x: Double) -> Double {
        return 1.0 - pow(1.0 - x, 4.0)
    }

    public static func quartInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            8.0 * x * x * x * x :
            1.0 - pow(-2.0 * x + 2.0, 4.0) / 2.0
    }
    
}

/// The "quintic" easing functions.
extension EaseFunction {

    // MARK: Quintic

    public static func quintIn(_ x: Double) -> Double {
        return x * x * x * x * x
    }

    public static func quintOut(_ x: Double) -> Double {
        return 1.0 - pow(1.0 - x, 5.0)
    }

    public static func quintInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            16.0 * x * x * x * x * x :
            1.0 - pow(-2.0 * x + 2.0, 5.0) / 2.0
    }
    
}

/// The "exponential" easing functions.
extension EaseFunction {

    // MARK: Exponential

    public static func expoIn(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : pow(2.0, 10.0 * x - 10.0)
    }

    public static func expoOut(_ x: Double) -> Double {
        return x >= 1.0 ? 1.0 : 1.0 - pow(2.0, -10.0 * x)
    }

    public static func expoInOut(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 : x < 0.5 ?
            pow(2.0, 20.0 * x - 10.0) / 2.0 :
            (2.0 - pow(2.0, -20.0 * x + 10.0)) / 2.0
    }
    
}

/// The "circular" easing functions.
extension EaseFunction {

    // MARK: Circular

    public static func circIn(_ x: Double) -> Double {
        return 1 - sqrt( 1 - pow( x, 2 ) )
    }

    public static func circOut(_ x: Double) -> Double {
        return sqrt( 1 - pow( x - 1, 2 ) )
    }

    public static func circInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            (1.0 - sqrt(1.0 - pow(2.0 * x, 2.0))) / 2.0 :
            (sqrt(1.0 - pow(-2.0 * x + 2.0, 2.0)) + 1.0) / 2.0
    }
    
}

/// The "back" easing functions.
extension EaseFunction {

    // MARK: Back

    public static func backIn(_ x: Double) -> Double {
        return c3 * x * x * x - c1 * x * x
    }

    public static func backOut(_ x: Double) -> Double {
        return 1.0 + c3 * pow(x - 1.0, 3.0) + c1 * pow(x - 1.0, 2.0)
    }

    public static func backInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            (pow(2.0 * x, 2.0) * ((c2 + 1.0) * 2.0 * x - c2)) / 2.0 :
            (pow(2.0 * x - 2.0, 2.0) * ((c2 + 1.0) * (x * 2.0 - 2.0) + c2) + 2.0) / 2.0
    }
    
}

/// The "elastic" easing functions.
extension EaseFunction {

    // MARK: Elastic

    public static func elasticIn(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 :
            -pow(2.0, 10.0 * x - 10.0) * sin((x * 10.0 - 10.75) * c4)
    }

    public static func elasticOut(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 :
            pow(2.0, -10.0 * x) * sin((x * 10.0 - 0.75) * c4) + 1.0
    }

    public static func elasticInOut(_ x: Double) -> Double {
        return x <= 0.0 ? 0.0 : x >= 1.0 ? 1.0 : x < 0.5 ?
            -(pow(2.0, 20.0 * x - 10.0) * sin((20.0 * x - 11.125) * c5)) / 2.0 :
            pow(2.0, -20.0 * x + 10.0) * sin((20.0 * x - 11.125) * c5) / 2.0 + 1.0
    }
    
}

/// The "bounce" easing functions.
extension EaseFunction {

    // MARK: Bounce

    public static func bounceIn(_ x: Double) -> Double {
        return 1.0 - bounceInOut(1.0 - x)
    }

    public static func bounceOut(_ x: Double) -> Double {
        return bounceInOut(x)
    }

    public static func bounceInOut(_ x: Double) -> Double {
        return x < 0.5 ?
            (1.0 - bounceInOut(1.0 - 2.0 * x)) / 2.0 :
            (1.0 + bounceInOut(2.0 * x - 1.0)) / 2.0
    }
    
}
