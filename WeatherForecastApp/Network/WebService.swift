//
//  WebService.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

public typealias JSON = [String: Any]

final class Webservice {
    
    static func call<T>(_ resource: Resource<T>, completion: @escaping ( _ object: T? , _ response: URLResponse?, _ error: Error?)-> Void) {
        let request = URLRequest(resource: resource)
        URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
            let object: T? = data.flatMap(resource.parse)
            completion(object, response, error)
        }) .resume()
    }
}
