//
//  Constants.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation
import Keys

struct Constants {
    
    static let keys = TheVulnerableAppKeys()
    
    static let baseURL: String = "http://api.themoviedb.org/3"
    static let imageBaseURL: String = "http://image.tmdb.org/t/p/w500"
    static let apiKEY: String =  keys.apiKEY
    
}
