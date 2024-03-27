//
//  AppStyles.swift
//  UpMoney
//
//  Created by Dulin Gleb on 1.3.24..
//

import Foundation
import UIKit

struct AppStyles {
    struct Layout {
        static let m36: CGFloat = 36
        static let m20: CGFloat = 20
        static let m10: CGFloat = 10
        static let m8: CGFloat = 8
    }
    
    struct Font {
        static let standartButton: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold)
    }
    
    struct Str {
        static let decimalSeparator: String = "."
        static let thousendsSeparator: String = " "
        static let defaultCurrencySymbol = "$"
    }
}
