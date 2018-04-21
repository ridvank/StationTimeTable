//
//  Mappable.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import Foundation

protocol Mappable: Codable {
    init(json: [String : AnyObject]) throws
    func serialize() throws -> Parameters?
}

extension Mappable {
    init(json: [String : AnyObject]) throws {
        do {
            self = try JSONDecoder().decode(Self.self, from: Utils.data(from: json))
        } catch let error {
            throw error
        }
    }
    func serialize() throws -> Parameters? {
        var parameters: Parameters?
        do {
            let jsonString = try String(data: JSONEncoder().encode(self), encoding: .utf8)
            parameters = try jsonString?.toDictionary()
        } catch let error {
            throw error
        }
        return parameters
    }
}
