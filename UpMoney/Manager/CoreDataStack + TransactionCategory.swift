//
//  CoreDataStack + TransactionCategory.swift
//  UpMoney
//
//  Created by Dulin Gleb on 26.3.24..
//

import Foundation
import UIKit
import CoreData

extension CoreDataStack {
    func addTransactionCategory(name: String, icon: Icon, iconColor: UIColor, type: TransactionType, pos: Int16) {
        let newCategory = TransactionCategory(context: managedObjectContext)
        newCategory.name = name
        newCategory.iconName = icon.rawValue
        newCategory.iconColor = iconColor.toHexString
        newCategory.type = type.rawValue
        newCategory.pos = pos
        
        save()
    }
    
    func getAllTransactionCategories() -> [TransactionCategory] {
        let fetchRequest: NSFetchRequest<TransactionCategory> = TransactionCategory.fetchRequest()
        do {
            let categories = try managedObjectContext.fetch(fetchRequest)
            return categories
        } catch {
            print("Error fetching accounts: \(error.localizedDescription)")
            return []
        }
    }
}
