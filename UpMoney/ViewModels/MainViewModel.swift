//
//  MainViewModel.swift
//  UpMoney
//
//  Created by Dulin Gleb on 29.2.24..
//

import Foundation
import UIKit

protocol MainViewModelProtocol: AnyObject {
    func viewLoaded()
    func choosedAccount()
}

class MainViewModel {
    private var accounts: [Account]?
    private var account: Account?
    private var segments: [TransactionType]
    
    init(accounts: [Account]? = CoreDataStack.shared.getAllAccounts()) {
        self.accounts = accounts
        self.segments = TransactionType.allCases
    }
    
    weak var view: MainViewControllerProtocol?
}

extension MainViewModel: MainViewModelProtocol {
    func viewLoaded() {
        account = accounts?.first
        view?.updateAccountButton(account: account, hasArrow: true)
        view?.setupInitialState(segments: segments)
        view?.setupKeyboardPadDelegate(delegate: self)
    }
    
    func choosedAccount() {
        
    }
    
    
}

extension MainViewModel: KeyboardNumberDelegate {
    func numberSet(number: String) {
        let color: UIColor = number == "0" ? .opaqueSeparator : .cBlack
        
        var amount = number.separateDouble(thousandsSeparator: AppStyles.Str.thousendsSeparator)
        amount = (self.account?.currency?.symbol ?? AppStyles.Str.defaultCurrencySymbol) + amount
        
        view?.updateAmountLabel(amount: amount, color: color)
    }
}
