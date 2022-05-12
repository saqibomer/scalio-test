//
//  String+Extensions.swift
//  scalio-test
//
//  Created by TOxIC on 13/05/2022.
//

import Foundation
extension String {
    func search(_ term: String) -> Bool {
        let lowercasedSelf = self.lowercased()
        let lowercasedTerm = term.lowercased()
        return lowercasedSelf.localizedCaseInsensitiveContains(lowercasedTerm)
    }
}
