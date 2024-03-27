//
//  CoreDataStack + Currency.swift
//  UpMoney
//
//  Created by Dulin Gleb on 18.3.24..
//

import Foundation
import CoreData

extension CoreDataStack {
    func addCurrency(name: String, code: String, symbol: String) {        
        let newCurrency = Currency(context: managedObjectContext)
        newCurrency.name = name
        newCurrency.code = code
        newCurrency.symbol = symbol
        
        save()
    }
    
    func getAllCurrencies() -> [Currency] {
        let fetchRequest: NSFetchRequest<Currency> = Currency.fetchRequest()
        do {
            let currencies = try managedObjectContext.fetch(fetchRequest)
            return currencies
        } catch {
            print("Error fetching currencies: \(error.localizedDescription)")
            return []
        }
    }
    
    func getCurrencyByCode(_ code: String) -> Currency? {
        let fetchRequest: NSFetchRequest<Currency> = Currency.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "code == %@", code)
        
        do {
            let currencies = try managedObjectContext.fetch(fetchRequest)
            return currencies.first
        } catch {
            print("Error fetching currency: \(error.localizedDescription)")
            return nil
        }
    }
}
