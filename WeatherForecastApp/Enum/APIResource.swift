//
//  APIResource.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation
import CoreLocation

fileprivate let BASE_URL = "http://api.openweathermap.org/data/2.5/weather"
fileprivate let API_KEY = "6bc46e95e89db804c73f88bc96ca7776"

/// Endpoints
enum ApiResource {

    case weather(location: CLLocation)

    var endpoint: String {
        switch self {
        case .weather(location: let location):
            return "\(BASE_URL)?lat=\(location.coordinate.latitude)&lon=\(location.coordinate.longitude)&APPID=\(API_KEY )"
        }
    }
}
