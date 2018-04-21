//
//  ViewController.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 20.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import UIKit

class StationViewController: BaseViewController {

    @IBOutlet weak var stationTableView: UITableView! {
        didSet {
            stationTableView.rowHeight = UITableViewAutomaticDimension
            stationTableView.estimatedRowHeight = 80
        }
    }
    
    let viewModel = StationViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
        viewModel.fetchStationInfo()
        edgesForExtendedLayout = .init(rawValue: 0)
    }
    
    //MARK: Actions
    @IBAction func toggleButtonPressed(_ sender: Any) {
        viewModel.toggle()
    }
}

//MARK: UITableViewDelegate
extension StationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return viewModel.headerTitle()
    }
}

//MARK: UITableViewDataSource
extension StationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: StationTableViewCell.self, at: indexPath)
        cell.item = viewModel.item(at: indexPath)
        return cell
    }
}

//MARK: Binding
extension StationViewController {
    func bindViewModel() {
        viewModel.onComplete = { [weak self] in
            self?.stationTableView.reloadData()
            self?.title = self?.viewModel.title()
        }
        viewModel.onError = { [weak self] error in
            self?.show(error: error)
        }
    }
}
