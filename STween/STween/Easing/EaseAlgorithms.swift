//
//  EaseAlgorithms.swift
//  STween
//
//  Created by Adam Graham on 6/15/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/**
 A typealias for the method signature of an easing function algorithm. 
 Easing algorithms calculate the value between a start and end value at a
 specific point in time. In simpler terms, these algorithms determine what
 path is used to get from point "A" to point "B".

 > "The aspect of time is crucial to motion — things change over time.
 > Nothing can move in “zero time”, or be in two places at once. In other
 > words, a position needs time to change, and it can have only one value
 > at a specific point in time.
 >
 > Because position and time have this one-to-one relationship, we can say
 > that position is a function of time. This means that, given a specific point
 > in time, we can find one, and only one, corresponding position."

 \- [Robert Penner](http://robertpenner.com/easing/penner_chapter7_tweening.pdf)
 
 - Parameters:
    - b: The start value (b = begin).
    - c: The change in value (c = change).
    - t: The amount of time elapsed since the start of the ease (t = time).
    - d: The total amount of time the ease will run (d = duration).
 
 - Returns: The value at a specific point in time from the start value.
 */
internal typealias EaseAlgorithm<T: FloatingPoint> = (
    _ b: T,
    _ c: T,
    _ t: T,
    _ d: T) -> T

/**
 A class to hold a collection of easing algorithms based upon
 [Robert Penner's Easing Functions](http://robertpenner.com/easing/).

 A visualized cheat-sheet of these algorithms can be found at
 [easings.net](http://easings.net/).
 */
internal final class EaseAlgorithms {

    // Prevent instantiation of the class.
    private init() {}

}

// MARK: - Linear

extension EaseAlgorithms {

    /**
     The algorithmic function of a `linear` ease used to calculate a value
     between a start and end value at a specific point in time.
     
     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).
     
     - Returns: The value at a specific point in time from the start value.
     */
    internal static func linear<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        return c * n + b
    }

}

// MARK: - Sinusoidal

extension EaseAlgorithms {

    /**
     The algorithmic function of a `sineIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        let m = cos(n * T.pi_half)
        return -c * m + c + b
    }

    /**
     The algorithmic function of a `sineOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        let m = sin(n * T.pi_half)
        return c * m + b
    }

    /**
     The algorithmic function of a `sineInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func sineInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let x = c.half
        let n = t/d
        let m = cos(n * T.pi) - T(1)
        return -x * m + b
    }

}

// MARK: - Cubic

extension EaseAlgorithms {

    /**
     The algorithmic function of a `cubicIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        let m = n*n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `cubicOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let n = (t/d) - one
        let m = (n*n*n) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `cubicInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func cubicInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let x = c.half
        var n = t/(d.half)

        if n < T(1) {
            let m = n*n*n
            return x * m + b
        } else {
            let two = T(2)
            n -= two
            let m = (n*n*n) + two
            return x * m + b
        }
    }
    
}

// MARK: - Quadratic

extension EaseAlgorithms {

    /**
     The algorithmic function of a `quadIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        let m = n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `quadOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        let m = n*(n - T(2))
        return -c * m + b
    }

    /**
     The algorithmic function of a `quadInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quadInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let m = n*n
            return x * m + b
        } else {
            n -= one
            let m = n*(n - T(2)) - one
            return -x * m + b
        }
    }
    
}

// MARK: - Quartic

extension EaseAlgorithms {

    /**
     The algorithmic function of a `quartIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        let m = n*n*n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `quartOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let n = (t/d) - one
        let m = (n*n*n*n) - one
        return -c * m + b
    }

    /**
     The algorithmic function of a `quartInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quartInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let x = c.half
        var n = t/(d.half)

        if n < T(1) {
            let m = n*n*n*n
            return x * m + b
        } else {
            let two = T(2)
            n -= two
            let m = (n*n*n*n) - two
            return -x * m + b
        }
    }
    
}

// MARK: - Quintic

extension EaseAlgorithms {

    /**
     The algorithmic function of a `quintIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d
        let m = n*n*n*n*n
        return c * m + b
    }

    /**
     The algorithmic function of a `quintOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let n = (t/d) - one
        let m = (n*n*n*n*n) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `quintInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func quintInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let x = c.half
        var n = t/(d.half)

        if n < T(1) {
            let m = n*n*n*n*n
            return x * m + b
        } else {
            let two = T(2)
            n -= two
            let m = (n*n*n*n*n) + two
            return x * m + b
        }
    }
    
}

// MARK: - Exponential

extension EaseAlgorithms {

    /**
     The algorithmic function of an `expoIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        if t == T(0) {
            return b
        } else {
            let n = t/d
            let z = T(10) * (n - T(1))
            let m = pow(T(2), z)
            return c * m + b
        }
    }

    /**
     The algorithmic function of an `expoOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        if t == d {
            return b + c
        } else {
            let n = t/d
            let z = -T(10) * n
            let m = -pow(T(2), z) + T(1)
            return c * m + b
        }
    }

    /**
     The algorithmic function of an `expoInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func expoInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        if t == T(0) {
            return b
        } else if t == d {
            return b + c
        }

        let one = T(1)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let z = T(10) * (n - one)
            let m = pow(T(2), z)
            return x * m + b
        } else {
            n -= one
            let two = T(2)
            let z = -T(10) * n
            let m = -pow(two, z) + two
            return x * m + b
        }
    }
    
}

// MARK: - Circular

extension EaseAlgorithms {

    /**
     The algorithmic function of a `circIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let n = t/d
        let z = one - (n*n)
        let m = sqrt(z) - one
        return -c * m + b
    }

    /**
     The algorithmic function of a `circOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let n = (t/d) - one
        let z = one - (n*n)
        let m = sqrt(z)
        return c * m + b
    }

    /**
     The algorithmic function of a `circInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func circInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let z = one - (n*n)
            let m = sqrt(z) - one
            return -x * m + b
        } else {
            n -= T(2)
            let z = one - (n*n)
            let m = sqrt(z) + one
            return x * m + b
        }
    }
    
}

// MARK: - Back

extension EaseAlgorithms {

    /**
     The algorithmic function of a `backIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
     - b: The start value (b = begin).
     - c: The change in value (c = change).
     - t: The amount of time elapsed since the start of the ease (t = time).
     - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let s = T(Defaults.overshoot)
        let n = t/d
        let z = ((s + T(1)) * n) - s
        let m = n*n*z
        return c * m + b
    }

    /**
     The algorithmic function of a `backOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let s = T(Defaults.overshoot)
        let n = (t/d) - one
        let z = ((s + one) * n) + s
        let m = (n*n*z) + one
        return c * m + b
    }

    /**
     The algorithmic function of a `backInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func backInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        let s = T(Defaults.overshoot * 1.525)
        let x = c.half
        var n = t/(d.half)

        if n < one {
            let z = ((s + one) * n) - s
            let m = n*n*z
            return x * m + b
        } else {
            let two = T(2)
            n -= two
            let z = ((s + one) * n) + s
            let m = (n*n*z) + two
            return x * m + b
        }
    }
    
}

// MARK: - Elastic

extension EaseAlgorithms {

    /**
     The algorithmic function of an `elasticIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let one = T(1)
        var n = t/d

        if t == T(0) {
            return b
        } else if n == one {
            return b + c
        }

        let p = d * T(0.3) // period
        let a = c // amplitude
        let s = p * T(0.25)
        n -= one

        let m1_z = T(10) * n
        let m1 = a * pow(T(2), m1_z)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * T.pi_double / p)

        let m = -(m1 * m2)
        return m + b
    }

    /**
     The algorithmic function of an `elasticOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let n = t/d

        if t == T(0) {
            return b
        } else if n == T(1) {
            return b + c
        }

        let p = d * T(0.3) // period
        let a = c // amplitude
        let s = p * T(0.25)

        let m1_z = -T(10) * n
        let m1 = a * pow(T(2), m1_z)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * T.pi_double / p)

        let m = m1 * m2
        return c + m + b
    }

    /**
     The algorithmic function of an `elasticInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func elasticInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let two = T(2)
        var n = t/(d.half)

        if t == T(0) {
            return b
        } else if n == two {
            return b + c
        }

        let one = T(1)
        let p = d * T(0.45) // period
        let a = c // amplitude
        let s = p * T(0.25)

        if n < one {
            n -= one

            let m1_z = T(10) * n
            let m1 = a * pow(T(2), m1_z)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * T.pi_double / p)

            let m = -(m1 * m2).half
            return m + b
        } else {
            n -= one

            let m1_z = -T(10) * n
            let m1 = a * pow(T(2), m1_z)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * T.pi_double / p)

            let m = (m1 * m2).half
            return c + m + b
        }
    }
    
}

// MARK: - Bounce

extension EaseAlgorithms {

    /**
     The algorithmic function of a `bounceIn` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceIn<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        let m: T = EaseAlgorithms.bounceOut(b: T(0), c: c, t: d-t, d: d)
        return c - m + b
    }

    /**
     The algorithmic function of a `bounceOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        var n = t/d
        let z: T

        if n < T(1.000 / 2.750) {
            z = T(0)
        } else if n < T(2.000 / 2.750) {
            n -= T(1.500 / 2.750)
            z = T(0.75)
        } else if n < T(2.500 / 2.750) {
            n -= T(2.250 / 2.750)
            z = T(0.9375)
        } else {
            n -= T(2.625 / 2.750)
            z = T(0.984375)
        }

        let m = (T(7.5625) * (n*n)) + z
        return c * m + b
    }

    /**
     The algorithmic function of a `bounceInOut` ease used to calculate a value
     between a start and end value at a specific point in time.

     - Parameters:
        - b: The start value (b = begin).
        - c: The change in value (c = change).
        - t: The amount of time elapsed since the start of the ease (t = time).
        - d: The total amount of time the ease will run (d = duration).

     - Returns: The value at a specific point in time from the start value.
     */
    internal static func bounceInOut<T: FloatingPoint>(b: T, c: T, t: T, d: T) -> T {
        if t < (d.half) {
            let z = t.double
            let m: T = EaseAlgorithms.bounceIn(b: T(0), c: c, t: z, d: d).half
            return m + b
        } else {
            let x = c.half
            let z = (t.double)-d
            let m: T = (EaseAlgorithms.bounceOut(b: T(0), c: c, t: z, d: d).half) + x
            return m + b
        }
    }
    
}
