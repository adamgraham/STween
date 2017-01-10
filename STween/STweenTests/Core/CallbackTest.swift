//
//  CallbackTest.swift
//  STween
//
//  Created by Adam Graham on 6/17/16.
//  Copyright © 2016 Adam Graham. All rights reserved.
//

import XCTest

@testable import STween

class CallbackTest: XCTestCase {

    func test() {
        var invoked = false

        let callback: Callback = {
            invoked = true
        }

        callback()
        XCTAssertTrue(invoked)
    }

}
