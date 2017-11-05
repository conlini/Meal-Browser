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
        
        loadSamples() 
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
        
        let meal = meals[indexPath.row]
    
        cell.mealName.text = meal.name
        cell.mealPhoto.image = meal.photo
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
    
}
