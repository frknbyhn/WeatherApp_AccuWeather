//
//  NetworkError.swift
//  AccuWeather
//
//  Created by Bertug YILMAZ on 9.08.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case failure(_ message: String)
    case badRequest
    case serverIsNotResponding
    
    var localizedDescription: String {
        switch self {
        case .failure(let message):
            return message
        case .badRequest:
            return "Bad Request"
        case .serverIsNotResponding:
            return "Server is not responding"
        }
    }
}
