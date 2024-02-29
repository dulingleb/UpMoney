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
                                         image: UIImage,
                                         title: String? = nil) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = image
        navController.navigationBar.prefersLargeTitles = true
        rootViewController.navigationItem.title = title
        return navController
    }
    
    func setupVCs() {
        viewControllers = [
            createNavController(for: MainViewController(), image: UIImage(named: "Home")!),
            createNavController(for: AccountsViewController(), image: UIImage(named: "Wallet")!, title: NSLocalizedString("Accounts", comment: "")),
            createNavController(for: StatisticsViewController(), image: UIImage(named: "PieChart")!, title: NSLocalizedString("Statistics", comment: "")),
            createNavController(for: SettingsViewController(), image: UIImage(named: "Settings")!, title: NSLocalizedString("Settings", comment: ""))
        ]
    }
}
