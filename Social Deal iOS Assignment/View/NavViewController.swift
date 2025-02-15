//
//  NavViewController.swift
//  Social Deal iOS Assignment
//
//  Created by CodeBlock on 15/02/2025.
//

import UIKit

class NavViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    private func setupTabBar() {
        let dealsViewController = DealsOverviewViewController()
        let favouriteViewController = FavouriteViewController()
        let settingsViewController = SettingsViewController()

        dealsViewController.tabBarItem = UITabBarItem(
            title: "Deals",
            image: UIImage(systemName: "ticket"),
            selectedImage: UIImage(systemName: "ticket.fill")
        )
        
        favouriteViewController.tabBarItem = UITabBarItem(
            title: "Favourite",
            image: UIImage(systemName: "star"),
            selectedImage: UIImage(systemName: "star.fill")
        )
        
        settingsViewController.tabBarItem = UITabBarItem(
            title: "Settings",
            image: UIImage(systemName: "gear"),
            selectedImage: UIImage(systemName: "gear.fill")
        )

        let dealsNavigationController = UINavigationController(rootViewController: dealsViewController)
        let favouriteNavigationController = UINavigationController(rootViewController: favouriteViewController)
        let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)

        viewControllers = [dealsNavigationController, favouriteNavigationController, settingsNavigationController]
    }
}
