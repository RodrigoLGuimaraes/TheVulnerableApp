//
//  GuestSessionRouter.swift
//  TheVulnerableApp
//
//  Created by Charles de Jesus Lima on 15/10/19.
//  Copyright © 2019 TheVulnerableApp. All rights reserved.
//

import Moya

enum GuestSessionRouter {
    case new
}

extension GuestSessionRouter: TargetType {
    var baseURL: URL {
        return URL(string: Constants.baseURL)!
    }
    
    var path: String {
        return "/authentication/guest_session/new"
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestCompositeData(bodyData: Data(),
                                    urlParameters: ["api_key" : Constants.apiKEY]
                )
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
}
