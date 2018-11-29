//
//  MapViewController.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!

    var selectedPin: MKPlacemark?
    var resultSearchController: UISearchController!
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureMap()
        mapView.delegate = self
        configureSearchBar()
        configureLocationManager()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "Your Bookmarks", style: .plain, target: self, action: #selector(showBookMarks))
    }

    private func configureMap() {
        mapView.showsPointsOfInterest = true
    }

    @objc private func showBookMarks() {
        let Vc = BookMarksTableView.instantiate(from: AppStoryBoards.BookMarks)
        navigationController?.pushViewController(Vc, animated: true)
    }

    private func configureLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    
    private func configureSearchBar() {
        let locationSearchTable = CitySearchTableView(with: .plain)
        resultSearchController = UISearchController(searchResultsController: locationSearchTable)
        resultSearchController.searchResultsUpdater = locationSearchTable
        let searchBar = resultSearchController!.searchBar
        searchBar.sizeToFit()
        searchBar.placeholder = "Search for cities"
        navigationItem.titleView = resultSearchController?.searchBar
        resultSearchController.hidesNavigationBarDuringPresentation = false
        resultSearchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        locationSearchTable.mapView = mapView
        locationSearchTable.handleMapSearchDelegate = self
    }
}
