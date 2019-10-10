//
//  MovieImageProvider.swift
//  TheVulnerableApp
//
//  Created by Rodrigo Guimaraes on 09/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import UIKit

struct MovieImageProvider {
    
    static let shared = MovieImageProvider()
    
    private let imageAndPrimaryColorArray: [(image: UIImage, primaryColor: UIColor)]
    
    private init() {
        var imageAndPrimaryColorArray = [(UIImage, UIColor)]()
        
        let images = [
            UIImage(named: "avengers")!,
            UIImage(named: "babyboss")!,
            UIImage(named: "legomovie")!,
            UIImage(named: "upmovie")!
        ]
        
        for image in images {
            let primaryColor = image.getColors().primary
            imageAndPrimaryColorArray.append((image, primaryColor!))
        }
        
        self.imageAndPrimaryColorArray = imageAndPrimaryColorArray
    }
    
    func getRandomImage() -> (image: UIImage, primaryColor: UIColor) {
        return imageAndPrimaryColorArray.randomElement()!
    }
}
