//
//  EaseFunctions.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 An enum to hold a collection of easing functions based upon
 [Robert Penner's Easing Functions](http://robertpenner.com/easing/). 
 A visualized cheat-sheet of these functions can be found at
 [easings.net](http://easings.net/).

 Easing functions calculate the value between a starting and ending position at a
 specific point in time. In simpler terms, these functions determine the path/motion used
 to get from point *A* to point *B*.

 * * * * *

 > *The aspect of time is crucial to motion — things change over time. Nothing can move in
 > “zero time”, or be in two places at once. In other words, a position needs time to
 > change, and it can have only one value at a specific point in time.*
 >
 > *Because position and time have this one-to-one relationship, we can say that position
 > is a function of time. This means that, given a specific point in time, we can find one,
 > and only one, corresponding position.*
 > \- [Robert Penner](http://robertpenner.com/easing/penner_chapter7_tweening.pdf)
 
 - Parameters:
    - b: The start value (b = begin).
    - c: The change in value (c = change).
    - t: The amount of time elapsed since the start of the ease (t = time).
    - d: The total amount of time the ease will run (d = duration).

 - Returns: The value at a specific point in time from the start value.
 */
internal enum EaseFunctions {}

/**
 A method to calculate a value between a starting and ending position at a specific point
 in time.

 - Parameters:
    - b: The start value (b = begin).
    - c: The change in value (c = change).
    - t: The amount of time elapsed since the start of the ease (t = time).
    - d: The total amount of time the ease will run (d = duration).

 - Returns: The value at a specific point in time from the start value.
 */
public typealias EaseFunction<Number: FloatingPoint> = (
    _ b: Number,
    _ c: Number,
    _ t: Number,
    _ d: Number) -> Number

/// An extension to add the linear easing function.
extension EaseFunctions {

    // MARK: Linear

    /**
     The algorithmic function of a `linear` ease used to calculate a value between a
     starting and ending position at a specific point in time.
     
     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).
     
     - Returns: The value at a specific point in time from the start value.
     */
    internal static func linear<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        return c * x + b
    }

}

/// An extension to add the sinusoidal easing functions.
extension EaseFunctions {

    // MARK: Sinusoidal

    /**
     The algorithmic function of a `sineIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = cos(x * Number.pi_half)
        return -c * m + c + b
    }

    /**
     The algorithmic function of a `sineOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = sin(x * Number.pi_half)
        return c * m + b
    }

    /**
     The algorithmic function of a `sineInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = cos(x * Number.pi) - Number(1)
        return -c.half * m + b
    }

}

/// An extension to add the cubic easing functions.
extension EaseFunctions {

    // MARK: Cubic

    /**
     The algorithmic function of a `cubicIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = x*x*x
        return c * m + b
    }

    /**
     The algorithmic function of a `cubicOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        let x = (t/d) - one
        let m = (x*x*x) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `cubicInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        var x = t/(d.half)

        if x < Number(1) {
            let m = x*x*x
            return c.half * m + b
        }

        let two = Number(2)
        x -= two
        let m = (x*x*x) + two
        return c.half * m + b
    }
    
}

/// An extension to add the quadratic easing functions.
extension EaseFunctions {

    // MARK: Quadratic

    /**
     The algorithmic function of a `quadIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = x*x
        return c * m + b
    }

    /**
     The algorithmic function of a `quadOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = x*(x - Number(2))
        return -c * m + b
    }

    /**
     The algorithmic function of a `quadInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        var x = t/(d.half)

        if x < one {
            let m = x*x
            return c.half * m + b
        }

        x -= one
        let m = x*(x - Number(2)) - one
        return -c.half * m + b
    }
    
}

/// An extension to add the quartic easing functions.
extension EaseFunctions {

    // MARK: Quartic

    /**
     The algorithmic function of a `quartIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = x*x*x*x
        return c * m + b
    }

    /**
     The algorithmic function of a `quartOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        let x = (t/d) - one
        let m = (x*x*x*x) - one
        return -c * m + b
    }

    /**
     The algorithmic function of a `quartInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        var x = t/(d.half)

        if x < Number(1) {
            let m = x*x*x*x
            return c.half * m + b
        }

        let two = Number(2)
        x -= two
        let m = (x*x*x*x) - two
        return -c.half * m + b
    }
    
}

/// An extension to add the quintic easing functions.
extension EaseFunctions {

    // MARK: Quintic

    /**
     The algorithmic function of a `quintIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d
        let m = x*x*x*x*x
        return c * m + b
    }

    /**
     The algorithmic function of a `quintOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        let x = (t/d) - one
        let m = (x*x*x*x*x) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `quintInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        var x = t/(d.half)

        if x < Number(1) {
            let m = x*x*x*x*x
            return c.half * m + b
        }

        let two = Number(2)
        x -= two
        let m = (x*x*x*x*x) + two
        return c.half * m + b
    }
    
}

/// An extension to add the exponential easing functions.
extension EaseFunctions {

    // MARK: Exponential

    /**
     The algorithmic function of an `expoIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        if t == Number(0) {
            return b
        }

        let x = t/d
        let e = Number(10) * (x - Number(1))
        let m = pow(Number(2), e)
        return c * m + b
    }

    /**
     The algorithmic function of an `expoOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        if t == d {
            return b + c
        }

        let x = t/d
        let e = -Number(10) * x
        let m = -pow(Number(2), e) + Number(1)
        return c * m + b
    }

    /**
     The algorithmic function of an `expoInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        if t == Number(0) {
            return b
        } else if t == d {
            return b + c
        }

        let one = Number(1)
        var x = t/(d.half)

        if x < one {
            let e = Number(10) * (x - one)
            let m = pow(Number(2), e)
            return c.half * m + b
        }

        x -= one
        let two = Number(2)
        let e = -Number(10) * x
        let m = -pow(two, e) + two
        return c.half * m + b
    }
    
}

/// An extension to add the circular easing functions.
extension EaseFunctions {

    // MARK: Circular

    /**
     The algorithmic function of a `circIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        let x = t/d
        let m = sqrt(one - (x*x)) - one
        return -c * m + b
    }

    /**
     The algorithmic function of a `circOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        let x = (t/d) - one
        let m = sqrt(one - (x*x))
        return c * m + b
    }

    /**
     The algorithmic function of a `circInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        var x = t/(d.half)

        if x < one {
            let m = sqrt(one - (x*x)) - one
            return -c.half * m + b
        }

        x -= Number(2)
        let m = sqrt(one - (x*x)) + one
        return c.half * m + b
    }
    
}

/// An extension to add the back easing functions.
extension EaseFunctions {

    // MARK: Back

    /**
     The algorithmic function of a `backIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let s = Number(Defaults.overshoot)
        let x = t/d
        let e = ((s + Number(1)) * x) - s
        let m = x*x*e
        return c * m + b
    }

    /**
     The algorithmic function of a `backOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        let s = Number(Defaults.overshoot)
        let x = (t/d) - one
        let e = ((s + one) * x) + s
        let m = (x*x*e) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `backInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        let s = Number(Defaults.overshoot * 1.525)
        var x = t/(d.half)

        if x < one {
            let e = ((s + one) * x) - s
            let m = x*x*e
            return c.half * m + b
        }

        let two = Number(2)
        x -= two
        let e = ((s + one) * x) + s
        let m = (x*x*e) + two
        return c.half * m + b
    }
    
}

/// An extension to add the elastic easing functions.
extension EaseFunctions {

    // MARK: Elastic

    /**
     The algorithmic function of an `elasticIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let one = Number(1)
        var x = t/d

        if t == Number(0) {
            return b
        } else if x == one {
            return b + c
        }

        let p = d * Number(0.3) // period
        let a = c // amplitude
        let s = p * Number(0.25)
        x -= one

        let e1 = Number(10) * x
        let m1 = a * pow(Number(2), e1)

        let e2 = (x*d) - s
        let m2 = sin(e2 * Number.pi_double / p)

        return -(m1 * m2) + b
    }

    /**
     The algorithmic function of an `elasticOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let x = t/d

        if t == Number(0) {
            return b
        } else if x == Number(1) {
            return b + c
        }

        let p = d * Number(0.3) // period
        let a = c // amplitude
        let s = p * Number(0.25)

        let e1 = -Number(10) * x
        let m1 = a * pow(Number(2), e1)

        let e2 = (x*d) - s
        let m2 = sin(e2 * Number.pi_double / p)

        return c + (m1 * m2) + b
    }

    /**
     The algorithmic function of an `elasticInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let two = Number(2)
        var x = t/(d.half)

        if t == Number(0) {
            return b
        } else if x == two {
            return b + c
        }

        let one = Number(1)
        let p = d * Number(0.45) // period
        let a = c // amplitude
        let s = p * Number(0.25)

        if x < one {
            x -= one

            let e1 = Number(10) * x
            let m1 = a * pow(Number(2), e1)

            let e2 = (x*d) - s
            let m2 = sin(e2 * Number.pi_double / p)

            return -(m1 * m2).half + b
        }

        x -= one

        let e1 = -Number(10) * x
        let m1 = a * pow(Number(2), e1)

        let e2 = (x*d) - s
        let m2 = sin(e2 * Number.pi_double / p)

        return c + (m1 * m2).half + b
    }
    
}

/// An extension to add the bounce easing functions.
extension EaseFunctions {

    // MARK: Bounce

    /**
     The algorithmic function of a `bounceIn` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceIn<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        let m = EaseFunctions.bounceOut(b: Number(0), c: c, t: d-t, d: d)
        return c - m + b
    }

    /**
     The algorithmic function of a `bounceOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {

        var x = t/d
        let e: Number

        if x < Number(1.000 / 2.750) {
            e = Number(0)
        } else if x < Number(2.000 / 2.750) {
            x -= Number(1.500 / 2.750)
            e = Number(0.75)
        } else if x < Number(2.500 / 2.750) {
            x -= Number(2.250 / 2.750)
            e = Number(0.9375)
        } else {
            x -= Number(2.625 / 2.750)
            e = Number(0.984375)
        }

        let m = (Number(7.5625) * (x*x)) + e
        return c * m + b
    }

    /**
     The algorithmic function of a `bounceInOut` ease used to calculate a value between a
     starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceInOut<Number: FloatingPoint>(
        b: Number, c: Number, t: Number, d: Number) -> Number {
        
        if t < (d.half) {
            let m = EaseFunctions.bounceIn(b: Number(0), c: c, t: t.double, d: d).half
            return m + b
        }

        let m = (EaseFunctions.bounceOut(b: Number(0), c: c, t: (t.double)-d, d: d).half) + c.half
        return m + b
    }
    
}
