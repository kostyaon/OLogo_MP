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
        
        setupLogo()
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private method's
private
extension BaseViewController {
    
    func setupLogo() {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        self.navigationItem.titleView = logoImageView
    }
}
