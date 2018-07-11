//
//  PlacesTableViewCell.swift
//  Quick Tour
//
//  Created by nguyễn hữu đạt on 7/9/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit

class PlacesTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var imagePlaces: UIImageView!
    @IBOutlet weak var informationLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
