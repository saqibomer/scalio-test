//
//  UsersResponse.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation

struct UsersResponse: Codable {
    
    var totalCount: Int
    var inCompleteResult: Bool
    var users: [UserCodable]
    
    
    private enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case inCompleteResult = "incomplete_results"
        case users = "items"
    }
}
