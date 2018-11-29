//
//  URLResponse.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import Foundation
extension URLResponse{
    /// Description of the HTTSStatus of a response.
    public enum HTTPStatus{
        public enum description{
            case success
            case created
            case badRequest
            case unauthorized
            case forbidden
            case notFound
            case conflict
            case serverError
            case other
        }
        
        case code(Int)
        
        var status: description{
            switch self{
            case .code(200...299):
                return .success
            case .code(400):
                return .badRequest
            case .code(401):
                return .unauthorized
            case .code(403):
                return .forbidden
            case .code(404):
                return .notFound
            case .code(409):
                return .conflict
            case .code(500...599):
                return .serverError
            default:
                return .other
            }
        }
    }
    
    var status: HTTPStatus.description {
        let response = self as? HTTPURLResponse ?? HTTPURLResponse()
        
        let statusCode = HTTPStatus.code(response.statusCode).status
        return statusCode
    }
    
}
