//
//  NetworkTarget.swift
//  AccuWeather
//
//  Created by Bertug YILMAZ on 9.08.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkTarget {
    var baseURL: URL? { get }
    var url: URL { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var headers: HTTPHeaders { get }
    var parameters: Parameters { get }
}
