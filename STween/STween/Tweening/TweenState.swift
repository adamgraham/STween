//
//  TweenState.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// The state of a tween.
public enum TweenState {

    /// The state of a tween that is brand new or freshly reset.
    case new
    /// The state of a tween that has not been started and is not updating (but not new).
    case inactive
    /// The state of a tween that has been started and is updating.
    case active
    /// The state of a tween that is about to start but is waiting for its delay to finish.
    case delayed
    /// The state of a tween that has been started but is paused.
    case paused
    /// The state of a tween that has been completed.
    case completed
    /// The state of a tween that has been killed.
    case killed

}

extension TweenState {

    // MARK: State Machine Helpers

    /// Returns `true` if a tween can be started –
    /// must currently be in a `new` or `inactive` state.
    internal var canStart: Bool {
        switch self {
        case .new, .inactive:
            return true
        default:
            return false
        }
    }

    /// Returns `true` if a tween can be stopped –
    /// must currently be in an `active`, `delayed`, or `paused` state.
    internal var canStop: Bool {
        switch self {
        case .active, .delayed, .paused:
            return true
        default:
            return false
        }
    }

    /// Returns `true` if a tween can be restarted –
    /// must currently *not* be in a `new` or `killed` state.
    internal var canRestart: Bool {
        switch self {
        case .new, .killed:
            return false
        default:
            return true
        }
    }

    /// Returns `true` if a tween can be paused –
    /// must currently be in an `active` or `delayed` state.
    internal var canPause: Bool {
        switch self {
        case .active, .delayed:
            return true
        default:
            return false
        }
    }

    /// Returns `true` if a tween can be resumed –
    /// must currently be in a `paused` state.
    internal var canResume: Bool {
        switch self {
        case .paused:
            return true
        default:
            return false
        }
    }

    /// Returns `true` if a tween can be completed –
    /// must currently *not* be in a `completed` or `killed` state.
    internal var canComplete: Bool {
        switch self {
        case .completed, .killed:
            return false
        default:
            return true
        }
    }

    /// Returns `true` if a tween can be killed –
    /// must currently *not* be in a `killed` state.
    internal var canKill: Bool {
        switch self {
        case .killed:
            return false
        default:
            return true
        }
    }

    /// Returns `true` if a tween can be reset –
    /// must currently *not* be in a `new` state.
    internal var canReset: Bool {
        switch self {
        case .new:
            return false
        default:
            return true
        }
    }

    /// Returns `true` if a tween can be updated –
    /// must currently be in an `active` state.
    internal var canUpdate: Bool {
        switch self {
        case .active:
            return true
        default:
            return false
        }
    }
    
}
