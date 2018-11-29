//
//  BookMarksTableView.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit

class BookMarksTableView: UIViewController {

    var viewModel: BookMarksViewModel = .init()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.title = "Click to view Weather Forecast"
        tableView.register(InfoDisplayCell.nib, forCellReuseIdentifier: InfoDisplayCell.nibName)
    }
}
