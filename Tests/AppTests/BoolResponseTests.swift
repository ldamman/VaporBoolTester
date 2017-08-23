import XCTest
import Testing
import HTTP
import Sockets
@testable import Vapor
@testable import App

class BoolResponseTests: TestCase {
	func testPrettyFetch() throws {
		let drop = try! Droplet.testable()
		
		try drop.testResponse(to: .get, at: "/pretty")
			.assertStatus(is: .ok)
			.assertJSON("someFlag", equals: true)
	}
	
	func testUglyFetch() throws {
		let drop = try! Droplet.testable()
		
		try drop.testResponse(to: .get, at: "/ugly")
			.assertStatus(is: .ok)
			.assertJSON("someFlag", equals: true)
	}
	
	func testUglierFetch() throws {
		let drop = try! Droplet.testable()
		
		try drop.testResponse(to: .get, at: "/uglier")
			.assertStatus(is: .ok)
			.assertJSON("someFlag", equals: true)
	}
}


// MARK: Manifest

extension BoolResponseTests {
    /// This is a requirement for XCTest on Linux
    /// to function properly.
    /// See ./Tests/LinuxMain.swift for examples
    static let allTests = [
        ("testPrettyFetch", testPrettyFetch),
        ("testUglyFetch", testUglyFetch),
        ("testUglierFetch", testUglierFetch),
    ]
}
