//
//  DetailsViewController.swift
//  TheVulnerableApp
//
//  Created by Rodrigo Guimaraes on 09/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var coloredBackgroundView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabelContainer: UIView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieNameLabelContainer.clipsToBounds = true
        self.movieNameLabelContainer.layer.cornerRadius = 5
    }
    
    @IBAction func playMovie(_ sender: Any) {
    }
    
}
