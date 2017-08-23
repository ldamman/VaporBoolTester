#if os(Linux)

import XCTest
@testable import AppTests

XCTMain([
    // AppTests
    testCase(BoolResponseTests.allTests)
    testCase(PostControllerTests.allTests),
    testCase(RouteTests.allTests)
])

#endif
