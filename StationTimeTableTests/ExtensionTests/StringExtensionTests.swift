//
//  StringExtensionTests.swift
//  StationTimeTableTests
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import XCTest
@testable import StationTimeTable

class StringExtensionTests: XCTestCase {
    
    func stringToDictonaryTest() {
        let jsonString = "{\"timestamp\":1524166800,\"tz\":\"GMT+02:00"
        let dictionary = try! jsonString.toDictionary()
        XCTAssertEqual(dictionary["dictionary"] as! Int, 1524166800)
        XCTAssertEqual(dictionary["tz"] as! String, "GMT+02:00")
    }
    
    func testToDictionaryFail() {
        let jsonString = "{Hello"
        do {
            let json = try jsonString.toDictionary()
            XCTAssertNotNil(json)
        } catch let error {
            XCTAssertNotNil(error)
        }
    }
    
    func testToDictionaryEncodingFail() {
        let someString = String(
            bytes: [0xD8, 0x00] as [UInt8],
            encoding: String.Encoding.utf16BigEndian)!
        do {
            let json = try someString.toDictionary()
            XCTAssertNotNil(json)
        } catch let error {
            XCTAssertNotNil(error)
        }
    }
    
}
