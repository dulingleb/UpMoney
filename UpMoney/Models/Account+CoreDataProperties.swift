//
//  Account+CoreDataProperties.swift
//  UpMoney
//
//  Created by Dulin Gleb on 19.3.24..
//
//

import Foundation
import CoreData
import UIKit


extension Account {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Account> {
        return NSFetchRequest<Account>(entityName: "Account")
    }

    @NSManaged public var name: String
    @NSManaged public var iconName: String?
    @NSManaged public var iconColorHex: String?
    @NSManaged public var startBalance: Double
    @NSManaged public var currency: Currency?

}

extension Account : Identifiable {

}

extension Account : Categorieble {
    var _name: String {
        get {
            return name
        }
    }
    
    var _icon: Icon? {
        get {
            guard let iconName = Icon(rawValue: iconName!) else { return nil }
            return iconName
        }
        
        set(newName) {
            if let newName = newName {
                iconName = newName.rawValue
            }
        }
    }
    
    var _iconColor: UIColor? {
        get {
            guard let hex = iconColorHex else { return nil }
            return UIColor(hexString: hex)
        }
        
        set(newColor) {
            if let newColor = newColor {
                iconColorHex = newColor.toHexString
            }
        }
    }
}
