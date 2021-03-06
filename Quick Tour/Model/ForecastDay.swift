//
//  ForecastDay.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/5/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import Foundation

struct ForeCastDay {
    var icon: String
    var maxtemp_c: Double
    var mintemp_c: Double
    var date_epoch: TimeInterval
    init(dict: DICT) {
        date_epoch = dict["date_epoch"] as? TimeInterval ?? -1
        let day = dict["day"] as? DICT ?? [:]
        maxtemp_c = day["maxtemp_c"] as? Double ?? -1000
        mintemp_c = day["mintemp_c"] as? Double ?? -1000
        let condition = day["condition"] as? DICT ?? [:]
        icon = "http:" + (condition["icon"] as? String ?? "-1")
    }
}

