//
//  UsersViewModelMock.swift
//  scalio-test
//
//  Created by TOxIC on 13/05/2022.
//

import RxSwift
import RxCocoa

// Mocking
class UsersViewModelMock: UserServiceProtocol {
    
    var fetchedUsers : Result<UsersResponse, ScalioError>?
    
    func getUsers(searchString: String) -> Observable<UsersResponse> {
        return Observable.create { observer in
            switch self.fetchedUsers {
            case .success(let response):
                observer.onNext(response)
            case .failure(let error):
                observer.onError(error)
            case .none:
                observer.onError(ScalioError.default(description: "Not found anything"))
            }
            return Disposables.create()
        }
    }
    
    let mockedData = UsersResponse(totalCount: 10, inCompleteResult: false, users: [
        UserCodable(login: "saqib", id: 1, avatarUrl: "https://someurl.com", profileUrl: "https://someurl.com"),
        UserCodable(login: "Omer", id: 2, avatarUrl: "https://someurl.com", profileUrl: "https://someurl.com"),
    ])
}
