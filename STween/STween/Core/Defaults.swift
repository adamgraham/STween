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

    /**
     The default rate at which every `Tween` updates.
     
     Default: 30.0
     */
    public static var frameRate = 30.0

    /**
     The default `Ease` assigned to every `Tween`.

     Default: `Ease.quadOut`
     */
    public static var ease = Ease.quadOut

    /**
     The default overshoot value used in easing algorithms.
     
     Default: 1.70158
     */
    public static var overshoot = 1.70158

    /**
     The default amount of time, in seconds, before every `Tween` starts.

     Default: `0.0`
     */
    public static var delay: Foundation.TimeInterval = 0.0

    /**
     The default state of every `Tween` being reversed.
     
     Default: `false`
     */
    public static var reversed = false

    /**
     The default state of every `Tween` automatically starting upon creation.

     Default: `true`
     */
    public static var autoStartTweens = true

    /**
     The default state of every `Tween` automatically being killed upon 
     completion.

     Default: `true`
     */
    public static var autoKillCompletedTweens = true

}
