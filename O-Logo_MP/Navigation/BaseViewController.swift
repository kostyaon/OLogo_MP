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
    var onClear: Closure?
    var isClearButtonHidden: Bool { true }
    
    // MARK: - Lifecycle method's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavBarAppearance()
        setupLogo()
        
        if !isClearButtonHidden {
            setupClearButton()
        }
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private method's
private
extension BaseViewController {
    
    // @objc method's
    @objc func onClearTap() {
        print("OnClear tap")
        onClear?()
    }
    
    // Method's
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
        
        navigationController?.navigationBar.tintColor = .sacoBlue
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
    func setupLogo() {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "logo")
        self.navigationItem.titleView = logoImageView
    }
    
    func setupClearButton() {
        let clearTitle = UILabel()
        clearTitle.backgroundColor = .clear
        clearTitle.textColor = .sacoBlue
        clearTitle.text = "clear_title".localized()
        clearTitle.font = .semiBold(withSize: 14)
        
        let clearImageView = UIImageView()
        clearImageView.backgroundColor = .clear
        clearImageView.image = UIImage(named: "clear_button")?.withRenderingMode(.alwaysTemplate)
        clearImageView.contentMode = .scaleAspectFill
        
        let stackView = UIStackView()
        stackView.isUserInteractionEnabled = true
        stackView.axis = .horizontal
        stackView.spacing = 12
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(onClearTap))
        stackView.addGestureRecognizer(tapRecognizer)
        
        stackView.addArrangedSubview(clearTitle)
        stackView.addArrangedSubview(clearImageView)
        
        let clearButton = UIBarButtonItem()
        clearButton.customView = stackView
        self.navigationItem.rightBarButtonItem = clearButton
    }
}
