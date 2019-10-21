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
    case rate(movieID: Int, value: Double)
}

extension MovieRouter: TargetType {
    
    var guestSessionID: String? {
        let sessionManager = SessionManagerImpl()
        return sessionManager.guestSessionID
    }
    
    var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/movie"
        case .rate(let movieID, _):
            return "/movie/\(movieID)/rating"
        }
    }
    
    var method: Method {
        switch self {
        case .search:
            return .get
        default:
            return .post
        }
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
        case .rate(_, let value):            
            if let sessionID = self.guestSessionID {
                
                return .requestCompositeParameters(bodyParameters: ["value": value],
                                                   bodyEncoding: JSONEncoding.default,
                                                   urlParameters: ["api_key":Constants.apiKEY,
                                                                   "guest_session_id": sessionID])
                
            } else {
                return .requestCompositeParameters(bodyParameters: ["value": value],
                                                   bodyEncoding: JSONEncoding.default,
                                                   urlParameters: ["api_key":Constants.apiKEY])
            }
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
}


