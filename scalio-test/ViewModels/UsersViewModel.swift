//
//  UsersViewModel.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol UsersViewModelOutput {
    var userItems: PublishSubject<[UserListItemViewModel]> {get}
}

final class UsersViewModel: UsersViewModelOutput {
    
    private let userService: UserServiceProtocol
    private let disposeBag = DisposeBag()
    var userItems: PublishSubject<[UserListItemViewModel]>
    
    init(userService: UserServiceProtocol = UserService()) {
        self.userService = userService
        self.userItems = PublishSubject<[UserListItemViewModel]>()
    }
    
    func fetchUsersViewModel(query: String) {
        
        userService.getUsers(searchString: query)
            .subscribe { response in
                let users = response.users.map {
                    UserListItemViewModel(user: $0)
                }
                self.userItems.onNext(users)
            } onError: { error in
                print(error.localizedDescription)
            } onCompleted: {
                
            }.disposed(by: disposeBag)
        
    }
    
}
