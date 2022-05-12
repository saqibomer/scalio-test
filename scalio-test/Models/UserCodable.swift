//
//  UserCodable.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation

struct UserCodable: Codable {
    
    let login: String?
    let id: Int?
    let avatarUrl: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case login
        case id
        case avatarUrl = "avatar_url"
    }
}
