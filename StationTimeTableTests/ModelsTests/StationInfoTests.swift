//
//  StationInfoTests.swift
//  StationTimeTableTests
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import XCTest
@testable import StationTimeTable

class StationInfoTests: XCTestCase {
    
    static func createMockStationInfo() -> StationInfo {
        let departure = Departure(through_the_stations: "Through the station", datetime: DateTime(timestamp: 1524292800, tz: "GMT+03:00"), line_direction: "line direction departure", route: [Route(id: 1, name: "route 1", default_address: DefaultAddress(address: "Route 1 default address", full_address: "Route 1 full adress", coordinates: Coordinate(latitude: 1123123, longitude: 5141231)), address: "route 1 address", full_address: "route 1 full address"), Route(id: 2, name: "route 2", default_address: DefaultAddress(address: "Route 2 default address", full_address: "Route 2 full address", coordinates: Coordinate(latitude: 1123123, longitude: 5141231)), address: "route 2 address", full_address: "route 2 full address")], ride_id: 1, trip_uid: "1", line_code: "departure 1 line code", direction: "departure 1 direction")
        
        let arrival = Arrival(through_the_stations: "Arrival through the station", datetime: DateTime(timestamp: 1524292800, tz: "GMT+03:00"), line_direction: "Arrival line direction", route: [Route(id: 1, name: "route 1", default_address: DefaultAddress(address: "Route 1 default address", full_address: "Route 1 full adress", coordinates: Coordinate(latitude: 1123123, longitude: 5141231)), address: "route 1 address", full_address: "route 1 full address"), Route(id: 2, name: "route 2", default_address: DefaultAddress(address: "Route 2 default address", full_address: "Route 2 full address", coordinates: Coordinate(latitude: 1123123, longitude: 5141231)), address: "route 2 address", full_address: "route 2 full address")], ride_id: 23, trip_uid: "23", line_code: "arrival line code", direction: "arrival departure")
        
        
        let timeTable = TimeTable(arrivals: [arrival, arrival], departures: [departure, departure, departure])
        
        let station = Station(id: 1, name: "station 1", default_address: DefaultAddress(address: "station 1 address", full_address: "station 1 full address", coordinates: Coordinate(latitude: 123123, longitude: 42343)), address: "station 1 address", full_address: "station 1 full address", coordinates: Coordinate(latitude: 123123, longitude: 42343))
        
        return StationInfo(timetable: timeTable, station: station)
    }
    
    func testStationInfo() {
        
        let stationInfo = StationInfoTests.createMockStationInfo()
        
        XCTAssertNotNil(stationInfo)
        XCTAssertNotNil(stationInfo.station)
        XCTAssertNotNil(stationInfo.timetable)
        
        XCTAssertEqual(stationInfo.station?.address, "station 1 address")
        XCTAssertEqual(stationInfo.station?.coordinates, Coordinate(latitude: 123123, longitude: 42343))
        XCTAssertEqual(stationInfo.station?.id, 1)
        XCTAssertEqual(stationInfo.station?.name, "station 1")
    }
    
    func testDateTimeSerialize() {
        let dateTime = DateTime(timestamp: 12345, tz: "tz")
        do {
            let json = try dateTime.serialize()
            XCTAssertNotNil(json)
            XCTAssertEqual(json!["timestamp"] as! Int, 12345)
            XCTAssertEqual(json!["tz"] as! String, "tz")
        } catch let error {
            XCTFail(error.localizedDescription)
        }
    }
    
}
