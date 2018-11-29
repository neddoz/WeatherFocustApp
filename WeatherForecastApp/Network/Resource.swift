//
//  Resource.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation

enum HTTPMethod<Body>{
    case get
    case post(Body)
    case put(Body)
    case patch(Body)
    case delete
}

enum JSONError: String, Error {
    case NoData = "ERROR: no data"
    case ConversionFailed = "ERROR: conversion from JSON failed"
}

extension HTTPMethod{
    
    var name: String{
        switch self{
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .put:
            return "PUT"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
    
    func map<B>(_ f: (Body) -> B)-> HTTPMethod<B>{
        
        switch self {
        case .get:
            return .get
        case .post(let body):
            return .post(f(body))
        case .put(let body):
            return .put(f(body))
        case .patch(let body):
            return .patch(f(body))
        case .delete:
            return .delete
        }
        
    }
    
}
struct Resource<T> {
    
    let url: URL
    let method: HTTPMethod<Data>
    let parse: (Data) -> T?
}

extension Resource{
    
    init(url: URL, method: HTTPMethod<Any>, parseJSON: @escaping (Any) -> T?) {
        self.url = url
        self.method = method.map{ json in
            print("JSON to be serialized: \(json)")
            
            print("is json valid: \(JSONSerialization.isValidJSONObject(json))")
            guard let serializedJSON = try? JSONSerialization.data(withJSONObject: json, options: []) else { fatalError(JSONError.ConversionFailed.rawValue) }
            
            return serializedJSON
        }
        
        // Serializes the JSON and returns it as a serialized object
        self.parse = { data in
            let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions())
            return json.flatMap(parseJSON)
        }
    }
    
}
