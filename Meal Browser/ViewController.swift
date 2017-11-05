//
//  ViewController.swift
//  Meal Browser
//
//  Created by adbhasin on 03/11/17.
//  Copyright © 2017 conlini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // MARK: Properties
    @IBOutlet weak var mealNameTextFld: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    @IBOutlet weak var saveMeal: UIBarButtonItem!
    
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mealNameTextFld.delegate = self
        updateSaveButtonState()
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveMeal.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
       updateSaveButtonState()
        navigationItem.title = textField.text
    }
    
    // MARK: private functions
    private func updateSaveButtonState() {
        let text = mealNameTextFld.text ?? ""
        saveMeal.isEnabled = !text.isEmpty
        
    }
    
    // MARK: UIImagePickerControllerDelegate
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected dictionary with images but was - :\(info)")
        }
        photoImageView.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: UINavigationControllerDelegate

    // MARK: Actions
  
    @IBAction func selectImageFromPhotoLib(_ sender: UITapGestureRecognizer) {
        mealNameTextFld.resignFirstResponder()
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func cancelAcn(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let button = sender as? UIBarButtonItem, button === saveMeal else {
            print("save button not pressed")
            return
        }
        
        let name = mealNameTextFld.text ?? ""
        let photo = photoImageView.image
        let rating = ratingControl.rating
        meal = Meal(name: name, photo: photo, r: rating)
    }
  
}

