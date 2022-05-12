//
//  ScalioServices.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation
import Moya


enum GithubService {
    case getUsers(query: String)
}

extension GithubService: TargetType {
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var baseURL: URL { URL(string: "https://api.github.com")! }
    
    var path: String {
        switch self {
        case .getUsers(_):
            return "/search/users"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getUsers:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getUsers(query):
            return .requestParameters(parameters: ["q": query], encoding: URLEncoding.queryString)
        }
    }
    
}
