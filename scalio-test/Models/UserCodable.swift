//
//  UserCodable.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation

struct UserCodable: Codable {
    
    var login: String
    var id: Int
    var avatarUrl: String
    var profileUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
        case profileUrl = "url"
    }
}
