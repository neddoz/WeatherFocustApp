//
//  APIResource.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation
import CoreLocation

fileprivate let BASE_URL = "api.openweathermap.org/data/2.5/weather"

/// Endpoints
enum ApiResource {

    case weather(location: CLLocation)

    var endpoint: String {
        switch self {
        case .weather(location: let location):
            return "?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)"
        }
    }
}
