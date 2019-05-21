//
//  CityTableViewCell.swift
//  OpenWeatherMap
//
//  Created by Alevtina on 21/05/2019.
//  Copyright © 2019 Alevtina. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var degreeLabel: UILabel!
    @IBOutlet weak var weatherIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
