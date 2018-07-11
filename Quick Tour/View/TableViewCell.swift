//
//  TableViewCell.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/4/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imageCountry: UIImageView!
    @IBOutlet weak var labelCountry: UILabel!
    @IBOutlet weak var labelTour: UILabel!
    @IBOutlet weak var labelTicket: UILabel!
    @IBOutlet weak var labelTourGuide: UILabel!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelTop: UILabel!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
