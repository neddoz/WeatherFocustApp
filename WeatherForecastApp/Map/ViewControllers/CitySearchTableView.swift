//
//  CitySearchTableView.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit
import MapKit

class CitySearchTableView: UITableViewController {

    weak var handleMapSearchDelegate: MapSearch?
    var matchingItems: [MKMapItem] = []
    var mapView: MKMapView?

    init(with style: UITableViewStyle) {
        super.init(style: style)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
