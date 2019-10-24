//
//  MovieServiceImpl.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Foundation
import Moya

class MovieServiceImpl: MovieService {
    
    private let provider: MoyaProvider<MovieRouter>
    
    init(provider: MoyaProvider<MovieRouter> = MoyaProvider<MovieRouter>(manager: AlamofireSessionManagerBuilder().build())) {
        self.provider = provider
    }
    
    @discardableResult
    func search(query: String, completion: @escaping Completion) -> Cancellable {
        return provider.request(.search(query: query), completion: completion)
    }
}
