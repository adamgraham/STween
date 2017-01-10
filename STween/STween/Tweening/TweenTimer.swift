//
//  TweenTimer.swift
//  STween
//
//  Created by Adam Graham on 6/19/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

internal final class TweenTimer {

    // MARK: References

    /// A weak reference to the delegate listening to `self`.
    internal weak var delegate: TweenTimerDelegate?

    /// The timer object that invokes scheduled "tick" events.
    private lazy var timer: Foundation.Timer = Foundation.Timer.scheduledTimer(
        timeInterval: FrameRate.targetFrameDuration,
        target: self,
        selector: #selector(tick),
        userInfo: nil,
        repeats: true
    )

    // MARK: State Properties

    /// The state of `self` being active.
    internal var running = false

    // MARK: Time Properties

    /// The amount of time, in seconds, `self` has been running.
    internal var elapsed: Foundation.TimeInterval = 0.0

    /// The date/time of the last "tick" event.
    private var lastTickDate = Foundation.Date()

    // MARK: Initialization

    /**
     A convenience initializer to create a `TweenTimer` and assign a delegate 
     to it.
     
     - Parameters:
        - delegate: The delegate to be assigned to the initialized timer.
     */
    internal convenience init(delegate: TweenTimerDelegate) {
        self.init()
        self.delegate = delegate
    }

    deinit {
        self.timer.invalidate()
    }

    // MARK: State Control

    /**
     A method to set `self.running` to `true`, causing the timer to start 
     firing "tick" events.
     */
    internal func start() {
        self.timer.fire()
        self.lastTickDate = Date()
        self.running = true
    }

    /**
     A method to set `self.running` to `false`, causing the timer to stop 
     firing "tick" events.
     */
    internal func stop() {
        self.running = false
    }

    /**
     A method to reset `self.elapsed` to zero.
 
     **Note:** This has no effect on the state of `self`.
     */
    internal func reset() {
        self.elapsed = 0.0
        self.lastTickDate = Date()
    }

    /**
     A method to reset, then start `self`.

     See also, the following methods:
        - `reset()`
        - `start()`
     */
    internal func restart() {
        reset()
        start()
    }

    // MARK: Timer Events

    /**
     A method invoked every update cycle that updates `self`'s elapsed time 
     by the amount of time passed since the last update cycle. The duration
     between update cycles is determined by the timer's `timeInterval`.
     */
    @objc fileprivate func tick() {
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

// MARK: - TweenTimerDelegate Declaration

/// A protocol to inform a `TweenTimer`'s delegate of events.
protocol TweenTimerDelegate: class {

    /**
     A delegate method to inform the listener that a timer invoked a "tick" 
     event and has updated the elapsed time.
     
     - Parameters:
        - timer: The timer the "tick" event was invoked on.
        - elapsed: The amount of time, in seconds, the `timer` has been 
                   running.
     */
    func tweenTimer(_ timer: TweenTimer, didUpdateWithElapsedTime elapsed: Foundation.TimeInterval)

}
