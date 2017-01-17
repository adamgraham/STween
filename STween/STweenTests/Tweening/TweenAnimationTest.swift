//
//  TweenAnimationTest.swift
//  STween
//
//  Created by Adam Graham on 6/16/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class TweenAnimationTest: XCTestCase {

    override func setUp() {
        super.setUp()
        Tweener.invokeStateChangeOnAllTweens(.kill)
        Defaults.reset()
    }

    override func tearDown() {
        Tweener.invokeStateChangeOnAllTweens(.kill)
        Defaults.reset()
        super.tearDown()
    }

    // MARK: Initialization Tests

    func testInit() {
        let target = UIView()
        let tween = TweenAnimation<UIView>(target: target, properties: [], duration: 1.0)

        XCTAssertEqual(tween.target, target)
        XCTAssertEqual(tween.targetProperties.count, 0)
        XCTAssertEqual(tween.duration, 1.0)
    }

    // MARK: Tweening Tests

    func testTweening() {
        let target = UIView()
        let tween = TweenAnimation<UIView>(target: target, properties: [.x(100.0), .y(100.0)], duration: 1.0)
        let tweeningExpectation = expectation(description: "tweening")

        tween.callback(set: .complete) {
            tweeningExpectation.fulfill()
        }

        tween.ease = .linear
        tween.start()
        tween.update()

        XCTAssertEqualWithAccuracy(Double(target.frame.origin.x), 0.0, accuracy: DBL_EPSILON)
        XCTAssertEqualWithAccuracy(Double(target.frame.origin.y), 0.0, accuracy: DBL_EPSILON)

        waitForExpectations(timeout: 3.0) { error in
            XCTAssertEqualWithAccuracy(Double(target.frame.origin.x), 100.0, accuracy: DBL_EPSILON)
            XCTAssertEqualWithAccuracy(Double(target.frame.origin.y), 100.0, accuracy: DBL_EPSILON)
        }
    }

    func testTweeningReversed() {
        let target = UIView()
        let tween = TweenAnimation<UIView>(target: target, properties: [.x(100.0), .y(100.0)], duration: 1.0)
        let tweeningExpectation = expectation(description: "tweening:reversed")

        tween.callback(set: .complete) {
            tweeningExpectation.fulfill()
        }

        tween.reversed = true
        tween.ease = .linear
        tween.start()
        tween.update()

        XCTAssertEqualWithAccuracy(Double(target.frame.origin.x), 100.0, accuracy: DBL_EPSILON)
        XCTAssertEqualWithAccuracy(Double(target.frame.origin.y), 100.0, accuracy: DBL_EPSILON)

        waitForExpectations(timeout: 3.0) { error in
            XCTAssertEqualWithAccuracy(Double(target.frame.origin.x), 0.0, accuracy: DBL_EPSILON)
            XCTAssertEqualWithAccuracy(Double(target.frame.origin.y), 0.0, accuracy: DBL_EPSILON)
        }
    }

    func testTweeningWithInvalidData() {
        let target = InvalidTweenable()
        let tween = TweenAnimation<InvalidTweenable>(target: target, properties: [.invalidA(1.0), .invalidB(1.0)], duration: 1.0)
        let tweeningExpectation = expectation(description: "tweening:invalid")

        tween.callback(set: .complete) {
            tweeningExpectation.fulfill()
        }

        tween.start()
        tween.update()

        var completed = false

        waitForExpectations(timeout: 3.0) { error in
            completed = true
        }

        XCTAssertTrue(completed)
    }

    // MARK: State Control Tests

    func testStart() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .start) {
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertFalse(tween.invoke(.start))
        XCTAssertTrue(callbackInvoked)
    }

    func testStop() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .stop) {
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.stop))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.stop))
        XCTAssertEqual(tween.state, .inactive)
        XCTAssertTrue(callbackInvoked)
    }

    func testRestart() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .restart) {
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.restart))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.stop))
        XCTAssertEqual(tween.state, .inactive)
        XCTAssertTrue(tween.invoke(.restart))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

    func testPause() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .pause) {
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.pause))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.pause))
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(callbackInvoked)
    }

    func testResume() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .resume) {
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.resume))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.pause))
        XCTAssertEqual(tween.state, .paused)
        XCTAssertTrue(tween.invoke(.resume))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

    func testCompleteWithAutoKillOn() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [.x(100.0)], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .complete) {
            callbackInvoked = true
        }

        Defaults.autoKillCompletedTweens = true

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.complete))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.complete))
        XCTAssertEqual(tween.state, .killed)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertEqual(tween.target.frame.origin.x, 100.0)
        XCTAssertTrue(callbackInvoked)
    }

    func testCompleteWithAutoKillOff() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [.x(100.0)], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .complete) {
            callbackInvoked = true
        }

        Defaults.autoKillCompletedTweens = false

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.complete))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.complete))
        XCTAssertEqual(tween.state, .completed)
        XCTAssertEqual(tween.elapsed, 1.0)
        XCTAssertEqual(tween.target.frame.origin.x, 100.0)
        XCTAssertTrue(callbackInvoked)
    }

    func testKill() {
        let tween = Tweener.to(target: UIView(), properties: [], duration: 1.0) as! TweenAnimation<UIView>

        var callbackInvoked = false
        tween.callback(set: .kill) {
            callbackInvoked = true
        }

        XCTAssertEqual(Tweener.count, 1)
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.kill))
        XCTAssertEqual(tween.state, .killed)
        XCTAssertFalse(tween.invoke(.kill))
        XCTAssertTrue(callbackInvoked)
        XCTAssertEqual(Tweener.count, 0)
    }

    func testReset() {
        let tween = TweenAnimation<UIView>(target: UIView(), properties: [], duration: 1.0)
        tween.reversed = !Defaults.reversed
        tween.ease = .backOut
        tween.delay = Defaults.delay + 1.0

        var callbackInvoked = false
        tween.callback(set: .reset) {
            callbackInvoked = true
        }

        XCTAssertEqual(Tweener.count, 0)
        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.reset))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.reset))
        XCTAssertEqual(tween.state, .new)
        XCTAssertEqual(tween.reversed, Defaults.reversed)
        XCTAssertEqual(tween.ease, Defaults.ease)
        XCTAssertEqual(tween.delay, Defaults.delay)
        XCTAssertNil(tween.callback(get: .reset))
        XCTAssertTrue(callbackInvoked)
        XCTAssertEqual(Tweener.count, 1)
    }

    func testUpdate() {
        let target = UIView()
        let tween = TweenAnimation<UIView>(target: target, properties: [], duration: 1.0)

        var callbackInvoked = false
        tween.callback(set: .update) {
            callbackInvoked = true
        }

        XCTAssertEqual(tween.state, .new)
        XCTAssertFalse(tween.invoke(.update))
        XCTAssertEqual(tween.state, .new)
        XCTAssertTrue(tween.invoke(.start))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(tween.invoke(.update))
        XCTAssertEqual(tween.state, .active)
        XCTAssertTrue(callbackInvoked)
    }

    // MARK: Callback Tests

    func testCallbackMethods() {
        let tween = Tweener.to(target: UIView(), properties: [], duration: 1.0)
        let states: [TweenStateChange] = [.start, .stop, .restart, .pause, .resume, .complete, .kill, .reset, .update]

        for state in states {
            XCTAssertNil(tween.callback(get: state))
            tween.callback(set: state, value: {})
            XCTAssertNotNil(tween.callback(get: state))
            tween.callback(clear: state)
            XCTAssertNil(tween.callback(get: state))
        }
    }

}

// MARK: - InvalidTweenable Test Class

fileprivate class InvalidTweenable: Tweenable {

    enum GenericError: Error {

        case error

    }

    enum TweenProperty {

        case invalidA(Double)
        case invalidB(Double)

    }

    public func interpolationStartValue(for property: TweenProperty) -> TweenProperty {
        switch property {
        case .invalidA:
            return .invalidA(0.0)
        case .invalidB:
            return .invalidB(0.0)
        }
    }

    public func interpolate(with ease: Ease, values: InterpolationValues<TweenProperty>,
                            elapsed: TimeInterval, duration: TimeInterval) throws {

        switch (values.start, values.end) {
        case let (.invalidA(startValue), .invalidA(endValue)):
            throw TweenError.invalidInterpolation(valueA: startValue, valueB: endValue, tweenable: self)
        default:
            throw GenericError.error
        }
    }

}
