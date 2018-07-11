//
//  Weather.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/5/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import Foundation

class Weather {
    var forecastDays: [ForeCastDay] = []    
    init(dict: DICT) {
        let forecast = dict["forecast"] as? DICT ?? [:]
        print(forecast)
        let forecastday = forecast["forecastday"] as? [DICT] ?? []
        print(forecastday)
        for data in forecastday {
            forecastDays.append(ForeCastDay(dict: data))
        }
    }
}
