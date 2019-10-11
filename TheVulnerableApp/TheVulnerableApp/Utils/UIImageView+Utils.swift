//
//  UIImageView+Utils.swift
//  TheVulnerableApp
//
//  Created by Charles Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func set(url: URL) {
        DispatchQueue.global(qos: .background).async {
            let data = try? Data(contentsOf: url)
            DispatchQueue.main.async {
                guard let imageData = data else {
                    self.image = nil
                    return
                }
                self.image = UIImage(data: imageData)
            }
        }
    }
}
