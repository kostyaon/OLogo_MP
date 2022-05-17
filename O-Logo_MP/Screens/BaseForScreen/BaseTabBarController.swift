//
//  BaseTabBarController.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 11.05.22.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    
    // MARK: - Lifecycle method's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupControllers()
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private method's
private
extension BaseTabBarController {
    
    func createNavBar(for rootVC: UIViewController, title: String, image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: rootVC)
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(named: image)?.withRenderingMode(.alwaysTemplate)
        return navController
    }
    
    func setupTabBar() {
        let tabBar = UITabBar.appearance()
        tabBar.isTranslucent = false
        tabBar.barTintColor = .systemOrange
        
        let color = UIColor.white
        let fontColor = UIColor.systemOrange
        let unselectedColor = UIColor.gray
        
        if #available(iOS 15, *) {
            let tabBarAppearance = UITabBarAppearance()
            tabBarAppearance.backgroundColor = color
            tabBarAppearance.stackedLayoutAppearance.selected.titleTextAttributes = [.foregroundColor: fontColor, .font: UIFont.boldSystemFont(ofSize: 13)]
            tabBarAppearance.stackedLayoutAppearance.normal.titleTextAttributes = [.foregroundColor: unselectedColor, .font: UIFont.systemFont(ofSize: 13)]
            tabBarAppearance.stackedLayoutAppearance.normal.iconColor = unselectedColor
            tabBar.standardAppearance = tabBarAppearance
            tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            tabBar.barTintColor = color
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)], for: .normal)
        }
        
        tabBar.tintColor = fontColor
        tabBar.unselectedItemTintColor = unselectedColor
    }
    
    func setupControllers() {
        viewControllers = [
            createNavBar(for: UIViewController(), title: "tab_home".localized(), image: "home_tab"),
            createNavBar(for: NewsViewController(), title: "tab_news".localized(), image: "news_tab"),
            createNavBar(for: SearchViewController(), title: "tab_search".localized(), image: "search_tab"),
            createNavBar(for: UIViewController(), title: "tab_profile".localized(), image: "profile_tab"),
            createNavBar(for: UIViewController(), title: "tab_more".localized(), image: "more_tab")
        ]
    }
}
