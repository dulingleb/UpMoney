//
//  CoreDataStack + Account.swift
//  UpMoney
//
//  Created by Dulin Gleb on 18.3.24..
//

import Foundation
import CoreData
import UIKit

extension CoreDataStack {
    func addAccount(name: String, icon: Icon, iconColor: UIColor, startBalance: Double, currency: Currency) {
        let newAccount = Account(context: managedObjectContext)
        newAccount.name = name
        newAccount.iconName = icon.rawValue
        newAccount._iconColor = iconColor
        newAccount.startBalance = startBalance
        newAccount.currency = currency
        
        save()
    }
    
    func getAllAccounts() -> [Account] {
        let fetchRequest: NSFetchRequest<Account> = Account.fetchRequest()
        do {
            let accounts = try managedObjectContext.fetch(fetchRequest)
            return accounts
        } catch {
            print("Error fetching accounts: \(error.localizedDescription)")
            return []
        }
    }
}
