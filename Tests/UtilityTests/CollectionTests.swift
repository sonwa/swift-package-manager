/*
 This source file is part of the Swift.org open source project
 
 Copyright 2015 - 2016 Apple Inc. and the Swift project authors
 Licensed under Apache License v2.0 with Runtime Library Exception
 
 See http://swift.org/LICENSE.txt for license information
 See http://swift.org/CONTRIBUTORS.txt for Swift project authors
 */

@testable import Utility
import XCTest

class CollectionTests: XCTestCase {
    func testPick() {
        let body = { (num: Int) -> Bool in num > 5 }
        
        XCTAssertNil([].pick(body))
        XCTAssertNil([3, 4].pick(body))
        XCTAssertEqual([3, 7].pick(body), 7)
        XCTAssertEqual([3, 8, 7].pick(body), 8)
    }
    
    func testSplitAround() {
        
        func eq(_ lhs: ([Character], [Character]?), _ rhs: ([Character], [Character]?), file: StaticString = #file, line: UInt = #line) {
            XCTAssertEqual(lhs.0, rhs.0, file: file, line: line)
            XCTAssertEqual(lhs.1 ?? [], rhs.1 ?? [], file: file, line: line)
        }
        
        eq([].split(around: [":"]), ([], nil))
        eq(["f", "o", "o"].split(around: [":"]), (["f", "o", "o"], nil))
        eq(["f", "o", "o", ":"].split(around: [":"]), (["f", "o", "o"], []))
        eq([":", "b", "a", "r"].split(around: [":"]), ([], ["b", "a", "r"]))
        eq(["f", "o", "o", ":", "b", "a", "r"].split(around: [":"]), (["f", "o", "o"], ["b", "a", "r"]))
    }

    static var allTests = [
        ("testPick", testPick),
        ("testSplitAround", testSplitAround),
    ]
}

