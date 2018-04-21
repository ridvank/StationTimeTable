//
//  BaseViewController.swift
//  StationTimeTable
//
//  Created by Ridvan Kuccuk on 21.04.2018.
//  Copyright © 2018 Ridvan Kuccuk. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func show(error: FbError) {
        let alertController: UIAlertController = UIAlertController(title: "Error", message: error.description, preferredStyle: .alert)
        let okAction: UIAlertAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
