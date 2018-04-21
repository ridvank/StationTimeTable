//
//  StationProviderTests.swift
//  StationTimeTableTests
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import XCTest
@testable import StationTimeTable

class StationProviderTests: XCTestCase {
    
    let stationProvider = StationProvider()
    
    func testStationInfo() {
        let expect = expectation(description: "StationInfo test")
        stationProvider.stationTimetable(id: 1, success: { (stationInfo) in
            XCTAssertNotNil(stationInfo)
            expect.fulfill()
        }) { (error) in
            XCTFail(error.description)
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
}
