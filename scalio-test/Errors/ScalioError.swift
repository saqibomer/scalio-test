//
//  ScalioError.swift
//  scalio-test
//
//  Created by TOxIC on 12/05/2022.
//

import Foundation


enum ScalioError: LocalizedError {
    case authError(description: String)
    case `default`(description: String? = nil)
    
    var errorDescription: String? {
        switch self{
        case let .authError(description):
            return description
        case let .default(description):
            return description ?? "Something went wrong"
        }
    }
}
