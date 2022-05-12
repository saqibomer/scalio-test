//
//  UserResponseTest.swift
//  scalio-testTests
//
//  Created by TOxIC on 12/05/2022.
//

import XCTest
@testable import scalio_test

class UserResponseTest: XCTestCase {


    func testDecodingModel() throws {
        let jsonString = """
        {
          "total_count": 2589,
          "incomplete_results": false,
          "items": [
            {
              "login": "saqib",
              "id": 123993,
              "avatar_url": "https://avatars.githubusercontent.com/u/123993?v=4"
            },
            {
              "login": "saqibameen",
              "id": 31374163,
              "avatar_url": "https://avatars.githubusercontent.com/u/31374163?v=4"
            }
          ]
        }
        """
        
        
        do {
            let decoded = try JSONDecoder().decode(UsersResponse.self, from: Data(jsonString.utf8))
            XCTAssert(decoded.users.first?.login == "saqib")
        } catch {
            XCTFail()
        }
    }
    
    func testEncodingModel() throws {
        let userResponse = UsersResponse(totalCount: 5, inCompleteResult: false, users: [
            .init(login: "saqib", id: 123993, avatarUrl: "https://avatars.githubusercontent.com/u/123993?v=4"),
            .init(login: "saqibameen", id: 31374163, avatarUrl: "https://avatars.githubusercontent.com/u/31374163?v=4")
            
        ])
        
        
        
        do {
            let encoder = JSONEncoder()
            encoder.keyEncodingStrategy = .convertToSnakeCase
            let encoded = try encoder.encode(userResponse)
            let encodedString = String(decoding: encoded, as: UTF8.self)
            print(String(decoding: encoded, as: UTF8.self))
            XCTAssert(encodedString != "")
        } catch {
            XCTFail()
        }
    }

}
