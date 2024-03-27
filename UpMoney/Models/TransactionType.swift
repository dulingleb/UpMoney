//
//  TransactionType.swift
//  UpMoney
//
//  Created by Dulin Gleb on 14.3.24..
//

import Foundation

enum TransactionType: String, CaseIterable {
    case expense
    case income
    case transfer
    
    var title: String {
        switch self {
            case .expense:
                return NSLocalizedString("Expense", comment: "")
            case .income:
                return NSLocalizedString("Income", comment: "")
            case .transfer:
                return NSLocalizedString("Transfer", comment: "")
        }
    }
    
    var index: Int {
        switch self {
            case .expense:
                return 0
            case .income:
                return 1
            case .transfer:
                return 2
        }
    }
}
