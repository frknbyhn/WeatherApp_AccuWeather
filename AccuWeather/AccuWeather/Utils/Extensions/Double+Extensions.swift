//
//  Double+Extensions.swift
//  AccuWeather
//
//  Created by Bertug YILMAZ on 9.08.2019.
//  Copyright © 2019 Furkan Beyhan. All rights reserved.
//

import Foundation

extension Double {
    
    func toString() -> String{
        return "\(self)"
    }
    
    func toCelcius() -> Double {
        return ((self - 32) / 1.8).roundToPlaces(1)
    }
    
    func roundToPlaces(_ places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        
        return Darwin.round(self * divisor) / divisor
    }
}
