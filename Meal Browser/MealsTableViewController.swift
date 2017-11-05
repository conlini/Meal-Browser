//
//  MealsTableViewController.swift
//  Meal Browser
//
//  Created by adbhasin on 04/11/17.
//  Copyright © 2017 conlini. All rights reserved.
//

import UIKit

class MealsTableViewController: UITableViewController {
    
    var meals =  [Meal]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let savedMeals = NSKeyedUnarchiver.unarchiveObject(withFile: Meal.ArchiveURL.path) as? [Meal] {
            meals += savedMeals
        } else {
            loadSamples()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meals.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "MealTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? MealTableViewCell else {
            fatalError("Could not cast to MealTableViewCell")
        }
        let bundle = Bundle(for: type(of: self))
        let defaultPhotoImg = UIImage(named: "defaultPhoto", in: bundle, compatibleWith: self.traitCollection)
        let meal = meals[indexPath.row]
        
        cell.mealName.text = meal.name
        if let mealPhotoImg = meal.photo {
            cell.mealPhoto.image = mealPhotoImg
        } else {
            cell.mealPhoto.image = defaultPhotoImg
        }
        
        
        cell.mealRating.rating = meal.rating
        
        return cell
    }
    
    // MARK: private funcitons
    private func loadSamples() {
        guard let meal1 = Meal(name: "chicken griled", photo: nil, r: 3) else {
            return
        }
        guard let meal2 = Meal(name: "pasta", photo: nil, r: 2 ) else {
            return
        }
        guard let meal3 = Meal(name: "pizza", photo: nil, r: 4) else {
            return
        }
        
        meals += [meal1, meal2, meal3]
        
        
    }
    
    
    // MARK: actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ViewController, let meal = sourceViewController.meal {
            let newIndexPath = IndexPath(row: meals.count, section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        NSKeyedArchiver.archiveRootObject(meals, toFile: Meal.ArchiveURL.path)
        
    }
    
}
