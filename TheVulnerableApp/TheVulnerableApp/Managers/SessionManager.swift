//
//  SessionManager.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

protocol SessionManager {
    
    var guestSessionIDPersistenceKey: String { get }
    var guestSessionID: String? { get set }
    
    var guestSessionExpireDatePersistenceKey: String { get }
    var guestSessionExpireDate: String? { get set }
    
    func start()
}
