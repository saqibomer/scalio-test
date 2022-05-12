//
//  UserServices.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation
import RxSwift
import Moya

protocol UserServiceProtocol {
    func getUsers(searchString: String) -> Observable<UsersResponse>
    
}

final class UserService: UserServiceProtocol{
    
    
    func getUsers(searchString: String) -> Observable<UsersResponse> {
        
        return Observable.create { observer -> Disposable in
            let provider = MoyaProvider<GithubService>()
            provider.request(.getUsers(login: searchString)) { result in
                switch result {
                case let .success(moyaResponse):
                    let data = moyaResponse.data
                    let statusCode = moyaResponse.statusCode
                    print(statusCode)
                    do {
                        let userResponse = try JSONDecoder().decode(UsersResponse.self, from: data)
                        observer.onNext(userResponse)
                    } catch {
                        observer.onError(error)
                    }
                case let .failure(error):
                    observer.onError(error)
                }
            }
            
            return Disposables.create {
                
            }
        }
    }
    
        
}
