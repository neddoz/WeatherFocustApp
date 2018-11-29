//
//  Weather.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

struct WeatherItem {
    
    struct Key {
        static let coordinate = "coord"
        static let city = "city"
        static let country = "country"
        static let cod = "cod"
        static let message = "message"
        static let list = "list"
    }
    
    var coordinate: WeatherItemCooordinate
    var city: City
    var country: String
    var cod: String
    var message: NSNumber
    var list: [WeatherListItem]
    
    init(json: JSON) {
        
        self.coordinate = WeatherItemCooordinate(json: json[Key.coordinate] as? JSON ?? [:])
        self.city = City(json: json[Key.city] as? JSON ?? [:])
        self.country = json[Key.country] as? String ?? ""
        self.cod = json[Key.cod] as? String ?? ""
        self.message = json[Key.message] as? NSNumber ?? 0
        let jsonList = json[Key.list] as? [JSON] ?? []
        self.list = jsonList.map{return WeatherListItem(json: $0)}
    }
}

/// City Object
extension WeatherItem {
    
    struct City {
        struct Key {
            static let id = "id"
            static let name = "name"
        }
        
        var id: NSNumber
        var name: String
        
        init(json: JSON) {
            self.id = json[Key.id] as? NSNumber ?? 0
            self.name = json[Key.name] as? String ?? ""
        }
    }
}

// Weather List
extension WeatherItem {
    
    struct WeatherItemCooordinate {
        struct Key {
            static let lat = "lat"
            static let lon = "lon"
        }

        var lat: NSNumber
        var lon: NSNumber

        init(json: JSON) {
            self.lat = json[Key.lat] as? NSNumber ?? 0
            self.lon = json[Key.lon] as? NSNumber ?? 0
        }
    }
}

// Weather List
extension WeatherItem {
    
    struct WeatherListItem {
        struct Key {
            static let dt = "dt"
            static let main = "main"
            static let weather = "weather"
            static let clouds = "clouds"
            static let wind = "wind"
            static let sys = "humidity"
            static let dtTxt = "dt_txt"
        }
        
        var dt: NSNumber
        var main: Main
        var weather: [Weather]
        var clouds: Cloud
        var wind: Wind
        var sys: Sys
        var dtTxt: String
        
        init(json: JSON) {
            self.dt = json[Key.dt] as? NSNumber ?? 0
            self.main = Main(json: json[Key.main] as? JSON ?? [:])
            let jsonList = json[Key.weather] as? [JSON] ?? []
            self.weather = jsonList.map{return Weather(json: $0)}
            self.clouds = Cloud(json: json[Key.clouds] as? JSON ?? [:])
            self.wind = Wind.init(json: json[Key.wind] as? JSON ?? [:])
            self.sys = Sys(json: json[Key.sys] as? JSON ?? [:])
            self.dtTxt = json[Key.dtTxt] as? String ?? ""
        }
    }
}

// Wind Object
extension WeatherItem {
    
    struct Sys {
        
        struct Key {
            static let pod = "pod"
        }

        var pod: String

        init(json: JSON) {
            self.pod = json[Key.pod] as? String ?? ""
        }
    }
}

// Wind Object
extension WeatherItem {
    
    struct Wind {

        struct Key {
            static let speed = "speed"
            static let deg = "speed"
        }

        var speed: NSNumber
        var deg: NSNumber
        
        init(json: JSON) {
            self.speed = json[Key.speed] as? NSNumber ?? 0
            self.deg = json[Key.deg] as? NSNumber ?? 0
        }
    }
}
// Cloud Object
extension WeatherItem {

    struct Cloud {

        struct Key {
            static let all = "all"
        }

        var all: NSNumber

        init(json: JSON) {
            self.all = json[Key.all] as? NSNumber ?? 0
        }
    }
}
// Main Object
extension WeatherItem {
    
    struct Main {
        struct Key {
            static let temp = "temp"
            static let tempMin = "temp_min"
            static let tempMax = "temp_max"
            static let presssure = "pressure"
            static let seaLevel = "sea_level"
            static let grindLevel = "grnd_level"
            static let humidity = "humidity"
            static let tempKf = "temp_kf"
        }
        
        var temp: NSNumber
        var tempMin: NSNumber
        var tempMax: NSNumber
        var presssure: NSNumber
        var seaLevel: NSNumber
        var grindLevel: NSNumber
        var humidity: NSNumber
        var tempKf: NSNumber
        
        /// This can be done using Codable protocol. I just like being manual
        init(json: JSON) {
            self.temp = json[Key.temp] as? NSNumber ?? 0
            self.tempMin = json[Key.tempMin] as? NSNumber ?? 0
            self.tempMax = json[Key.tempMax] as? NSNumber ?? 0
            self.presssure = json[Key.presssure] as? NSNumber ?? 0
            self.seaLevel = json[Key.seaLevel] as? NSNumber ?? 0
            self.grindLevel = json[Key.grindLevel] as? NSNumber ?? 0
            self.humidity = json[Key.humidity] as? NSNumber ?? 0
            self.tempKf = json[Key.tempKf] as? NSNumber ?? 0
        }
    }
}

/// Weather Object
extension WeatherItem {
    
    struct Weather {

        struct Key {
            static let id = "id"
            static let main = "main"
            static let clouds = "clouds"
            static let description = "description"
            static let icon = "icon"
        }

        var id: NSNumber
        var main: String
        var clouds: String
        var description: String
        var icon: String

        init(json: JSON) {
            self.id = json[Key.id] as? NSNumber ?? 0
            self.main = json[Key.main] as? String ?? ""
            self.description = json[Key.description] as? String ?? ""
            self.clouds = json[Key.clouds] as? String ?? ""
            self.icon = json[Key.icon] as? String ?? ""
    }
}
}
