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

}
