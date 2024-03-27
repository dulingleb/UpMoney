//
//  Iconicle.swift
//  UpMoney
//
//  Created by Dulin Gleb on 19.3.24..
//

import Foundation
import UIKit

protocol Categorieble {
    var _name: String { get }
    var _icon: Icon? { get set }
    var _iconColor: UIColor? { get set }
}
