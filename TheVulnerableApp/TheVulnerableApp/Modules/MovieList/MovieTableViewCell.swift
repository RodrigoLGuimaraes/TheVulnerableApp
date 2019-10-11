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
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        let cardScale = CGFloat(highlighted ? 0.95 : 1)
        let imageScale = CGFloat(highlighted ? 1.1 : 1)
        
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut, animations: {
            self.cardView.transform = CGAffineTransform.init(scaleX: cardScale, y: cardScale)
            self.movieImageView.transform = CGAffineTransform.init(scaleX: imageScale, y: imageScale)
        }, completion: nil)
    }
    
    func setRandomImage() {
        let image = MovieImageProvider.shared.getRandomImage()
        
        self.movieImageView.image = image.image
        self.cardView.backgroundColor = image.primaryColor
    }
    
}
