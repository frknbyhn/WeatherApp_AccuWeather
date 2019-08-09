//
//  URLQueryItems+Extensions.swift
//  AccuWeather
//
//  Created by Bertug YILMAZ on 8.08.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation

extension URLQueryItem {
    static func generate(with params: Dictionary<String,Any>) -> [URLQueryItem]? {
        // Preapre Query URL
        if params.count > 0 {
            
            var queryItems: [URLQueryItem] = []
            params.forEach { (key, value) in
                queryItems.append(URLQueryItem(name: key, value: "\(value)"))
            }
            return queryItems
        }
        return nil
    }
}
