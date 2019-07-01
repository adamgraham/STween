//
//  Defaults.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation

/// The default tweening and easing settings.
public enum Defaults {

    // MARK: Properties
    
    /// The default `Ease` assigned to every tween.
    public static var ease = Ease.quadOut
    /// The default overshoot value used in easing functions.
    public static var overshoot = 1.70158
    /// The default amount of seconds a tween takes to complete.
    public static var duration: TimeInterval = 0.3
    /// The default amount of seconds before every tween starts.
    public static var delay: TimeInterval = 0.0
    /// The default state of every tween automatically started upon creation.
    public static var autoStartTweens = true
    /// The default state of every tween automatically killed upon completion.
    public static var autoKillCompletedTweens = true

    // MARK: Methods

    /// Resets all defaults to their original values.
    public static func reset() {
        self.ease = .quadOut
        self.overshoot = 1.70158
        self.duration = 0.3
        self.delay = 0.0
        self.autoStartTweens = true
        self.autoKillCompletedTweens = true
    }

}
