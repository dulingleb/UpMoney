//
//  MainScreenConfigurator.swift
//  UpMoney
//
//  Created by Dulin Gleb on 19.3.24..
//

import Foundation
import UIKit

final class MainScreenConfigurator {
    // MARK: - Instantiate module
    static func instantiateModule() -> MainViewController {
        let controller: MainViewController = MainViewController()
        let viewModel = MainViewModel()

        viewModel.view = controller
        controller.viewModel = viewModel

        return controller
    }
}
