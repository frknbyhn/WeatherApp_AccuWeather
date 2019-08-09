//
//  Minimum.swift
//  AccuWeather
//
//  Created by Furkan Beyhan on 6.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation

struct Minimum : Codable{
    let Value : Double
    
    var celciusValue: String {
        return self.Value.toCelcius().toString()
    }
}
