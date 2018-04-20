//
//  FbErrorTests.swift
//  StationTimeTableTests
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import XCTest
@testable import StationTimeTable

class FbErrorTests: XCTestCase {
    
    private let errorDescription = "Some error description"
    private let errorCode = 100
    
    func testFbErrorVariables() {
        let error = FbError(description: errorDescription, code: errorCode)
        XCTAssertNotNil(error)
        XCTAssertEqual(error.description, errorDescription)
        XCTAssertEqual(error.code, errorCode)
    }
    
    func testFbErrorCodeNil() {
        let error = FbError(description: errorDescription)
        XCTAssertNotNil(error)
        XCTAssertEqual(error.description, errorDescription)
        XCTAssertNil(error.code)
    }
}
