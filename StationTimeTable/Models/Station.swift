//
//  Station.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import Foundation

struct Station: Mappable {
    var id: UInt
    var name: String
    var default_address: DefaultAddress
    var address: String
    var full_address: String
    var coordinates: Coordinate
}

struct DateTime: Mappable {
    var timestamp: TimeInterval
    var tz: String
}

struct Route: Mappable {
    var id: UInt
    var name: String
    var default_address: DefaultAddress
    var address: String
    var full_address: String
}

struct DefaultAddress: Mappable {
    var address: String
    var full_address: String
    var coordinates: Coordinate
}

struct Coordinate: Mappable {
    var latitude: Float
    var longitude: Float
}
