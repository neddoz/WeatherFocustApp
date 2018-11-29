//
//  StorablePlace.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, NSCoding  {
    var lat: NSNumber
    var lon: NSNumber
    var title: String
    var additionalInfo: String
    
    init(annotation: MKPointAnnotation) {
        self.lat = NSNumber(value: annotation.coordinate.latitude)
        self.lon = NSNumber(value: annotation.coordinate.longitude)
        self.title = annotation.title ?? ""
        self.additionalInfo = ""
    }

    init(lat: NSNumber, lon: NSNumber, title: String, additionalInfo: String) {
        self.lat = lat
        self.lon = lon
        self.title = title
        self.additionalInfo = additionalInfo
    }

    required convenience init(coder aDecoder: NSCoder) {
        let lat = aDecoder.decodeObject(forKey: "lat") as! NSNumber
        let lon = aDecoder.decodeObject(forKey: "lon") as! NSNumber
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let info = aDecoder.decodeObject(forKey: "info") as! String
        self.init(lat: lat, lon: lon, title: title, additionalInfo: info)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(lat, forKey: "lat")
        aCoder.encode(lon, forKey: "lon")
        aCoder.encode(title, forKey: "title")
        aCoder.encode(title, forKey: "info")
    }
}
