//
//  KeyboardButton.swift
//  UpMoney
//
//  Created by Dulin Gleb on 21.3.24..
//

import Foundation

enum KeyboardButtonType {
    case digit
    case backspace
}

enum KeyboardButton: String, CaseIterable {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case dot = "."
    case zero = "0"
    case del = "<"
    
    var type: KeyboardButtonType {
        switch self {
            case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
                return .digit
            case .del:
                return .backspace
        }
    }
    
    var icon: Icon? {
        switch self {
            case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .dot:
                return nil
            case .del:
                return .backSpace
        }
    }
}
