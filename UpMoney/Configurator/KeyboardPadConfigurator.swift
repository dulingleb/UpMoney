//
//  KeyboardPadConfigurator.swift
//  UpMoney
//
//  Created by Dulin Gleb on 22.3.24..
//

import Foundation
import UIKit

final class KeyboardPadConfigurator {
    static func instatiateModule() -> KeyboardPadView {
        let view: KeyboardPadView = KeyboardPadView.loadFromNib()
        let viewModel = KeyboardPadViewModel()
        
        viewModel.view = view
        view.viewModel = viewModel
        
        return view
    }
}
