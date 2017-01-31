//
//  EaseAlgorithms.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 A class to hold a collection of easing algorithms based upon
 [Robert Penner's Easing Functions](http://robertpenner.com/easing/). 
 A visualized cheat-sheet of these algorithms can be found at
 [easings.net](http://easings.net/).

 Easing algorithms calculate the value between a starting and ending
 position at a specific point in time. In simpler terms, these algorithms
 determine what path is used to get from point "A" to point "B".

 > "The aspect of time is crucial to motion — things change over time.
 > Nothing can move in “zero time”, or be in two places at once. In other
 > words, a position needs time to change, and it can have only one value
 > at a specific point in time.
 >
 > Because position and time have this one-to-one relationship, we can say
 > that position is a function of time. This means that, given a specific point
 > in time, we can find one, and only one, corresponding position."
 > \- [Robert Penner](http://robertpenner.com/easing/penner_chapter7_tweening.pdf)
 
 - Parameters:
    - b: The start value (b = begin).
    - c: The change in value (c = change).
    - t: The amount of time elapsed since the start of the ease (t = time).
    - d: The total amount of time the ease will run (d = duration).

 - Returns: The value at a specific point in time from the start value.
 */
internal final class EaseAlgorithms {

    // Prevent instantiation of the class.
    private init() {}

}

/**
 A method to calculate a value between a starting and ending position at 
 a specific point in time.

 - Parameters:
    - b: The start value (b = begin).
    - c: The change in value (c = change).
    - t: The amount of time elapsed since the start of the ease (t = time).
    - d: The total amount of time the ease will run (d = duration).

 - Returns: The value at a specific point in time from the start value.
 */
internal typealias EaseAlgorithm<Number: FloatingPoint> = (
    _ b: Number,
    _ c: Number,
    _ t: Number,
    _ d: Number) -> Number

/// An extension to add the linear easing algorithm.
extension EaseAlgorithms {

    // MARK: Linear

    /**
     The algorithmic function of a `linear` ease used to calculate a value
     between a starting and ending position at a specific point in time.
     
     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).
     
     - Returns: The value at a specific point in time from the start value.
     */
    internal static func linear<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        return c * n + b
    }

}

/// An extension to add the sinusoidal easing algorithms.
extension EaseAlgorithms {

    // MARK: Sinusoidal

    /**
     The algorithmic function of a `sineIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        let m = cos(n * Number.pi_half)
        return -c * m + c + b
    }

    /**
     The algorithmic function of a `sineOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        let m = sin(n * Number.pi_half)
        return c * m + b
    }

    /**
     The algorithmic function of a `sineInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let x = c.half
        let n = t/d
        let m = cos(n * Number.pi) - Number(1)
        return -x * m + b
    }

}

/// An extension to add the cubic easing algorithms.
extension EaseAlgorithms {

    // MARK: Cubic

    /**
     The algorithmic function of a `cubicIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        let m = n*n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `cubicOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let n = (t/d) - one
        let m = (n*n*n) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `cubicInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let x = c.half
        var n = t/(d.half)

        if n < Number(1) {
            let m = n*n*n
            return x * m + b
        } else {
            let two = Number(2)
            n -= two
            let m = (n*n*n) + two
            return x * m + b
        }
    }
    
}

/// An extension to add the quadratic easing algorithms.
extension EaseAlgorithms {

    // MARK: Quadratic

    /**
     The algorithmic function of a `quadIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        let m = n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `quadOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        let m = n*(n - Number(2))
        return -c * m + b
    }

    /**
     The algorithmic function of a `quadInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let m = n*n
            return x * m + b
        } else {
            n -= one
            let m = n*(n - Number(2)) - one
            return -x * m + b
        }
    }
    
}

/// An extension to add the quartic easing algorithms.
extension EaseAlgorithms {

    // MARK: Quartic

    /**
     The algorithmic function of a `quartIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        let m = n*n*n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `quartOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let n = (t/d) - one
        let m = (n*n*n*n) - one
        return -c * m + b
    }

    /**
     The algorithmic function of a `quartInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let x = c.half
        var n = t/(d.half)

        if n < Number(1) {
            let m = n*n*n*n
            return x * m + b
        } else {
            let two = Number(2)
            n -= two
            let m = (n*n*n*n) - two
            return -x * m + b
        }
    }
    
}

/// An extension to add the quintic easing algorithms.
extension EaseAlgorithms {

    // MARK: Quintic

    /**
     The algorithmic function of a `quintIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d
        let m = n*n*n*n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `quintOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let n = (t/d) - one
        let m = (n*n*n*n*n) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `quintInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let x = c.half
        var n = t/(d.half)

        if n < Number(1) {
            let m = n*n*n*n*n
            return x * m + b
        } else {
            let two = Number(2)
            n -= two
            let m = (n*n*n*n*n) + two
            return x * m + b
        }
    }
    
}

/// An extension to add the exponential easing algorithms.
extension EaseAlgorithms {

    // MARK: Exponential

    /**
     The algorithmic function of an `expoIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        if t == Number(0) {
            return b
        } else {
            let n = t/d
            let z = Number(10) * (n - Number(1))
            let m = pow(Number(2), z)
            return c * m + b
        }
    }

    /**
     The algorithmic function of an `expoOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        if t == d {
            return b + c
        } else {
            let n = t/d
            let z = -Number(10) * n
            let m = -pow(Number(2), z) + Number(1)
            return c * m + b
        }
    }

    /**
     The algorithmic function of an `expoInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        if t == Number(0) {
            return b
        } else if t == d {
            return b + c
        }

        let one = Number(1)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let z = Number(10) * (n - one)
            let m = pow(Number(2), z)
            return x * m + b
        } else {
            n -= one
            let two = Number(2)
            let z = -Number(10) * n
            let m = -pow(two, z) + two
            return x * m + b
        }
    }
    
}

/// An extension to add the circular easing algorithms.
extension EaseAlgorithms {

    // MARK: Circular

    /**
     The algorithmic function of a `circIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let n = t/d
        let z = one - (n*n)
        let m = sqrt(z) - one
        return -c * m + b
    }

    /**
     The algorithmic function of a `circOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let n = (t/d) - one
        let z = one - (n*n)
        let m = sqrt(z)
        return c * m + b
    }

    /**
     The algorithmic function of a `circInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let z = one - (n*n)
            let m = sqrt(z) - one
            return -x * m + b
        } else {
            n -= Number(2)
            let z = one - (n*n)
            let m = sqrt(z) + one
            return x * m + b
        }
    }
    
}

/// An extension to add the back easing algorithms.
extension EaseAlgorithms {

    // MARK: Back

    /**
     The algorithmic function of a `backIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let s = Number(Defaults.overshoot)
        let n = t/d
        let z = ((s + Number(1)) * n) - s
        let m = n*n*z
        return c * m + b
    }

    /**
     The algorithmic function of a `backOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let s = Number(Defaults.overshoot)
        let n = (t/d) - one
        let z = ((s + one) * n) + s
        let m = (n*n*z) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `backInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        let s = Number(Defaults.overshoot * 1.525)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let z = ((s + one) * n) - s
            let m = n*n*z
            return x * m + b
        } else {
            let two = Number(2)
            n -= two
            let z = ((s + one) * n) + s
            let m = (n*n*z) + two
            return x * m + b
        }
    }
    
}

/// An extension to add the elastic easing algorithms.
extension EaseAlgorithms {

    // MARK: Elastic

    /**
     The algorithmic function of an `elasticIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let one = Number(1)
        var n = t/d

        if t == Number(0) {
            return b
        } else if n == one {
            return b + c
        }

        let p = d * Number(0.3) // period
        let a = c // amplitude
        let s = p * Number(0.25)
        n -= one

        let m1_z = Number(10) * n
        let m1 = a * pow(Number(2), m1_z)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * Number.pi_double / p)

        let m = -(m1 * m2)
        return m + b
    }

    /**
     The algorithmic function of an `elasticOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let n = t/d

        if t == Number(0) {
            return b
        } else if n == Number(1) {
            return b + c
        }

        let p = d * Number(0.3) // period
        let a = c // amplitude
        let s = p * Number(0.25)

        let m1_z = -Number(10) * n
        let m1 = a * pow(Number(2), m1_z)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * Number.pi_double / p)

        let m = m1 * m2
        return c + m + b
    }

    /**
     The algorithmic function of an `elasticInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let two = Number(2)
        var n = t/(d.half)

        if t == Number(0) {
            return b
        } else if n == two {
            return b + c
        }

        let one = Number(1)
        let p = d * Number(0.45) // period
        let a = c // amplitude
        let s = p * Number(0.25)

        if n < one {
            n -= one

            let m1_z = Number(10) * n
            let m1 = a * pow(Number(2), m1_z)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * Number.pi_double / p)

            let m = -(m1 * m2).half
            return m + b
        } else {
            n -= one

            let m1_z = -Number(10) * n
            let m1 = a * pow(Number(2), m1_z)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * Number.pi_double / p)

            let m = (m1 * m2).half
            return c + m + b
        }
    }
    
}

/// An extension to add the bounce easing algorithms.
extension EaseAlgorithms {

    // MARK: Bounce

    /**
     The algorithmic function of a `bounceIn` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceIn<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        let m = EaseAlgorithms.bounceOut(b: Number(0), c: c, t: d-t, d: d)
        return c - m + b
    }

    /**
     The algorithmic function of a `bounceOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        var n = t/d
        let z: Number

        if n < Number(1.000 / 2.750) {
            z = Number(0)
        } else if n < Number(2.000 / 2.750) {
            n -= Number(1.500 / 2.750)
            z = Number(0.75)
        } else if n < Number(2.500 / 2.750) {
            n -= Number(2.250 / 2.750)
            z = Number(0.9375)
        } else {
            n -= Number(2.625 / 2.750)
            z = Number(0.984375)
        }

        let m = (Number(7.5625) * (n*n)) + z
        return c * m + b
    }

    /**
     The algorithmic function of a `bounceInOut` ease used to calculate a value
     between a starting and ending position at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceInOut<Number: FloatingPoint>(b: Number, c: Number, t: Number, d: Number) -> Number {
        if t < (d.half) {
            let z = t.double
            let m = EaseAlgorithms.bounceIn(b: Number(0), c: c, t: z, d: d).half
            return m + b
        } else {
            let x = c.half
            let z = (t.double)-d
            let m = (EaseAlgorithms.bounceOut(b: Number(0), c: c, t: z, d: d).half) + x
            return m + b
        }
    }
    
}
