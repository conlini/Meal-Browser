//
//  MealTableViewCell.swift
//  Meal Browser
//
//  Created by adbhasin on 04/11/17.
//  Copyright © 2017 conlini. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    @IBOutlet weak var mealPhoto: UIImageView!
    @IBOutlet weak var mealName: UILabel!
    @IBOutlet weak var mealRating: RatingControl!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
