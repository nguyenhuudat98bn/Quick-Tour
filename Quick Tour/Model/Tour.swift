//
//  Tour.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
class Tour {
    var country: String
    var photoCountry: UIImage?
    var rating: Int
    var tour: String
    var ticket: String
    var tourGuide: String
    var name: String
    var top: String
    init?(country: String, photoCountry: UIImage?, rating: Int, tour: String, ticket: String, tourGuide: String, name: String , top: String ) {
        guard !name.isEmpty else {
            return nil
        }
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        self.country = country
        self.photoCountry = photoCountry
        self.rating = rating
        self.tour = tour
        self.ticket = ticket
        self.tourGuide = tourGuide
        self.name = name
        self.top = top
    }
}
