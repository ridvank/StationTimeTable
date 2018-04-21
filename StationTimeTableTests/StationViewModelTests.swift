//
//  StationViewModelTests.swift
//  StationTimeTableTests
//
//  Created by Ridvan Kuccuk on 21.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import XCTest
@testable import StationTimeTable

class StationViewModelTests: XCTestCase {
    
    var stationViewModel: StationViewModel!
    
    override func setUp() {
        super.setUp()
        stationViewModel = StationViewModel(stationProvider: StationProvider(), stationInfo: StationInfoTests.createMockStationInfo())
    }
    
    func testNumberOfRows() {
        let itemCount = stationViewModel.numberOfRows()
        XCTAssertEqual(itemCount, 2)
    }
    
    func testToggle() {
        stationViewModel.toggle()
        let itemCount = stationViewModel.numberOfRows()
        XCTAssertEqual(itemCount, 3)
    }
    
    func testHeaderTitle() {
        let headerTitle = stationViewModel.headerTitle()
        XCTAssertEqual(headerTitle, "21/04/2018")
    }
    
    func testToggledHeaderTitle() {
        stationViewModel.toggle()
        let headerTitle = stationViewModel.headerTitle()
        XCTAssertEqual(headerTitle, "21/04/2018")
    }
    
    func testTitle() {
        let title = stationViewModel.title()
        XCTAssertEqual(title, "station 1 Arrival")
    }
    
    func testToggleTestTitle() {
        stationViewModel.toggle()
        let title = stationViewModel.title()
        XCTAssertEqual(title, "station 1 Departure")
    }
    
    func testItem() {
        let item = stationViewModel.item(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.line_direction, "Arrival line direction")
        XCTAssertEqual(item?.through_the_stations, "Arrival through the station")
    }
    
    func testToggledItem() {
        stationViewModel.toggle()
        let item = stationViewModel.item(at: IndexPath(row: 0, section: 0))
        XCTAssertNotNil(item)
        XCTAssertEqual(item?.line_direction, "line direction departure")
        XCTAssertEqual(item?.through_the_stations, "Through the station")
    }
    
    func testFetchStationInfo() {
        let expect = expectation(description: "Fetch StationInfo test")
        stationViewModel.fetchStationInfo()
        stationViewModel.onComplete = {
            expect.fulfill()
        }
        waitForExpectations(timeout: 5, handler: nil)
    }
    
}
