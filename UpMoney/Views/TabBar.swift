//
//  TabBar.swift
//  UpMoney
//
//  Created by Dulin Gleb on 29.2.24..
//

import UIKit

class TabBar: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        setupVCs()
    }
    
    fileprivate func createNavController(for rootViewController: UIViewController,
                                         icon: Icon,
                                         title: String? = nil) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = icon.uiImage()
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: MainScreenConfigurator.instantiateModule(), icon: .home),
            createNavController(for: AccountsViewController(), icon: .wallet, title: NSLocalizedString("Accounts", comment: "")),
            createNavController(for: StatisticsViewController(), icon: .pieChart, title: NSLocalizedString("Statistics", comment: "")),
            createNavController(for: SettingsViewController(), icon: .setting, title: NSLocalizedString("Settings", comment: ""))
        ]
    }
}
