//
//  DetailsViewController.swift
//  TheVulnerableApp
//
//  Created by Rodrigo Guimaraes on 09/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import UIKit
import STRatingControl

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var coloredBackgroundView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabelContainer: UIView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var ratingControll: STRatingControl!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var movieID: Int?
    private lazy var presenter = DetailsPresenter(view: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieNameLabelContainer.clipsToBounds = true
        self.movieNameLabelContainer.layer.cornerRadius = 5
        
        ratingControll.delegate = self
    }
    
}

extension DetailsViewController: STRatingControlDelegate {
    
    func didSelectRating(_ control: STRatingControl, rating: Int) {
        guard let movieID = movieID else { return }
        presenter.rate(movieID: movieID, value: rating)
    }
    
}
