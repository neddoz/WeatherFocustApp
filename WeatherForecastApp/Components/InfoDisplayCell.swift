//
//  InfoDisplayCell.swift
//  WeatherForecastApp
//
//  Created by kayeli dennis on 29/11/2018.
//  Copyright © 2018 kayeli dennis. All rights reserved.
//

import UIKit

class InfoDisplayCell: UITableViewCell, NibLoadableView {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with title: String?, and additionalInfo: String?) {
        self.titleLabel.text = title
        self.descriptionLabel.text = additionalInfo
    }
}
