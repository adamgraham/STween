//
//  TweenState.swift
//  STween
//
//  Created by Adam Graham on 8/13/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

/// An enum to describe the state of a `Tween`.
public enum TweenState {

    /// A case to denote a `Tween` is brand new or freshly reset.
    case new
    /// A case to denote a `Tween` has not been started, but is not new.
    case inactive
    /// A case to denote a `Tween` has been started and is updating.
    case active
    /// A case to denote a `Tween` has been started but is paused.
    case paused
    /// A case to denote a `Tween` has been completed.
    case completed
    /// A case to denote a `Tween` has been killed.
    case killed

}

// MARK: - State Machine Helpers

extension TweenState {
    
    /**
     The ability for a `Tween` to be started, based on the state of `self`.
     Will return `true` if `self` is `new` or `inactive`.
     */
    internal var canStart: Swift.Bool {
        switch self {
        case .new, .inactive:
            return true
        default:
            return false
        }
    }

    /**
     The ability for a `Tween` to be stopped, based on the state of `self`.
     Will return `true` if `self` is `active` or `paused`.
     */
    internal var canStop: Swift.Bool {
        switch self {
        case .active, .paused:
            return true
        default:
            return false
        }
    }

    /**
     The ability for a `Tween` to be restarted, based on the state of `self`.
     Will return `true` if `self` is `active`, `paused`, or `completed`.
     */
    internal var canRestart: Swift.Bool {
        switch self {
        case .active, .paused, .completed:
            return true
        default:
            return false
        }
    }

    /**
     The ability for a `Tween` to be paused, based on the state of `self`.
     Will only return `true` if `self` is `active`.
     */
    internal var canPause: Swift.Bool {
        switch self {
        case .active:
            return true
        default:
            return false
        }
    }

    /**
     The ability for a `Tween` to be resumed, based on the state of `self`.
     Will only return `true` if `self` is `paused`.
     */
    internal var canResume: Swift.Bool {
        switch self {
        case .paused:
            return true
        default:
            return false
        }
    }

    /**
     The ability for a `Tween` to be completed, based on the state of `self`.
     Will return `true` if `self` is `active` or `paused`.
     */
    internal var canComplete: Swift.Bool {
        switch self {
        case .active, .paused:
            return true
        default:
            return false
        }
    }

    /**
     The ability for a `Tween` to be killed, based on the state of `self`.
     Will always return `true` if `self` is *not* already `killed`.
     */
    internal var canKill: Swift.Bool {
        switch self {
        case .killed:
            return false
        default:
            return true
        }
    }

    /**
     The ability for a `Tween` to be reset, based on the state of `self`.
     Will always return `true` if `self` is *not* already `new`.
     */
    internal var canReset: Swift.Bool {
        switch self {
        case .new:
            return false
        default:
            return true
        }
    }

    /**
     The ability for a `Tween` to be updated, based on the state of `self`.
     Will only return `true` if `self` is `active`.
     */
    internal var canUpdate: Swift.Bool {
        switch self {
        case .active:
            return true
        default:
            return false
        }
    }
    
}
