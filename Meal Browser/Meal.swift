//
//  Meal.swift
//  Meal Browser
//
//  Created by adbhasin on 04/11/17.
//  Copyright © 2017 conlini. All rights reserved.
//

import UIKit
import os.log


class Meal: NSObject,NSCoding {
    // MARK: properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("meals")
    
    // MARK: initializer
    init?(name: String, photo: UIImage?, r: Int)  {
        //        super.init()
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
    
    // MARK: NSCode
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode meal name", log: OSLog.default, type: .debug)
            return nil
        }
        
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        self.init(name: name , photo: photo, r: rating)
    }
    // MARK: types
    struct PropertyKey {
        static let name = "name"
        static let photo = "photo"
        static let rating = "rating"
    }
    
}
