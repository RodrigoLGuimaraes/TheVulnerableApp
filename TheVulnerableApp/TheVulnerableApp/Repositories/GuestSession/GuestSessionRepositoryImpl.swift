//
//  GuestSessionRepositoryImpl.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

enum GuestSessionError: Error {
    case notCreated
}

class GuestSessionRepositoryImpl: GuestSessionRepository {
    
    let service: GuestSessionService
    
    init(service: GuestSessionService = GuestSessionServiceImpl()) {
        self.service = service
    }
    
    func new(completion: @escaping (Result<GuestSession, Error>) -> Void) {
        service.new { (result) in
            guard case .success(let response) = result else {
                DispatchQueue.main.async {
                    completion(.failure(GuestSessionError.notCreated))
                }
                return
            }
            
            do {
                let session = try response.map(GuestSession.self)
                
                DispatchQueue.main.async {
                    completion(.success(session))
                }
            } catch {
                completion(.failure(GuestSessionError.notCreated))
            }
        }
    }
    
}
