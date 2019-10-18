//
//  MovieRouter.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 10/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Moya

enum MovieRouter {
    case search(query: String)
}

extension MovieRouter: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/movie"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .search(let query):
            return .requestCompositeData(bodyData: Data(),
                                         urlParameters:
                ["api_key" : Constants.apiKEY, "query" : query]
            )
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
}


