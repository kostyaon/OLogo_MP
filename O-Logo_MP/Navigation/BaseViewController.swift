//
//  BaseViewController.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 11.05.22.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle method's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarAppearance()
        setupLogo()
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private method's
private
extension BaseViewController {
    
    func setupNavBarAppearance() {
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = .white
        navBarAppearance.shadowImage = UIImage()
        navBarAppearance.shadowColor = .clear
        navigationItem.standardAppearance = navBarAppearance
        navigationItem.scrollEdgeAppearance = navBarAppearance
        
        let buttonAppearance = UIBarButtonItemAppearance()
        buttonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.systemOrange]
        navigationItem.standardAppearance?.buttonAppearance = buttonAppearance
    }
    
    func setupLogo() {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        self.navigationItem.titleView = logoImageView
    }
}
