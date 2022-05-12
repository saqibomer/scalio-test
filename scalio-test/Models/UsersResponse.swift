//
//  UsersResponse.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation

struct UsersResponse: Codable {
    
    let totalCount: Int?
    let inCompleteResult: Bool?
    let users: [UserCodable]?
    
    
    private enum CodingKeys: String, CodingKey {
        case totalCount
        case inCompleteResult
        case users = "items"
    }
}
