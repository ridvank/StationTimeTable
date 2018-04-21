//
//  StationViewModel.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import Foundation

class StationViewModel {
    
    enum SortType: String {
        case arrival = "Arrival"
        case departure = "Departure"
    }
    
    private var stationProvider = StationProvider()
    private var stationInfo = StationInfo()
    private var type: SortType = .arrival {
        didSet {
            onComplete?()
        }
    }
    
    var onComplete: (() -> ())?
    var onError: ((FbError) -> ())?
    
    init(stationProvider: StationProvider = StationProvider(), stationInfo: StationInfo = StationInfo()) {
        self.stationProvider = stationProvider
        self.stationInfo = stationInfo
    }
    
    func fetchStationInfo() {
        stationProvider.stationTimetable(id: 1, success: { (stationInfo) in
            self.stationInfo = stationInfo
            self.onComplete?()
        }) { (error) in
            self.onError?(error)
        }
    }
    
    func numberOfRows() -> Int {
        switch type {
        case .arrival:
            return stationInfo.timetable?.arrivals.count ?? 0
        case .departure:
            return stationInfo.timetable?.departures.count ?? 0
        }
    }
    
    func item(at indexPath: IndexPath) -> Showable? {
        switch type {
        case .arrival:
            return stationInfo.timetable?.arrivals[indexPath.row]
        case .departure:
             return stationInfo.timetable?.departures[indexPath.row]
        }
    }
    
    func headerTitle() -> String? {
        switch type {
        case .arrival:
            guard let firstDateTime = stationInfo.timetable?.arrivals.first?.datetime else { return nil }
            return Utils.toDateString(from: firstDateTime.timestamp, timezone: firstDateTime.tz)
        default:
            guard let firstDateTime = stationInfo.timetable?.departures.first?.datetime else { return nil }
            return Utils.toDateString(from: firstDateTime.timestamp, timezone: firstDateTime.tz)
        }
    }
    
    func toggle() {
        type = type == .arrival ? .departure : .arrival
    }
    
    func title() -> String {
        guard let stationName = stationInfo.station?.name else { return "" }
        return stationName + " " + type.rawValue
    }
    
}
