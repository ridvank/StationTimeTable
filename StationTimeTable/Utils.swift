//
//  Utils.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import UIKit

class Utils {
    /// Convert JSON to Data
    ///
    /// - Parameter json: json to be converted to data
    /// - Returns: converted data
    static func data(from json: [String : AnyObject]) throws -> Data {
        let data: Data
        do {
            data =  try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        } catch let error {
            throw error
        }
        return data
    }
    
    static func toHour(from timeInterval: TimeInterval, timezone: String) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timezone)
        dateFormatter.dateFormat = "h:mm"
        return dateFormatter.string(from: date)
    }
    
    static func toDateString(from timeInterval: TimeInterval, timezone: String) -> String {
        let date = Date(timeIntervalSince1970: timeInterval)
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(abbreviation: timezone)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        return dateFormatter.string(from: date)
    }
    
}
