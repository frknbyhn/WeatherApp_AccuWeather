//
//  NetworkServices.swift
//  AccuWeather
//
//  Created by Bertug YILMAZ on 8.08.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkServices {
    case forecasts(_ locationId: String)
}

extension NetworkServices {
    enum Key: String {
        case apikey
    }
}

extension NetworkServices : NetworkTarget {
    var baseURL: URL? {
        return URL(string: "http://dataservice.accuweather.com")
    }
    
    var path: String {
        switch self {
        case .forecasts(let locationId):
            return "forecasts/v1/daily/5day/\(locationId)"
        }
    }
    
    var url: URL {
        switch self {
        case .forecasts(_):
            return URL(string: self.path, relativeTo: self.baseURL)!
        }
    }
    
    var httpMethod: HTTPMethod {
        switch self {
        case .forecasts(_):
            return .get
        }
    }
    
    var headers: HTTPHeaders {
        return [:]
    }
    
    var parameters: Parameters {
        switch self {
        case .forecasts(_):
            return [NetworkServices.Key.apikey.rawValue : Constants.apiKey]
        }
    }
}
