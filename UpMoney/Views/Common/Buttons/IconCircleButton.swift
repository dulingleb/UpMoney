//
//  BottomCircleButton.swift
//  UpMoney
//
//  Created by Dulin Gleb on 29.2.24..
//

import UIKit

class IconCircleButton: UIButton {
    let iconSize = 50.0

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(iconName: String) {
        let configuration = UIButton.Configuration.gray()
        self.configuration = configuration
        self.layer.cornerRadius = iconSize / 2
        self.clipsToBounds = true
        
        self.setImage(UIImage(named: iconName), for: .normal)
        self.tintColor = UIColor(named: "cBlack")
        self.widthAnchor.constraint(equalToConstant: iconSize).isActive = true
        self.heightAnchor.constraint(equalToConstant: iconSize).isActive = true
        
        self.isEnabled = false
    }
}
