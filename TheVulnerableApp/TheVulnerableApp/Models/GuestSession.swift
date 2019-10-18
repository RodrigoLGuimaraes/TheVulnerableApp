//
//  GuestSession.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation

struct GuestSession: Codable {
    let guestSessionId: String
    let expiresAt: String
    
    enum CodingKeys: String, CodingKey {
        case guestSessionId = "guest_session_id"
        case expiresAt = "expires_at"
    }
}
