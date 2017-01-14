//
//  Defaults.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A class to store default tweening and easing settings.
public final class Defaults {

    // Prevent instantiation of the class.
    private init() {}

    /// The default rate at which every `Tween` updates.
    private static let _frameRate = 30.0
    /// The default `Ease` assigned to every `Tween`.
    private static let _ease = Ease.quadOut
    /// The default overshoot value used in easing algorithms.
    private static let _overshoot = 1.70158
    /// The default amount of time, in seconds, before every `Tween` starts.
    private static let _delay = 0.0
    /// The default state of every `Tween` being reversed.
    private static let _reversed = false
    /// The default state of every `Tween` automatically starting upon creation.
    private static let _autoStartTweens = true
    /// The default state of every `Tween` automatically being killed upon completion.
    private static let _autoKillCompletedTweens = true

    /// The default rate at which every `Tween` updates.
    ///
    /// Default: 30.0
    public static var frameRate = Defaults._frameRate

    /// The default `Ease` assigned to every `Tween`.
    ///
    /// Default: `Ease.quadOut`
    public static var ease = Defaults._ease

    /// The default overshoot value used in easing algorithms.
    ///
    /// Default: 1.70158
    public static var overshoot = Defaults._overshoot

    /// The default amount of time, in seconds, before every `Tween` starts.
    ///
    /// Default: `0.0`
    public static var delay = Defaults._delay

    /// The default state of every `Tween` being reversed.
    ///
    /// Default: `false`
    public static var reversed = Defaults._reversed

    /// The default state of every `Tween` automatically starting upon creation.
    ///
    /// Default: `true`
    public static var autoStartTweens = Defaults._autoStartTweens

    /// The default state of every `Tween` automatically being killed upon
    /// completion.
    ///
    /// Default: `true`
    public static var autoKillCompletedTweens = Defaults._autoKillCompletedTweens

    /// A method to reset all defaults to their original values.
    public static func reset() {
        self.frameRate = Defaults._frameRate
        self.ease = Defaults._ease
        self.overshoot = Defaults._overshoot
        self.delay = Defaults._delay
        self.reversed = Defaults._reversed
        self.autoStartTweens = Defaults._autoStartTweens
        self.autoKillCompletedTweens = Defaults._autoKillCompletedTweens
    }

}
