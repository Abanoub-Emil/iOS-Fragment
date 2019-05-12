//
//  FirstContainerTableViewCell.swift
//  SwipeGestureTutorial
//
//  Created by Mai Hassan on 2/13/19.
//  Copyright © 2019 Mai Hassan. All rights reserved.
//

import UIKit

class FirstContainerTableViewCell: UITableViewCell {

    @IBOutlet weak var customImage: UIImageView!
    @IBOutlet weak var title: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
