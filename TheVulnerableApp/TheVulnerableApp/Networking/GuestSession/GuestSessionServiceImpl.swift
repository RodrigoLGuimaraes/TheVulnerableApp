//
//  GuestSessionServiceImpl.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Moya

class GuestSessionServiceImpl: GuestSessionService {
    
    let provider: MoyaProvider<GuestSessionRouter>
    
    init(provider: MoyaProvider<GuestSessionRouter> = MoyaProvider<GuestSessionRouter>()) {
        self.provider = provider
    }
    
    func new(completion: @escaping Completion) -> Cancellable {
        return provider.request(.new, completion: completion)
    }
}
