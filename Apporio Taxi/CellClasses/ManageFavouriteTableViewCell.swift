//
//  ManageFavouriteTableViewCell.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 03/01/19.
//  Copyright © 2019 Atul Jain. All rights reserved.
//

import UIKit
import StarryStars

class ManageFavouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var deletebtnclick: UIButton!
    
    @IBOutlet weak var driverratingtext: UILabel!
    @IBOutlet weak var driverratingvalue: RatingView!
    @IBOutlet weak var mainview: UIView!
    
    @IBOutlet weak var driverimageview: UIImageView!
    
    @IBOutlet weak var driverphone: UILabel!
    @IBOutlet weak var drivername: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
