//
//  FbError.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import Foundation

public struct FbError: Error {
    var description: String
    var code: Int?
    
    init(description: String, code: Int? = nil) {
        self.description = description
        self.code = code
    }
    
}
