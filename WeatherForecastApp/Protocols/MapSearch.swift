//
//  MapSearch.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation
import MapKit

protocol MapSearch: class {
    func dropPinZoomIn(placemark: MKPlacemark)
}
