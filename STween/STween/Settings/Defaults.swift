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

    // MARK: Properties

    /// The default rate at which every `Tween` updates.
    public static var frameRate = 30.0
    /// The default `Ease` assigned to every `Tween`.
    public static var ease = Ease.quadOut
    /// The default overshoot value used in easing algorithms.
    public static var overshoot = 1.70158
    /// The default amount of time, in seconds, before every `Tween` starts.
    public static var delay = 0.0
    /// The default state of every `Tween` being reversed.
    public static var reversed = false
    /// The default state of every `Tween` automatically starting upon creation.
    public static var autoStartTweens = true
    /// The default state of every `Tween` automatically being killed upon completion.
    public static var autoKillCompletedTweens = true

    // MARK: Methods

    /// A method to reset all defaults to their original values.
    public static func reset() {
        self.frameRate = 30.0
        self.ease = .quadOut
        self.overshoot = 1.70158
        self.delay = 0.0
        self.reversed = false
        self.autoStartTweens = true
        self.autoKillCompletedTweens = true
    }

}
