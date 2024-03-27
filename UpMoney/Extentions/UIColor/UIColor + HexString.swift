//
//  UIColor + HexString.swift
//  UpMoney
//
//  Created by Dulin Gleb on 19.3.24..
//

import Foundation
import UIKit

extension UIColor {
    var toHexString: String {
            var r: CGFloat = 0
            var g: CGFloat = 0
            var b: CGFloat = 0
            var a: CGFloat = 0

            self.getRed(&r, green: &g, blue: &b, alpha: &a)

            return String(
                format: "%02X%02X%02X",
                Int(r * 0xff),
                Int(g * 0xff),
                Int(b * 0xff)
            )
        }
    
        convenience init(hexString: String) {
            let scanner = Scanner(string: hexString)
            scanner.currentIndex = scanner.string.index(scanner.string.startIndex, offsetBy: 0)

            var rgbValue: UInt64 = 0

            scanner.scanHexInt64(&rgbValue)

            let r = (rgbValue & 0xff0000) >> 16
            let g = (rgbValue & 0xff00) >> 8
            let b = rgbValue & 0xff

            self.init(
                red: CGFloat(r) / 0xff,
                green: CGFloat(g) / 0xff,
                blue: CGFloat(b) / 0xff, alpha: 1
            )
        }
}
