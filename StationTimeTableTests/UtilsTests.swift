//
//  UtilsTests.swift
//  StationTimeTableTests
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import XCTest
@testable import StationTimeTable

class UtilsTests: XCTestCase {
    
    func testJsonToDataSuccess() {
        let mockJson: [String : Any] = ["hello" : "there"]
        do {
            let data = try Utils.data(from: mockJson as [String : AnyObject])
            XCTAssertNotNil(data)
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
    func testJsonToDataFail() {
        let someString = String(
            bytes: [0xD8, 0x00] as [UInt8],
            encoding: String.Encoding.utf16BigEndian)!
        
        let mockJson = ["hello" : someString]
        do {
            let data = try Utils.data(from: mockJson as [String : AnyObject])
            XCTAssertNil(data)
        } catch let error {
            XCTAssertNotNil(error)
        }
    }
    
}
