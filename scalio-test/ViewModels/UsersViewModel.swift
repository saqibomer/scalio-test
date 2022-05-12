//
//  UsersViewModel.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation
import RxSwift
import RxCocoa


final class UsersViewModel {
    
    private let userService: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
    }
    
    func fetchUsersViewModel(query: String) -> Observable<[UserListItemViewModel]> {
        
        return userService.getUsers(searchString: query)
            .map { $0.users.map {
                UserListItemViewModel(user: $0)
                
                }
            }
        
    }
    
}
