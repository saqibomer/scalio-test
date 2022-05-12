//
//  UsersViewModel.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation
import RxSwift

final class UsersViewModel {
    
    private let userSerice: UserServiceProtocol
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userSerice = userService
    }
    
    func fetchUsersViewModel() -> Observable<[UserListItemViewModel]> {
        userSerice.getUsers(searchString: "saqib")
            .map { $0.users.map {
                UserListItemViewModel(user: $0)}}
    }
    
}
