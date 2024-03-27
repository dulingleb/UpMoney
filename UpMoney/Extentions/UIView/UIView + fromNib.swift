//
//  File.swift
//  UpMoney
//
//  Created by Dulin Gleb on 22.3.24..
//

import Foundation
import UIKit

extension UIView {
    class func loadFromNib<T>(_ name: String = String(describing: T.self), owner: AnyObject? = nil, bundle: Bundle? = Bundle.main) -> T {
            return UINib(nibName: name, bundle: bundle).instantiate(withOwner: owner, options: nil).first as! T
        }
        
        class func loadFromNib<T>(_ name: String = String(describing: T.self), index: Int) -> T {
            return UINib(nibName: name, bundle: nil).instantiate(withOwner: nil, options: nil)[index] as! T
        }
}
