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
public typealias EaseAlgorithm = (
    _ b: Swift.Double,
    _ c: Swift.Double,
    _ t: Swift.Double,
    _ d: Swift.Double) -> Swift.Double

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

    /// The algorithm of an `Ease.linear` easing function.
    internal static let linear: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        return c * n + b
    }

}

// MARK: - Sinusoidal

extension EaseAlgorithms {

    /// The algorithm of an `Ease.sineIn` easing function.
    internal static let sineIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let m = cos(n * PI_D2)
        return -c * m + c + b
    }

    /// The algorithm of an `Ease.sineOut` easing function.
    internal static let sineOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let m = sin(n * PI_D2)
        return c * m + b
    }

    /// The algorithm of an `Ease.sineInOut` easing function.
    internal static let sineInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let x = c/2.0
        let n = t/d
        let m = cos(n * PI) - 1.0
        return -x * m + b
    }

}

// MARK: - Cubic

extension EaseAlgorithms {

    /// The algorithm of an `Ease.cubicIn` easing function.
    internal static let cubicIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let m = n*n*n
        return c * m + b
    }

    /// The algorithm of an `Ease.cubicOut` easing function.
    internal static let cubicOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = (t/d) - 1.0
        let m = (n*n*n) + 1.0
        return c * m + b
    }

    /// The algorithm of an `Ease.cubicInOut` easing function.
    internal static let cubicInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

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

    /// The algorithm of an `Ease.quadIn` easing function.
    internal static let quadIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let m = n*n
        return c * m + b
    }

    /// The algorithm of an `Ease.quadOut` easing function.
    internal static let quadOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let m = n*(n - 2.0)
        return -c * m + b
    }

    /// The algorithm of an `Ease.quadInOut` easing function.
    internal static let quadInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

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

    /// The algorithm of an `Ease.quartIn` easing function.
    internal static let quartIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let m = n*n*n*n
        return c * m + b
    }

    /// The algorithm of an `Ease.quartOut` easing function.
    internal static let quartOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = (t/d) - 1.0
        let m = (n*n*n*n) - 1.0
        return -c * m + b
    }

    /// The algorithm of an `Ease.quartInOut` easing function.
    internal static let quartInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

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

    /// The algorithm of an `Ease.quintIn` easing function.
    internal static let quintIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let m = n*n*n*n*n
        return c * m + b
    }

    /// The algorithm of an `Ease.quintOut` easing function.
    internal static let quintOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = (t/d) - 1.0
        let m = (n*n*n*n*n) + 1.0
        return -c * m + b
    }

    /// The algorithm of an `Ease.quintInOut` easing function.
    internal static let quintInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let x = c/2.0
        var n = t/(d/2.0)

        if n < 1.0 {
            let m = n*n*n*n*n
            return x * m + b
        } else {
            n -= 2.0
            let m = (n*n*n*n*n) + 2.0
            return -x * m + b
        }
    }
    
}

// MARK: - Exponential

extension EaseAlgorithms {

    /// The algorithm of an `Ease.expoIn` easing function.
    internal static let expoIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        if t == 0.0 {
            return b
        } else {
            let n = t/d
            let z = 10.0 * (n - 1.0)
            let m = pow(2.0, z)
            return c * m + b
        }
    }

    /// The algorithm of an `Ease.expoOut` easing function.
    internal static let expoOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        if t == d {
            return b + c
        } else {
            let n = t/d
            let z = -10.0 * n
            let m = -pow(2.0, z) + 1.0
            return c * m + b
        }
    }

    /// The algorithm of an `Ease.expoInOut` easing function.
    internal static let expoInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

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

    /// The algorithm of an `Ease.circIn` easing function.
    internal static let circIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = t/d
        let z = 1.0 - (n*n)
        let m = sqrt(z) - 1.0
        return -c * m + b
    }

    /// The algorithm of an `Ease.circOut` easing function.
    internal static let circOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let n = (t/d) - 1.0
        let z = 1.0 - (n*n)
        let m = sqrt(z)
        return c * m + b
    }

    /// The algorithm of an `Ease.circInOut` easing function.
    internal static let circInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

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

    /// The algorithm of an `Ease.backIn` easing function.
    internal static let backIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let s = Defaults.overshoot
        let n = t/d
        let z = ((s + 1.0) * n) - s
        let m = n*n*z
        return c * m + b
    }

    /// The algorithm of an `Ease.backOut` easing function.
    internal static let backOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let s = Defaults.overshoot
        let n = (t/d) - 1.0
        let z = ((s + 1.0) * n) + s
        let m = (n*n*z) + 1.0
        return c * m + b
    }

    /// The algorithm of an `Ease.backInOut` easing function.
    internal static let backInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

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

    /// The algorithm of an `Ease.elasticIn` easing function.
    internal static let elasticIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        if t == 0.0 {
            return b
        } else if t == d {
            return b + c
        }

        let p = d * 0.3 // period
        let a = c // amplitude
        let s = p * 0.25
        let n = (t/d) - 1.0

        let m1_z = 10.0 * n
        let m1 = a * pow(2.0, n)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * PI_M2 / p)

        let m = -(m1 * m2)
        return m + b
    }

    /// The algorithm of an `Ease.elasticOut` easing function.
    internal static let elasticOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        if t == 0.0 {
            return b
        } else if t == d {
            return b + c
        }

        let p = d * 0.3 // period
        let a = c // amplitude
        let s = p * 0.25
        let n = t/d

        let m1_z = -10.0 * n
        let m1 = a * pow(2.0, n)

        let m2_z = (n*d) - s
        let m2 = sin(m2_z * PI_M2 / p)

        let m = m1 * m2
        return c + m + b
    }

    /// The algorithm of an `Ease.elasticInOut` easing function.
    internal static let elasticInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        if t == 0.0 {
            return b
        } else if t == d {
            return b + c
        }

        let p = d * 0.3 // period
        let a = c // amplitude
        let s = p * 0.25
        var n = t/(d/2.0)

        if n < 1.0 {
            n -= 1.0

            let m1_z = 10.0 * n
            let m1 = a * pow(2.0, n)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * PI_M2 / p)

            let m = -0.5 * (m1 * m2)
            return m + b
        } else {
            n -= 1.0

            let m1_z = -10.0 * n
            let m1 = a * pow(2.0, n)

            let m2_z = (n*d) - s
            let m2 = sin(m2_z * PI_M2 / p)

            let m = m1 * m2 * 0.5
            return c + m + b
        }
    }
    
}

// MARK: - Bounce

extension EaseAlgorithms {

    /// The algorithm of an `Ease.bounceIn` easing function.
    internal static let bounceIn: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        let m = bounceOut(0.0, c, d-t, d)
        return c - m + b
    }

    /// The algorithm of an `Ease.bounceOut` easing function.
    internal static let bounceOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

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

    /// The algorithm of an `Ease.bounceInOut` easing function.
    internal static let bounceInOut: EaseAlgorithm = {(
        b: Swift.Double,
        c: Swift.Double,
        t: Swift.Double,
        d: Swift.Double) -> Swift.Double in

        if t < (d/2.0) {
            let z = t*2.0
            let m = bounceIn(0.0, c, z, d) * 0.5
            return m + b
        } else {
            let x = c/2.0
            let z = (t*2.0)-d
            let m = bounceOut(0.0, c, z, d) * 0.5
            return x * m + b
        }
    }
    
}
