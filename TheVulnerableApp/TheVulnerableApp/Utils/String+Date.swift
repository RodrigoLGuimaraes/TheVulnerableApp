//
//  String+Date.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

extension String {
    
    func date(withFormat format: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        return dateFormatter.date(from: self)
    }
}
