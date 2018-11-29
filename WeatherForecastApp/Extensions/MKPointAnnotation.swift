//
//  MKPointAnnotation.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//
import Foundation
import MapKit

var AssociatedObjectKey: UInt8 = 7

extension MKPointAnnotation {
    var cityName: String? {
        get
        {
            return objc_getAssociatedObject(self, &AssociatedObjectKey) as? String ?? nil
        }
        
        set
        {
            var propertyVal : String? = nil
            if let value = newValue
            {
                propertyVal = value
            }
            objc_setAssociatedObject(self, &AssociatedObjectKey, propertyVal, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    convenience init(with cityName: String, coordinate: CLLocationCoordinate2D) {
        self.init()
        self.cityName = cityName
        self.coordinate = coordinate
    }
}
