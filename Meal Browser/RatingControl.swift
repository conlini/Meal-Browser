//
//  RatingControl.swift
//  Meal Browser
//
//  Created by adbhasin on 04/11/17.
//  Copyright © 2017 conlini. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonRatings()
        }
    }
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height: 44.0) {
        didSet {
            setupButtons()
        }
    }
    @IBInspectable var starCount: Int = 5 {
        didSet {
            setupButtons()
        }
    }

    // MARK: initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    // MARK: private methods
    private func setupButtons() {
        
        // first clear existing buttons
        
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
            
        }
        ratingButtons.removeAll()
        
        // images
        let bundle = Bundle(for: type(of: self))
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named: "highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        
        // create buttons
        for _ in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = UIColor.red
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            self.addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        updateButtonRatings()
    }
    
    
    // MARK: Button action
    @objc func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("selected button is not part of ratings button array")
        }
        
        let selectedRating = 1 + index
        
        if rating == selectedRating {
            rating = 0
        } else {
            rating = selectedRating
        }
        updateButtonRatings()
    }
    
    func updateButtonRatings() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
        }
        
    }
    
}
