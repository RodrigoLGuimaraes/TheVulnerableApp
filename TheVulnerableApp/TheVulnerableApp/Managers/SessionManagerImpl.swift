//
//  SessionManagerImpl.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class SessionManagerImpl: SessionManager {
    
    private let expireDateFormat = "yyyy-MM-dd HH:mm:ss Z"
    private let keychainWrapper: KeychainWrapper
    private let defaults: UserDefaults
    private let sessionRepository: GuestSessionRepository
    
    var guestSessionIDPersistenceKey: String = "guestSessionIDPersistenceKey"
    
    var guestSessionID: String? {
        get {
            guard let sessionID = keychainWrapper.string(forKey: guestSessionIDPersistenceKey) else { return nil }
            return sessionID
        }
        set {
            guard let newValue = newValue else {
                keychainWrapper.removeObject(forKey: guestSessionIDPersistenceKey)
                return
            }
            keychainWrapper.set(newValue, forKey: guestSessionIDPersistenceKey)
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
         keychainWrapper: KeychainWrapper = KeychainWrapper.standard,
         defaults: UserDefaults = .standard) {
        self.sessionRepository = repository
        self.keychainWrapper = keychainWrapper
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
        sessionRepository.new { (result) in
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
