//
//  BoosMarksTableViewDelegate.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit
import CoreLocation

extension BookMarksTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let place = viewModel.place(for: indexPath.row) else {return}
        let coordinate =  CLLocation(latitude: CLLocationDegrees(exactly: place.lat) ?? 0,
                                     longitude: CLLocationDegrees(exactly: place.lon) ?? 0)
        guard let resource = Place.weather(for: coordinate) else {return}
        Webservice.call(resource) { [weak self] result, response, error in
            guard let item = result, response?.status == Optional(.success), error == nil else {
                return
            }
            DispatchQueue.main.async {
                let viewModel = WeatherForeCastViewModel(with: item)
                let VC = WeatherForecastTableView(with: viewModel)
                self?.navigationController?.pushViewController(VC, animated: true)
            }
        }
    }
}
