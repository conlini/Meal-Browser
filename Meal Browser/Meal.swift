//
//  Meal.swift
//  Meal Browser
//
//  Created by adbhasin on 04/11/17.
//  Copyright © 2017 conlini. All rights reserved.
//

import UIKit

class Meal {
    // MARK: properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: initializer
    init?(name: String, photo: UIImage?, r: Int)  {

        guard !name.isEmpty else {
            return nil
        }
        
        guard (r >= 0 ) && (r <= 5) else {
            return nil
        }
        self.name = name
        self.photo = photo
        self.rating = r
    }
    
}
