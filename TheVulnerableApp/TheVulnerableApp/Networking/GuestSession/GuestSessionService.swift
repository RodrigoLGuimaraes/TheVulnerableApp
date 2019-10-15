//
//  GuestSessionService.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Moya

protocol GuestSessionService {
    @discardableResult
    func new(completion: @escaping Completion) -> Cancellable
}
