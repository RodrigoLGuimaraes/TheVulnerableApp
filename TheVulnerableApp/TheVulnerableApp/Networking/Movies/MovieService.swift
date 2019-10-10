//
//  MovieService.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation
import Moya

protocol MovieService {
    @discardableResult
    func search(query: String, completion: @escaping Completion) -> Cancellable
}
