//
//  KeyboardPadViewModel.swift
//  UpMoney
//
//  Created by Dulin Gleb on 21.3.24..
//

import Foundation

protocol KeyboardPadViewModelProtocol {
    func viewLoaded()
    func setupDatasource()
}

protocol KeyboardNumberDelegate: AnyObject {
    func numberSet(number: String)
}

final class KeyboardPadViewModel {
    weak var view: KeyboardPadViewProtocol?
    weak var delegate: KeyboardNumberDelegate?
    private var dataSource: [KeyboardButton] = KeyboardButton.allCases
    private var number: String = "" {
        didSet {
            if number.isEmpty {
                number = emptyNumber
            }
        }
    }
    
    var maxNumber: Double = 999999999.99
    var emptyNumber: String = "0"
    
    func setNumber(button: KeyboardButton) {
        switch button {
        case .del:
            if number.isEmpty { return }
            number.removeLast()
        case .zero:
            if number == "0" { return }
            number = addSymbolToNumber(symbol: button.rawValue)
        case .dot:
            if number.contains(".") { return }
            var symbol = button.rawValue
            if number.isEmpty { symbol = "0" + button.rawValue}
            number = addSymbolToNumber(symbol: symbol)
        case .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            number = addSymbolToNumber(symbol: button.rawValue)
        }

        delegate?.numberSet(number: number)
    }
    
    private func addSymbolToNumber(symbol: String) -> String {
        var newNumber = self.number + symbol
        guard let doubleNumber = Double(newNumber),
                doubleNumber >= 0,
                doubleNumber <= maxNumber,
                newNumber.hasValidDecimalPlaces()
        else { return self.number }
        
        if !newNumber.contains(".") {
            newNumber = newNumber.replacingOccurrences(of: "^0+", with: "", options: .regularExpression) // убираем нули вначале строки
        }
        
        return newNumber
    }
    

}

extension KeyboardPadViewModel: KeyboardPadViewModelProtocol {
    func viewLoaded() {
        view?.setupInitialState()
    }
    
    func setupDatasource() {
        view?.didLoadInfo(dataSource: self.dataSource)
    }
}
