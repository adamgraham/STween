//
//  TweenAnimatorTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenAnimatorTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.default.killAll()
    }

    override func tearDown() {
        Tweener.default.killAll()
        super.tearDown()
    }

    // MARK: Initialization

    func testInitialization() {
        let target = UIView()
        let anotherTarget = UIView()
        let tween = TweenAnimator(targets: target, anotherTarget)

        XCTAssertNil(tween.tweener)
        XCTAssertEqual(tween.targets, [target, anotherTarget])
        XCTAssertTrue(tween.tweens.isEmpty)
        XCTAssertEqual(tween.state, .new)
        XCTAssertEqual(tween.ease, Defaults.ease)
        XCTAssertEqual(tween.delay, Defaults.delay)
        XCTAssertEqual(tween.duration, Defaults.duration)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertNil(tween.onUpdate)
        XCTAssertNil(tween.onStart)
        XCTAssertNil(tween.onStop)
        XCTAssertNil(tween.onRestart)
        XCTAssertNil(tween.onPause)
        XCTAssertNil(tween.onResume)
        XCTAssertNil(tween.onComplete)
        XCTAssertNil(tween.onKill)
        XCTAssertNil(tween.onRevive)
    }

    // MARK: Tweening

    func testTweenTo() {
        let target = UIView()
        let tween = TweenAnimator(targets: target).to(.x(100.0), .y(100.0))

        tween.onUpdate = { _ in XCTAssertNotEqual(tween.elapsed, 0.0) }
        tween.onComplete = { _ in XCTAssertEqual(tween.elapsed, tween.duration) }
        tween.ease = .linear
        tween.duration = 1.0

        tween.start()
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.5)
        XCTAssertEqual(target.frame.origin.x, 50.0)
        XCTAssertEqual(target.frame.origin.y, 50.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertEqual(target.frame.origin.y, 100.0)
    }

    func testTweenToCustomProperty() {
        struct CustomProperty: TweenableProperty {
            var animation: ((UILabel) -> (TimeInterval) -> Void) {
                return { _ in return { _ in } }
            }
        }
        
        let target = UILabel()
        target.textColor = .black

        let tween = TweenAnimator(targets: target)
            .to(.x(100.0), .y(100.0))
            .to(.textColor(.white))
            .to(CustomProperty())

        tween.onUpdate = { _ in XCTAssertNotEqual(tween.elapsed, 0.0) }
        tween.onComplete = { _ in XCTAssertEqual(tween.elapsed, tween.duration) }
        tween.ease = .linear
        tween.duration = 1.0

        tween.start()
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertColor(target.textColor, .black)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.5)
        XCTAssertColor(target.textColor, .gray)
        XCTAssertEqual(target.frame.origin.x, 50.0)
        XCTAssertEqual(target.frame.origin.y, 50.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertColor(target.textColor, .white)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertEqual(target.frame.origin.y, 100.0)
    }

    func testTweenToDelayed() {
        let target = UIView()
        let tween = TweenAnimator(targets: target).to(.x(100.0), .y(100.0))

        tween.onUpdate = { _ in XCTAssertNotEqual(tween.elapsed, 0.0) }
        tween.onComplete = { _ in XCTAssertEqual(tween.elapsed, tween.duration) }
        tween.ease = .linear
        tween.duration = 1.0
        tween.delay = 1.0

        tween.start()
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.5)
        XCTAssertEqual(target.frame.origin.x, 50.0)
        XCTAssertEqual(target.frame.origin.y, 50.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertEqual(target.frame.origin.y, 100.0)
    }

    func testTweenFrom() {
        let target = UIView()
        let tween = TweenAnimator(targets: target).from(.x(100.0), .y(100.0))

        tween.onUpdate = { _ in XCTAssertNotEqual(tween.elapsed, 0.0) }
        tween.onComplete = { _ in XCTAssertEqual(tween.elapsed, tween.duration) }
        tween.ease = .linear
        tween.duration = 1.0

        tween.start()
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertEqual(target.frame.origin.y, 100.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.5)
        XCTAssertEqual(target.frame.origin.x, 50.0)
        XCTAssertEqual(target.frame.origin.y, 50.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)
    }

    func testTweenFromCustomProperty() {
        struct CustomProperty: TweenableProperty {
            var animation: ((UILabel) -> (TimeInterval) -> Void) {
                return { _ in return { _ in } }
            }
        }

        let target = UILabel()
        target.textColor = .black

        let tween = TweenAnimator(targets: target)
            .from(.x(100.0), .y(100.0))
            .from(.textColor(.white))
            .from(CustomProperty())

        tween.onUpdate = { _ in XCTAssertNotEqual(tween.elapsed, 0.0) }
        tween.onComplete = { _ in XCTAssertEqual(tween.elapsed, tween.duration) }
        tween.ease = .linear
        tween.duration = 1.0

        tween.start()
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertColor(target.textColor, .white)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertEqual(target.frame.origin.y, 100.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.5)
        XCTAssertColor(target.textColor, .gray)
        XCTAssertEqual(target.frame.origin.x, 50.0)
        XCTAssertEqual(target.frame.origin.y, 50.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertColor(target.textColor, .black)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)
    }

    func testTweenFromDelayed() {
        let target = UIView()
        let tween = TweenAnimator(targets: target).from(.x(100.0), .y(100.0))

        tween.onUpdate = { _ in XCTAssertNotEqual(tween.elapsed, 0.0) }
        tween.onComplete = { _ in XCTAssertEqual(tween.elapsed, tween.duration) }
        tween.ease = .linear
        tween.duration = 1.0
        tween.delay = 1.0

        tween.start()
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertEqual(target.frame.origin.y, 100.0)

        tween.update(by: 0.5)
        XCTAssertEqual(tween.elapsed, 0.5)
        XCTAssertEqual(target.frame.origin.x, 50.0)
        XCTAssertEqual(target.frame.origin.y, 50.0)

        tween.update(by: 1.0)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertEqual(target.frame.origin.x, 0.0)
        XCTAssertEqual(target.frame.origin.y, 0.0)
    }

    // MARK: State Control

    func testUpdate() {
        let tween = TweenAnimator(targets: UIView())

        var callbackInvoked = false
        tween.onUpdate = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.update(by: .ulpOfOne))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.update(by: .ulpOfOne))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

    func testUpdateWithDelay() {
        let tween = TweenAnimator(targets: UIView())
        tween.delay = 1.0

        var callbackInvoked = false
        tween.onUpdate = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.update(by: .ulpOfOne))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertTrue(tween.update(by: .ulpOfOne))
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertFalse(callbackInvoked)
        XCTAssertTrue(tween.update(by: tween.delay))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.update(by: .ulpOfOne))
        XCTAssertTrue(callbackInvoked)
    }

    func testStart() {
        let tween = TweenAnimator(targets: UIView())

        var callbackInvoked = false
        tween.onStart = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertFalse(tween.start())
        XCTAssertTrue(callbackInvoked)
    }

    func testStartWithDelay() {
        let tween = TweenAnimator(targets: UIView())
        tween.delay = 1.0

        var callbackInvoked = false
        tween.onStart = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertFalse(tween.start())
        XCTAssertFalse(callbackInvoked)
        XCTAssertTrue(tween.update(by: tween.delay))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

    func testStop() {
        let tween = TweenAnimator(targets: UIView())

        var callbackInvoked = false
        tween.onStop = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.stop())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.stop())
        XCTAssertEqual(tween.state, .inactive)
        XCTAssertTrue(callbackInvoked)
    }

    func testRestart() {
        let tween = TweenAnimator(targets: UIView())

        var callbackInvoked = false
        tween.onRestart = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.stop())
        XCTAssertEqual(tween.state, .inactive)
        XCTAssertTrue(tween.restart())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.restart())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.kill())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(tween.restart())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertTrue(callbackInvoked)
    }

    func testPause() {
        let tween = TweenAnimator(targets: UIView())

        var callbackInvoked = false
        tween.onPause = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.pause())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.pause())
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(callbackInvoked)
    }

    func testResume() {
        let tween = TweenAnimator(targets: UIView())

        var callbackInvoked = false
        tween.onResume = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.resume())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.pause())
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(tween.resume())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

    func testResumeWithDelay() {
        let tween = TweenAnimator(targets: UIView())
        tween.delay = 1.0

        var callbackInvoked = false
        tween.onResume = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.resume())
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertTrue(tween.pause())
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(tween.resume())
        XCTAssertEqual(tween.state, .delayed)
        XCTAssertTrue(callbackInvoked)
    }

    func testCompleteWithAutoKillOn() {
        Defaults.autoKillCompletedTweens = true
        defer { Defaults.reset() }

        let target = UIView()
        let tween = TweenAnimator(targets: target).to(.x(100.0))

        var callbackInvoked = false
        tween.onComplete = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.complete())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(tween.complete())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertEqual(tween.elapsed, tween.duration)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertTrue(callbackInvoked)
    }

    func testCompleteWithAutoKillOff() {
        Defaults.autoKillCompletedTweens = false
        defer { Defaults.reset() }

        let target = UIView()
        let tween = TweenAnimator(targets: target).to(.x(100.0))

        var callbackInvoked = false
        tween.onComplete = { _ in
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.complete())
        XCTAssertEqual(tween.state, .completed)
        XCTAssertFalse(tween.complete())
        XCTAssertEqual(tween.state, .completed)
        XCTAssertEqual(tween.elapsed, tween.duration)
        XCTAssertEqual(target.frame.origin.x, 100.0)
        XCTAssertTrue(callbackInvoked)
    }

    func testKill() {
        let tween = TweenAnimator(targets: UIView())
        Tweener.default.track(tween)

        var callbackInvoked = false
        tween.onKill = { _ in
            callbackInvoked = true
        }

        XCTAssertTrue(Tweener.default.isTracking(tween))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.kill())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(tween.kill())
        XCTAssertTrue(callbackInvoked)
        XCTAssertFalse(Tweener.default.isTracking(tween))
    }

    func testRevive() {
        let tween = TweenAnimator(targets: UIView())
        Tweener.default.track(tween)

        var callbackInvoked = false
        tween.onRevive = { _ in
            callbackInvoked = true
        }

        XCTAssertTrue(Tweener.default.isTracking(tween))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.start())
        XCTAssertEqual(tween.state, .active)
        XCTAssertFalse(tween.revive())
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.kill())
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(Tweener.default.isTracking(tween))
        XCTAssertTrue(tween.revive())
        XCTAssertEqual(tween.state, .new)
        XCTAssertEqual(tween.elapsed, 0.0)
        XCTAssertTrue(callbackInvoked)
        XCTAssertTrue(Tweener.default.isTracking(tween))
    }

}
