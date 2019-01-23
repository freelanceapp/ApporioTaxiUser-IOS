//
//  DropLocationTableViewCell.swift
//  Apporio Taxi
//
//  Created by Atul Jain on 17/12/18.
//  Copyright © 2018 Atul Jain. All rights reserved.
//

import UIKit

class DropLocationTableViewCell: UITableViewCell {

    @IBOutlet weak var redimageview: UIImageView!
    @IBOutlet weak var droplocationtext: UILabel!
    
    @IBOutlet weak var cancelbtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
