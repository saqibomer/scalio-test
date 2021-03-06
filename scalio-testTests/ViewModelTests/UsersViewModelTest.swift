//
//  UsersViewModelTest.swift
//  scalio-testTests
//
//  Created by TOxIC on 13/05/2022.
//

import XCTest
import RxCocoa
import RxSwift
import RxTest
import RxBlocking

@testable import scalio_test

class UsersViewModelTest: XCTestCase {
    var viewModel: UsersViewModel!
    var scheduler: TestScheduler!
    var disposeBag: DisposeBag!
    
    override func setUp() {
        viewModel = UsersViewModel()
        scheduler = TestScheduler(initialClock: 0)
        disposeBag = DisposeBag()
    }
    
    func testInitialization() {
        
        XCTAssertNotNil(viewModel, "The view model should not be nil.")
    }
    
    func testBinders() {

        viewModel = UsersViewModel()
        
        viewModel.userItems.subscribe { response in
            let status: Bool
            if response.element?.first?.user.login != nil {
                status = true
            } else {
                status = false
            }
 
            XCTAssertTrue(status)
        }.disposed(by: disposeBag)
        
        viewModel.fetchUsersViewModel(query: "saqib")
    }
}
