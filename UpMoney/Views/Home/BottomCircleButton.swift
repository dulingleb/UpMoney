//
//  BottomCircleButton.swift
//  UpMoney
//
//  Created by Dulin Gleb on 29.2.24..
//

import UIKit

class BottomCircleButton: UIButton {


    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(iconName: String) {
        let configuration = UIButton.Configuration.gray()
        self.configuration = configuration
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        
        self.setImage(UIImage(named: iconName), for: .normal)
        self.tintColor = UIColor(named: "cBlack")
        self.widthAnchor.constraint(equalToConstant: 50).isActive = true
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.isEnabled = false
    }
}
