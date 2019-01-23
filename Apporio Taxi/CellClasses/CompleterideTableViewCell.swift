//
//  CompleterideTableViewCell.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 26/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit

class CompleterideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pickuplocationimage: UIImageView!
    
    @IBOutlet weak var droplocationtext: UILabel!
    @IBOutlet weak var dropimageview: UIImageView!
    @IBOutlet weak var droplocationview: UIView!
    @IBOutlet weak var dotimageview: UIImageView!
    @IBOutlet weak var pickuplocationtext: UILabel!
    @IBOutlet weak var pickuplocationview: UIView!
    @IBOutlet weak var totalamounttext: UILabel!
    @IBOutlet weak var carnametext: UILabel!
    
    @IBOutlet weak var carimageview: UIImageView!
    
    @IBOutlet weak var mainview: UIView!
    
    @IBOutlet weak var bottomview: UIView!
    
    @IBOutlet weak var topview: UIView!
    
    @IBOutlet weak var datetext: UILabel!
    
    @IBOutlet weak var ridestatustext: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
