//
//  UserListItemViewModel.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation

struct UserListItemViewModel {
    
    let user: UserCodable
    
    init(user: UserCodable) {
        self.user = user
    }
    
}
