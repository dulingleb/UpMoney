//
//  String + hasValidDecimalPlaces.swift
//  UpMoney
//
//  Created by Dulin Gleb on 26.3.24..
//

import Foundation

extension String {
    func hasValidDecimalPlaces(sep: String = ".") -> Bool {
        let separatedStrings = self.components(separatedBy: sep)
        if separatedStrings.count == 2 {
            _ = String(separatedStrings[0]) // Первая подстрока до точки
            let afterDot = String(separatedStrings[1]) // Вторая подстрока после точки
            if afterDot.count > 2 { return false }
        }
        
        return true
    }
}
