//
//  SessionManagerImpl.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

class SessionManagerImpl: SessionManager {
    
    private let expireDateFormat = "yyyy-MM-dd HH:mm:ss Z"
    private let defaults: UserDefaults
    private let repository: GuestSessionRepository
    
    var guestSessionIDPersistenceKey: String = "guestSessionIDPersistenceKey"
    
    var guestSessionID: String? {
        get {
            guard let sessionID = defaults.string(forKey: guestSessionIDPersistenceKey) else { return nil }
            return sessionID
        }
        set {
            defaults.set(newValue, forKey: guestSessionIDPersistenceKey)
        }
    }
    
    var guestSessionExpireDatePersistenceKey: String = "guestSessionExpireDatePersistenceKey"

    var guestSessionExpireDate: String? {
        get {
            guard let sessionExpireDate = defaults.string(forKey: guestSessionExpireDatePersistenceKey) else { return nil }
            return sessionExpireDate
        }
        set {
            defaults.set(newValue, forKey: guestSessionExpireDatePersistenceKey)
        }
    }
    
    init(repository: GuestSessionRepository = GuestSessionRepositoryImpl(),
         defaults: UserDefaults = .standard) {
        self.repository = repository
        self.defaults = defaults
    }
    
    func start() {
        if let expireDateString = self.guestSessionExpireDate,
            let expireDate = expireDateString.date(withFormat: expireDateFormat),
            isValidSession(expireDate: expireDate) {
            return
        }
        
        requestNewSession()
    }
    
    private func requestNewSession() {
        repository.new { (result) in
            guard case .success(let session) = result else {
                return
            }
            
            self.guestSessionID = session.guestSessionId
            self.guestSessionExpireDate = session.expiresAt
        }
    }
    
    private func isValidSession(expireDate: Date) -> Bool {
        let today = Date()
        return today < expireDate
    }
    
}
