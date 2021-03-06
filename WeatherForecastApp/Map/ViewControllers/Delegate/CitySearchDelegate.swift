//
//  CitySearchDelegate.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation
import MapKit

extension CitySearchTableView: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let _ = self.mapView,
            let searchBarText = searchController.searchBar.text else { return }
        
        let request = MKLocalSearchRequest()
        request.naturalLanguageQuery = searchBarText
        let search = MKLocalSearch(request: request)
        
        search.start { [weak self] response, _ in
            guard let response = response else {
                return
            }
            self?.matchingItems = response.mapItems
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension CitySearchTableView {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedItem = matchingItems[indexPath.row].placemark
        handleMapSearchDelegate?.dropPinZoomIn(placemark: selectedItem)
        dismiss(animated: true, completion: nil)
    }
}

