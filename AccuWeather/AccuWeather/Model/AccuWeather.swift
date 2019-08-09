//
//  AccuWeather.swift
//  AccuWeather
//
//  Created by Furkan Beyhan on 6.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation

struct AccuWeather : Codable {
    let Headline : Headline
    let DailyForecasts : [DailyForecasts]    
}
