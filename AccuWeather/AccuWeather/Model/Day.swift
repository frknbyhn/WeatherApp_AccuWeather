//
//  Day.swift
//  AccuWeather
//
//  Created by Furkan Beyhan on 6.03.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation
import UIKit

enum IconPhraseType: String, Codable {
    case intermittentClouds = "Intermittent clouds"
    case partlyCloudy = "Partly cloudy"
    case clear = "Clear"
    case mostlySunny = "Mostly sunny"
    case mostlyCloudy = "Mostly cloudy"
    case sunny = "Sunny"
    case showers = "Showers"
    
    var description: String {
        return self.rawValue
    }
    
    var icon: UIImage {
        switch self {
        case .clear:
            return #imageLiteral(resourceName: "mostly sunny")
        case .intermittentClouds:
            return #imageLiteral(resourceName: "cloudy")
        case .mostlyCloudy:
            return #imageLiteral(resourceName: "cloudywithshower")
        case .mostlySunny:
            return #imageLiteral(resourceName: "mostly sunny")
        case .partlyCloudy:
            return #imageLiteral(resourceName: "partly cloudy")
        case .showers:
            return #imageLiteral(resourceName: "cloudywithshower.png")
        case .sunny:
            return #imageLiteral(resourceName: "mostly sunny")
        }
    }
}

struct Day: Codable {
    let IconPhrase: IconPhraseType
}
