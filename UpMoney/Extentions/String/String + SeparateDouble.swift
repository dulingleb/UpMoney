//
//  String + SeparateDouble.swift
//  UpMoney
//
//  Created by Dulin Gleb on 26.3.24..
//

import Foundation

extension String {
    func separateDouble(thousandsSeparator: String, decimalSeparated: String = ".") -> String {
        let components = self.components(separatedBy: decimalSeparated)
            let numberString = components[0].replacingOccurrences(of: thousandsSeparator, with: "")
            let decimalPart = components.count > 1 ? decimalSeparated + components[1] : ""

            var formattedString = ""
            var index = numberString.count - 1
            var counter = 0
            
            while index >= 0 {
                let currentChar = String(numberString[numberString.index(numberString.startIndex, offsetBy: index)])
                formattedString = currentChar + formattedString
                counter += 1
                
                if counter == 3 && index != 0 {
                    formattedString = thousandsSeparator + formattedString
                    counter = 0
                }
                
                index -= 1
            }
            
            return formattedString + decimalPart
    }
}
