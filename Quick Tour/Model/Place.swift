//
//  PlacesVietnam.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/9/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import Foundation
class Place {
    var name: String
    var image: String
    var content: String
    init(dict: DICT) {
        name = dict["name"] as? String ?? "-1"
        image = dict["image"] as? String ?? "-1"
        content = dict["content"] as? String ?? "-1"
    }
}
