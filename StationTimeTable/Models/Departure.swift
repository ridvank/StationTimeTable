//
//  Departure.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

struct Departure: Mappable, Showable {
    var through_the_stations: String
    var datetime: DateTime
    var line_direction: String
    var route: [Route]
    var ride_id: UInt
    var trip_uid: String
    var line_code: String
    var direction: String
}
