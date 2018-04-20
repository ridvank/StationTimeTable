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
    
}
