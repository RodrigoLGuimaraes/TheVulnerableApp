//
//  SessionManager.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

protocol SessionManager {
    var guestSessionPersistenceKey: String { get }
    var guestSession: GuestSession? { get set }
    func start()
}
