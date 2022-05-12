//
//  ScalioServices.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation
import Moya

enum GithubService {
    case getUsers(login: String)
}

extension GithubService: TargetType {
    var baseURL: URL { URL(string: "https://api.github.com")! }
    var path: String {
        switch self {
        case .getUsers(let login):
            return "/search/users/?q=\(login)"
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
        case .getUsers:
            return .requestPlain
        }
    }
    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
