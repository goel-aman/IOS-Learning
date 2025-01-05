//
//  TestingIfMemoryLeaksExistOrNotUITests.swift
//  TestingIfMemoryLeaksExistOrNotUITests
//
//  Created by aman on 02/01/25.
//

import XCTest
@testable import TestingIfMemoryLeaksExistOrNot

extension XCTestCase {

    func assertDeallocation<T: AnyObject>(
        of object: () -> T,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        weak var weakReferenceToObject: T?

        let autoreleasepoolExpectation = expectation(description: "Autoreleasepool should drain")

        autoreleasepool {
            let object = object()

            weakReferenceToObject = object

            XCTAssertNotNil(weakReferenceToObject)

            autoreleasepoolExpectation.fulfill()
        }

        wait(for: [autoreleasepoolExpectation], timeout: 10.0)

        wait(
            for: weakReferenceToObject == nil,
            timeout: 3.0,
            description: "The object should be deallocated since no strong reference points to it.",
            file: file,
            line: line
        )
    }

    func wait(
        for condition: @autoclosure @escaping () -> Bool,
        timeout: TimeInterval,
        description: String,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        let end = Date().addingTimeInterval(timeout)

        var value: Bool = false
        let closure: () -> Void = {
            value = condition()
        }

        while !value && 0 < end.timeIntervalSinceNow {
            if RunLoop.current.run(mode: RunLoop.Mode.default, before: Date(timeIntervalSinceNow: 0.002)) {
                Thread.sleep(forTimeInterval: 0.002)
            }
            closure()
        }

        closure()

        XCTAssertTrue(
            value,
            "➡️? Timed out waiting for condition to be true: \"\(description)\"",
            file: file,
            line: line
        )
    }
}


final class TestingIfMemoryLeaksExistOrNotUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    @MainActor
    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    @MainActor
    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    
    func testMemoryLeaks() throws {
        assertDeallocation {
            return A()
        }
    }
    
    
}
