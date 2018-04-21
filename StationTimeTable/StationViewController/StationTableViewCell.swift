//
//  StationTableViewCell.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 21.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import UIKit

class StationTableViewCell: UITableViewCell {

    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var lineInfoLabel: UILabel!
    @IBOutlet weak var routeLabel: UILabel!
    
    var item: Showable? {
        didSet {
            guard let item = item else { return }
            reloadData(item: item)
        }
    }
    
    func reloadData(item: Showable) {
        hourLabel.text = Utils.toHour(from: item.datetime.timestamp, timezone: item.datetime.tz)
        lineInfoLabel.text = item.line_direction
        routeLabel.text = item.through_the_stations
    }
}
