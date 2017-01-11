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
internal typealias EaseAlgorithm<T: Arithmetic> = (
    _ b: T,
    _ c: T,
    _ t: Foundation.TimeInterval,
    _ d: Foundation.TimeInterval) -> T

/**
 A class to hold a collection of easing algorithms based upon
 [Robert Penner's Easing Functions](http://robertpenner.com/easing/).

 A visualized cheat-sheet of these algorithms can be found at
 [easings.net](http://easings.net/).
 */
internal final class EaseAlgorithms {

    fileprivate static let PI = Swift.Double.pi
    fileprivate static let PI_M2 = PI * 2.0
    fileprivate static let PI_D2 = PI / 2.0

    fileprivate static let DIV1 = 1.000 / 2.750
    fileprivate static let DIV2 = 1.500 / 2.750
    fileprivate static let DIV3 = 2.000 / 2.750
    fileprivate static let DIV4 = 2.250 / 2.750
    fileprivate static let DIV5 = 2.500 / 2.750
    fileprivate static let DIV6 = 2.625 / 2.750

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
    internal static func linear<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
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
    internal static func sineIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = t/d
        let m = cos(n * PI_D2)
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
    internal static func sineOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = t/d
        let m = sin(n * PI_D2)
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
    internal static func sineInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let x = c/2.0
        let n = t/d
        let m = cos(n * PI) - 1.0
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
    internal static func cubicIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
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
    internal static func cubicOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = (t/d) - 1.0
        let m = (n*n*n) + 1.0
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
    internal static func cubicInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let m = n*n*n
            return x * m + b
        } else {
            n -= 2.0
            let m = (n*n*n) + 2.0
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
    internal static func quadIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
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
    internal static func quadOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = t/d
        let m = n*(n - 2.0)
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
    internal static func quadInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let m = n*n
            return x * m + b
        } else {
            n -= 1.0
            let m = n*(n - 2.0) - 1.0
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
    internal static func quartIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
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
    internal static func quartOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = (t/d) - 1.0
        let m = (n*n*n*n) - 1.0
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
    internal static func quartInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let m = n*n*n*n
            return x * m + b
        } else {
            n -= 2.0
            let m = (n*n*n*n) - 2.0
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
    internal static func quintIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
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
    internal static func quintOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = (t/d) - 1.0
        let m = (n*n*n*n*n) + 1.0
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
    internal static func quintInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let m = n*n*n*n*n
            return x * m + b
        } else {
            n -= 2.0
            let m = (n*n*n*n*n) + 2.0
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
    internal static func expoIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        if t == 0.0 {
            return b
        } else {
            let n = t/d
            let z = 10.0 * (n - 1.0)
            let m = pow(2.0, z)
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
    internal static func expoOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        if t == d {
            return b + c
        } else {
            let n = t/d
            let z = -10.0 * n
            let m = -pow(2.0, z) + 1.0
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
    internal static func expoInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        if t == 0.0 {
            return b
        } else if t == d {
            return b + c
        }

        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let z = 10.0 * (n - 1.0)
            let m = pow(2.0, z)
            return x * m + b
        } else {
            n -= 1.0
            let z = -10.0 * n
            let m = -pow(2.0, z) + 2.0
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
    internal static func circIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = t/d
        let z = 1.0 - (n*n)
        let m = sqrt(z) - 1.0
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
    internal static func circOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = (t/d) - 1.0
        let z = 1.0 - (n*n)
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
    internal static func circInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let z = 1.0 - (n*n)
            let m = sqrt(z) - 1.0
            return -x * m + b
        } else {
            n -= 2.0
            let z = 1.0 - (n*n)
            let m = sqrt(z) + 1.0
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
    internal static func backIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let s = Defaults.overshoot
        let n = t/d
        let z = ((s + 1.0) * n) - s
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
    internal static func backOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let s = Defaults.overshoot
        let n = (t/d) - 1.0
        let z = ((s + 1.0) * n) + s
        let m = (n*n*z) + 1.0
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
    internal static func backInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let s = Defaults.overshoot * 1.525
        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let z = ((s + 1.0) * n) - s
            let m = n*n*z
            return x * m + b
        } else {
            n -= 2.0
            let z = ((s + 1.0) * n) + s
            let m = (n*n*z) + 2.0
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
    internal static func elasticIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        var n = t/d

        if t == 0.0 {
            return b
        } else if n == 1.0 {
            return b + c
        }

        let p = d * 0.3 // period
        let a = c // amplitude
        let s = p * 0.25
        n -= 1.0

        let m1_z = 10.0 * n
        let m1 = a * pow(2.0, m1_z)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * PI_M2 / p)

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
    internal static func elasticOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let n = t/d

        if t == 0.0 {
            return b
        } else if n == 1.0 {
            return b + c
        }

        let p = d * 0.3 // period
        let a = c // amplitude
        let s = p * 0.25

        let m1_z = -10.0 * n
        let m1 = a * pow(2.0, m1_z)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * PI_M2 / p)

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
    internal static func elasticInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        var n = t/(d/2.0)

        if t == 0.0 {
            return b
        } else if n == 2.0 {
            return b + c
        }

        let p = d * 0.45 // period
        let a = c // amplitude
        let s = p * 0.25

        if n < 1.0 {
            n -= 1.0

            let m1_z = 10.0 * n
            let m1 = a * pow(2.0, m1_z)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * PI_M2 / p)

            let m = -0.5 * (m1 * m2)
            return m + b
        } else {
            n -= 1.0

            let m1_z = -10.0 * n
            let m1 = a * pow(2.0, m1_z)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * PI_M2 / p)

            let m = m1 * m2 * 0.5
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
    internal static func bounceIn<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        let m: T = EaseAlgorithms.bounceOut(b: T.identity, c: c, t: d-t, d: d)
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
    internal static func bounceOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        var n = t/d
        let z: Swift.Double

        if n < DIV1 {
            z = 0.0
        } else if n < DIV3 {
            n -= DIV2
            z = 0.75
        } else if n < DIV5 {
            n -= DIV4
            z = 0.9375
        } else {
            n -= DIV6
            z = 0.984375
        }

        let m = (7.5625 * (n*n)) + z
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
    internal static func bounceInOut<T: Arithmetic>(b: T, c: T, t: Foundation.TimeInterval, d: Foundation.TimeInterval) -> T {
        if t < (d/2.0) {
            let z = t*2.0
            let m: T = EaseAlgorithms.bounceIn(b: T.identity, c: c, t: z, d: d) * 0.5
            return m + b
        } else {
            let x = c/2.0
            let z = (t*2.0)-d
            let m: T = (EaseAlgorithms.bounceOut(b: T.identity, c: c, t: z, d: d) * 0.5) + x
            return m + b
        }
    }
    
}
