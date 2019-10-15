//
//  GuestSessionRepository.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

protocol GuestSessionRepository {
    func new(completion: @escaping (Result<GuestSession,Error>) -> Void)
}
