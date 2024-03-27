//
//  KeyboardPadCollectionViewDataSource.swift
//  UpMoney
//
//  Created by Dulin Gleb on 20.3.24..
//

import Foundation
import UIKit

protocol KeyboardPadCollectionViewDataSourceDelegate: AnyObject {
    func didSelectCell(button: KeyboardButton)
}

final class KeyboardPadCollectionViewDataSource: NSObject {
    weak var delegate: KeyboardPadCollectionViewDataSourceDelegate?
    weak var collectionView: UICollectionView?
    
    private var dataSource: [KeyboardButton] = []
    
    func setupDataSouce(dataSource: [KeyboardButton]) {
        self.dataSource = dataSource
    }
}

// MARK: - UICollectionViewDataSource
extension KeyboardPadCollectionViewDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardPadCollectionViewCell.reuseId, for: indexPath) as! KeyboardPadCollectionViewCell
    
        cell.configure(dataSource[indexPath.row])
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension KeyboardPadCollectionViewDataSource: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let button = self.dataSource[indexPath.item]
        self.delegate?.didSelectCell(button: button)
    }
}

extension KeyboardPadCollectionViewDataSource: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let columns: CGFloat = 3
        let collectionViewWidth = collectionView.bounds.width
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let spaceBetweenCells = flowLayout.minimumInteritemSpacing * (columns - 1)
        let adjustedWidth = collectionViewWidth - spaceBetweenCells
        let width: CGFloat = adjustedWidth / columns
        let height: CGFloat = (collectionView.bounds.height / 3) - (flowLayout.minimumLineSpacing * 3)
        return CGSize(width: width, height: height)
    }
}
