//
//  BookMarksDataSource.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit

extension BookMarksTableView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: InfoDisplayCell.nibName, for: indexPath) as? InfoDisplayCell else {return UITableViewCell()}
        if let place = viewModel.place(for: indexPath.row) {
            cell.configure(with: place.title, and: place.additionalInfo)
        }
        return cell
    }
}
