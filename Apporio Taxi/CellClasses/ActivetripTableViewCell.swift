//
//  ActivetripTableViewCell.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit
import StarryStars

class ActivetripTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ridestatustext: UILabel!
    @IBOutlet weak var pickupimageview: UIImageView!
    @IBOutlet weak var droplocationimage: UIImageView!
    @IBOutlet weak var droplocationtext: UILabel!
    @IBOutlet weak var pickuplocationtext: UILabel!
    @IBOutlet weak var paymentmethodtext: UILabel!
    
    @IBOutlet weak var bottomviewheight: NSLayoutConstraint!//30
    @IBOutlet weak var bootomview: UIView!
    @IBOutlet weak var datetext: UILabel!
    @IBOutlet weak var rideidtext: UILabel!
    @IBOutlet weak var mainview: UIView!
    
    @IBOutlet weak var locationview: UIView!
    @IBOutlet weak var mainviewheight: NSLayoutConstraint!//30
    
    @IBOutlet weak var locationviewheight: NSLayoutConstraint!//48
    @IBOutlet weak var topview: UIView!
    
    @IBOutlet weak var topviewheight: NSLayoutConstraint!
    
    @IBOutlet weak var driverratingvalue: RatingView!
    
    @IBOutlet weak var driverviewvisible: UIView!
    
    @IBOutlet weak var driverratingtext: UILabel!
    
    @IBOutlet weak var drivernametext: UILabel!
    @IBOutlet weak var driverimageview: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
