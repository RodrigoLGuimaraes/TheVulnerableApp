//
//  MovieTableViewCell.swift
//  TheVulnerableApp
//
//  Created by Rodrigo Guimaraes on 08/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieNameLabel: UILabel!
    @IBOutlet weak var scoreContainer: UIView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 10
        cardView.clipsToBounds = true
        movieImageView.clipsToBounds = false
        scoreContainer.layer.cornerRadius = 33
        scoreContainer.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
