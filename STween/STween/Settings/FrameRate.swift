//
//  FrameRate.swift
//  STween
//
//  Created by Adam Graham on 6/17/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// A class to store and calculate frame rate settings.
public final class FrameRate {

    // Prevent instantiation of the class.
    private init() {}

    // MARK: Computed Properties

    /// The rate at which every `Tween` will update. For example, a frame rate of
    /// 30 means the tween will update 30 times per second. The higher the
    /// number, the smoother the tween animation will be but at a higher
    /// computational cost.
    public static var targetFrameRate: Double {
        return Defaults.frameRate
    }

    /// The duration of a single frame, in seconds, calculated by dividing 1.0 
    /// over the `FrameRate.targetFrameRate`.
    public static var targetFrameDuration: Double {
        return 1.0 / FrameRate.targetFrameRate
    }

}
