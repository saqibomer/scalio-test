//
//  UsersViewModelTest.swift
//  scalio-testTests
//
//  Created by TOxIC on 13/05/2022.
//

import XCTest
import RxSwift
@testable import scalio_test

class UsersViewModelTest: XCTestCase {
    
    

    func testInitialization() {
        let viewModel = UsersViewModel()
        XCTAssertNotNil(viewModel, "The view model should not be nil.")
    }

    func testBinders() {
            let scheduler = TestScheduler(initialClock: 0)
            let source = scheduler.createColdObservable([.next(5, "hello"), .completed(10)])
            let sink = scheduler.createObserver(Bool.self)
            let disposeBag = DisposeBag()

            let viewModel = UsersViewModel()
            source.bind(to: viewModel.fetchUsersViewModel(query: "saqib")).disposed(by: disposeBag)
            viewModel.fetchUsersViewModel(query: "saqib").bind(to: sink).disposed(by: disposeBag)

            scheduler.start()

            XCTAssertEqual(sink.events, [.next(0, true), .next(5, false)])
        }
}
