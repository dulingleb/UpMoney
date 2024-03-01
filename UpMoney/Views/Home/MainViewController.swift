//
//  ViewController.swift
//  UpMoney
//
//  Created by Dulin Gleb on 28.2.24..
//

import UIKit

class MainViewController: UIViewController {
    private let margin20 = 20.0
    private let margin36 = 36.0
    private let margin10 = 10.0
    private let heightBottomBtnStack = 50.0
    
    let keyboardPadCollectionView: KeyboardPadCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let kPad = KeyboardPadCollectionView(frame: .zero, collectionViewLayout: layout)
        kPad.translatesAutoresizingMaskIntoConstraints = false
        return kPad
    }()
    
    let calendarButton: BottomCircleButton = {
        let btn = BottomCircleButton(type: .custom)
        btn.configure(iconName: "Calendar")
        return btn
    }()
    
    let commentButton: BottomCircleButton = {
        let btn = BottomCircleButton(type: .custom)
        btn.configure(iconName: "Edit")
        return btn
    }()
    
    let addTransactionButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.cornerStyle = .capsule
        let btn = UIButton(type: .custom)
        btn.configuration = configuration
        
        btn.setTitle("Add", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
        btn.isEnabled = false
        return btn
    }()
    
    let bottomBtnStackView: UIStackView = {
        let botBtnStackView = UIStackView()
        botBtnStackView.axis = .horizontal
        botBtnStackView.spacing = 10
        botBtnStackView.alignment = .fill
        botBtnStackView.distribution = .fill
        botBtnStackView.translatesAutoresizingMaskIntoConstraints = false
        
        return botBtnStackView
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        bottomBtnStackView.addArrangedSubview(calendarButton)
        bottomBtnStackView.addArrangedSubview(addTransactionButton)
        bottomBtnStackView.addArrangedSubview(commentButton)
        
        
        view.addSubview(bottomBtnStackView)
        view.addSubview(keyboardPadCollectionView)
    }
}

extension MainViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            bottomBtnStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant:  -margin20),
            bottomBtnStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  margin36),
            bottomBtnStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -margin36),
            bottomBtnStackView.heightAnchor.constraint(equalToConstant: heightBottomBtnStack),
            
            keyboardPadCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            keyboardPadCollectionView.widthAnchor.constraint(equalToConstant: 337),
            keyboardPadCollectionView.heightAnchor.constraint(equalToConstant: 218),
            keyboardPadCollectionView.bottomAnchor.constraint(equalTo: bottomBtnStackView.topAnchor, constant: -margin20)
        ])
    }
}
