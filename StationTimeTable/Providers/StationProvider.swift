//
//  StationProvider.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

class StationProvider: Provider {
    func stationTimetable(id: Int, success: ((StationInfo) -> ())?, failure: Failure?) {
        get(path: "/mobile/v1/network/station/1/timetable", parameters: nil, success: { (response) in
            guard let responseJson = response as? [String : AnyObject] else {
                failure?(FbError(description: "Station Timetable response error occured"))
                return
            }
            do {
                let stationInfo: StationInfo = try StationInfo(json: responseJson)
                success?(stationInfo)
            } catch let error {
                print("StationInfo decode error -> \(error.localizedDescription)")
            }
        }, failure: failure)
    }
}
