//
//  KeyboardPadCollectionView.swift
//  UpMoney
//
//  Created by Dulin Gleb on 29.2.24..
//

import UIKit

protocol KeyboardPadCollectionViewDelegate: AnyObject {
    func didPressNumberButton(withTitle title: String)
    func didPressBackspace()
}

enum KeyboardButtonType {
    case digit
    case backspace
}

class KeyboardPadCollectionView: UICollectionView, UICollectionViewDataSource, UICollectionViewDelegate {
    weak var keyboardPadCollectionViewDelegate: KeyboardPadCollectionViewDelegate?
    
    let numbers: [String] = [
        "1", "2", "3", "4", "5", "6", "7", "8", "9", ".", "0", "del"
    ]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = self
        self.delegate = self
        self.register(KeyboardPadCollectionViewCell.self, forCellWithReuseIdentifier: KeyboardPadCollectionViewCell.reuseId)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return numbers.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyboardPadCollectionViewCell.reuseId, for: indexPath) as! KeyboardPadCollectionViewCell
    
        switch numbers[indexPath.row] {
            case "del":
                cell.configure(withImage: UIImage(named: "Backspace"))
                cell.keyboardButtonType = .backspace
            default:
                cell.configure(withText: numbers[indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? KeyboardPadCollectionViewCell
        let selectedTitle = cell?.textLabel.text
        
        if cell?.keyboardButtonType == .digit {
            keyboardPadCollectionViewDelegate?.didPressNumberButton(withTitle: selectedTitle ?? "")
        } else if cell? .keyboardButtonType == .backspace {
            keyboardPadCollectionViewDelegate?.didPressBackspace()
        }
        
    }
}

extension KeyboardPadCollectionView: UICollectionViewDelegateFlowLayout {
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
