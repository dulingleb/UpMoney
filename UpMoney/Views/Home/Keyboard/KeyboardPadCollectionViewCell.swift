//
//  KeyboardPadCollectionViewCell.swift
//  UpMoney
//
//  Created by Dulin Gleb on 29.2.24..
//

import UIKit

class KeyboardPadCollectionViewCell: UICollectionViewCell {
    static let reuseId = "KeyboardPadCell"
    
    private let imageSize = 24.0
    
    var keyboardButtonType: KeyboardButtonType = .digit
        
    let textLabel: UILabel = {
        let tl = UILabel()
        tl.translatesAutoresizingMaskIntoConstraints = false
        tl.font = .systemFont(ofSize: 24, weight: .semibold)
        return tl
    }()
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.tintColor = UIColor(named: "cBlack")
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(textLabel)
        
        NSLayoutConstraint.activate([
            textLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            textLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),

            imageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: self.imageSize),
            imageView.heightAnchor.constraint(equalToConstant: self.imageSize)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(withText text: String?) {
        textLabel.text = text
        
        if text == "." {
            textLabel.font = .systemFont(ofSize: 24, weight: .black)
        }
        
        textLabel.isHidden = text == nil
        imageView.isHidden = true
    }
    
    func configure(withImage image: UIImage?) {
        imageView.image = image
        imageView.isHidden = image == nil
        textLabel.isHidden = true
    }
}
