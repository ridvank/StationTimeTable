//
//  StationInfo.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

struct StationInfo: Mappable {
    var timetable: TimeTable?
    var station: Station?
    
    init(timetable: TimeTable? = nil, station: Station? = nil) {
        self.timetable = timetable
        self.station = station
    }
}
