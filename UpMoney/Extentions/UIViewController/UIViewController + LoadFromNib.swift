//
//  UIViewController + LoadFromNib.swift
//  UpMoney
//
//  Created by Dulin Gleb on 21.3.24..
//

import Foundation
import UIKit

extension UIViewController {
    
    var className: String {
        return String(describing: type(of: self))
    }
    
    class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
}
