//
//  TweenTimer.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import Foundation
import QuartzCore

/// A timer that schedules and fires intervaled events for a tween.
internal final class TweenTimer {

    // MARK: References

    /// A reference to the object listening to the timer events.
    internal weak var delegate: TweenTimerDelegate?

    /// The native timer that invokes "tick" events based on display vsync.
    private lazy var timer: CADisplayLink = {
        let displayLink = CADisplayLink(target: self, selector: #selector(tick))
        displayLink.add(to: .main, forMode: RunLoop.Mode.default)
        return displayLink
    }()

    // MARK: State Properties

    /// The state of the timer being "active".
    internal var running = false

    // MARK: Time Properties

    /// The amount of seconds the timer has been running.
    internal var elapsed: TimeInterval = 0.0

    /// The date/time of the last "tick" event.
    private var lastTickDate = Date()

    // MARK: Initialization

    /**
     Initializes a `TweenTimer` and assigns a delegate to it.
     
     - Parameters:
        - delegate: The delegate assigned to the timer.
     */
    internal convenience init(delegate: TweenTimerDelegate) {
        self.init()
        self.delegate = delegate
    }

    /// :nodoc:
    deinit {
        self.timer.invalidate()
    }

    // MARK: State Control Methods

    /**
     Starts running the timer, enabling "tick" events to be fired.
     */
    internal func start() {
        guard !self.running else {
            return
        }

        self.lastTickDate = Date()
        self.running = true
        self.timer.isPaused = false
    }

    /**
     Stops running the timer, disabling "tick" events from being fired.
     */
    internal func stop() {
        guard self.running else {
            return
        }

        self.running = false
        self.timer.isPaused = true
    }

    /**
     Resets the elapsed time of the timer.
 
     This has no effect on the current state of the timer, i.e., it will continue to run if it was
     previously running.
     */
    internal func reset() {
        self.elapsed = 0.0
        self.lastTickDate = Date()
    }

    // MARK: Timer Event Methods

    /**
     Updates the elapsed time of the timer by the amount of seconds passed since the last
     update cycle. Informs the delegate of the updated time.
     */
    @objc private func tick() {
        guard self.running else {
            return
        }

        let now = Date()
        let deltaTime = now.timeIntervalSince(self.lastTickDate)

        self.elapsed += deltaTime
        self.lastTickDate = now
        self.delegate?.tweenTimer(self, didUpdateWithElapsedTime: self.elapsed)
    }
    
}

// MARK: -

/// A type to which `TweenTimer` events can be delegated.
internal protocol TweenTimerDelegate: AnyObject {

    /**
     Informs the listener that a timer triggered an event that updated its elapsed time.
     
     - Parameters:
        - timer: The `TweenTimer` the event was invoked on.
        - elapsed: The amount of seconds the `timer` has been running.
     */
    func tweenTimer(_ timer: TweenTimer, didUpdateWithElapsedTime elapsed: TimeInterval)

}
