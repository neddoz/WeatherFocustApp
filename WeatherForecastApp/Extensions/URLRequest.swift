//
//  URLRequest.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

extension URLRequest {
    
    init<T>(resource: Resource<T>) {
        
        self.init(url: resource.url as URL)
        
        self.addValue("application/json", forHTTPHeaderField: "Content-Type")
        self.addValue("application/json", forHTTPHeaderField: "Accept")
        httpMethod = resource.method.name
        
        if case let .post(data) = resource.method {
            httpBody = data as Data
        }
        
        if case let .put(data) = resource.method {
            httpBody = data as Data
        }
    }
}
