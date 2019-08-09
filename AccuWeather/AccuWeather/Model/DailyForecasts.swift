//
//  DailyForecasts.swift
//  AccuWeather
//
//  Created by Furkan Beyhan on 6.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation

struct DailyForecasts : Codable {
    // 2019-08-09T07:00:00+03:00
    // TODO: Convert to date object
    let Date : String
    let Temperature : Temperature
    let Day : Day
    let Night : Night
}
