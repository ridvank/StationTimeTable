
//
//  String.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import UIKit

extension String {
    func toDictionary() throws -> [String : AnyObject] {
        guard let data = data(using: String.Encoding.utf8) else {
            throw FbError(description: "Utf8 Encoding Error")
        }
        var json: [String : AnyObject]
        do {
            json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as! [String : AnyObject]
        } catch let error {
            throw(error)
        }
        return json
    }
}
