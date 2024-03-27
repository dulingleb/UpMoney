//
//  Icon.swift
//  UpMoney
//
//  Created by Dulin Gleb on 19.3.24..
//

import Foundation
import UIKit

enum Icon: String {
    case arrowDown
    case backSpace
    case calendar
    case edit
    case home
    case pieChart
    case wallet
    case setting
    case popcorn
    
    func uiImage() -> UIImage? {
        switch self {
            case .arrowDown: return UIImage(named: "arrowDown")
            case .backSpace: return UIImage(named: "backspace")
            case .calendar: return UIImage(named: "calendar")
            case .edit: return UIImage(named: "edit")
            case .home: return UIImage(named: "home")
            case .pieChart: return UIImage(named: "pieChart")
            case .wallet: return UIImage(named: "wallet")
            case .setting: return UIImage(named: "settings")
            case .popcorn: return UIImage(named: "popcorn")
        }
    }
}
