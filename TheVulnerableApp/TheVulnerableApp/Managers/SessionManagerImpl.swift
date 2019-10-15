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
    
    var guestSessionPersistenceKey: String = "guestSessionPersistenceKey"
    
    var guestSession: GuestSession? {
        get {
            guard let sessionData = defaults.data(forKey: guestSessionPersistenceKey),
                  let session = try? JSONDecoder().decode(GuestSession.self, from: sessionData)
            else { return nil }
            
            return session
        }
        
        set {
            guard let session = newValue,
                  let sessionData = try? JSONEncoder().encode(session)
            else {
                defaults.set(nil, forKey: guestSessionPersistenceKey)
                return
            }
            
            defaults.set(sessionData, forKey: guestSessionPersistenceKey)
        }
    }
    
    init(repository: GuestSessionRepository = GuestSessionRepositoryImpl(),
         defaults: UserDefaults = .standard) {
        self.repository = repository
        self.defaults = defaults
    }
    
    func start() {
        if let currentSession = self.guestSession,
            let expireDate = currentSession.expiresAt.date(withFormat: expireDateFormat),
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
            
            self.guestSession = session
        }
    }
    
    private func isValidSession(expireDate: Date) -> Bool {
        let today = Date()
        return today < expireDate
    }
    
}
