//
//  CellLocation.swift
//  Apporio Taxi
//
//  Created by Apporio on 12/03/18.
//  Copyright © 2018 apporio. All rights reserved.
//

import UIKit

class CellLocation: UITableViewCell {


    @IBOutlet weak var imgLocationType: UIImageView!
    @IBOutlet weak var lblLocationType: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var btnDelete: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
