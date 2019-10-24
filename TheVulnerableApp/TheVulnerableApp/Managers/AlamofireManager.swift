//
//  AlamofireManager.swift
//  TheVulnerableApp
//
//  Created by Rodrigo Longhi Guimarães on 24/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation
import Moya
import Alamofire

class AlamofireSessionManagerBuilder {
    
    var policies: [String: ServerTrustPolicy]?
    var configuration = URLSessionConfiguration.default
    
    init() {
        let allPublicKeys = ServerTrustPolicy.pinPublicKeys(
            publicKeys: ServerTrustPolicy.publicKeys(),
            validateCertificateChain: true,
            validateHost: true
        )
        
        self.policies = [
            "api.themoviedb.org": allPublicKeys
        ]
    }
    
    func build() -> Manager {
        var serverTrustPolicyManager: ServerTrustPolicyManager?
        if let policies = self.policies { serverTrustPolicyManager = ServerTrustPolicyManager(policies: policies) }
        
        let manager = Manager(configuration: configuration,
                              serverTrustPolicyManager: serverTrustPolicyManager)
        manager.startRequestsImmediately = false
        
        return manager
    }
}
