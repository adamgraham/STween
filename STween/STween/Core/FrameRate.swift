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

    /**
     The desired frames per second every `Tween` will run at.
     
     **Note:** In actuality, a `Tween` may run at a lower frame rate depending on 
     the processing power of the device executing the code i.e. the actual 
     frame rate may vary second to second.
     */
    public static var targetFrameRate: Swift.Double = 30.0

    /**
     The duration of a single frame, in seconds, based on the 
     `FrameRate.targetFrameRate`, calculated by dividing 1.0 over the
     target frame rate.
     */
    public static var targetFrameDuration: Swift.Double {
        return 1.0 / FrameRate.targetFrameRate
    }

}
