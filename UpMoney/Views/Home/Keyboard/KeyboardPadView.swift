//
//  KeyboardPadViewController.swift
//  UpMoney
//
//  Created by Dulin Gleb on 29.2.24..
//

import UIKit

protocol KeyboardPadViewProtocol: AnyObject {
    func setupInitialState()
    func didLoadInfo(dataSource: [KeyboardButton])
}

final class KeyboardPadView: UIView {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let dataSource = KeyboardPadCollectionViewDataSource()
    var viewModel: KeyboardPadViewModel?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        viewModel?.viewLoaded()
        viewModel?.setupDatasource()
    }
}

extension KeyboardPadView: KeyboardPadViewProtocol {
    func setupInitialState() {
        configureCollectionView()
    }
    
    func didLoadInfo(dataSource: [KeyboardButton]) {
        self.dataSource.setupDataSouce(dataSource: dataSource)
    }
}

// MARK: - Configure
extension KeyboardPadView {
    func configureCollectionView() {
        collectionView.register(KeyboardPadCollectionViewCell.self, forCellWithReuseIdentifier: KeyboardPadCollectionViewCell.reuseId)
        collectionView.dataSource = self.dataSource
        collectionView.delegate = self.dataSource
        dataSource.collectionView = self.collectionView
        dataSource.delegate = self
    }
}

extension KeyboardPadView: KeyboardPadCollectionViewDataSourceDelegate {
    func didSelectCell(button: KeyboardButton) {
        self.viewModel?.setNumber(button: button)
    }
}




