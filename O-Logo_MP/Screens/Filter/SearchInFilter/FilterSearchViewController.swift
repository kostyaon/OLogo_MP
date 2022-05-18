//
//  FilterSearchViewController.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 18.05.22.
//

import Foundation
import UIKit

class FilterSearchViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleParamLabel: UILabel!
    @IBOutlet weak var descriptionParamLabel: UILabel!
    @IBOutlet weak var contentParamLabel: UILabel!
    @IBOutlet weak var titleSwitch: OLogoSwitch!
    @IBOutlet weak var descriptionSwitch: OLogoSwitch!
    @IBOutlet weak var contentSwitch: OLogoSwitch!
    @IBOutlet weak var applyButton: OLogoButton!
    
    // MARK: - Properties
    override var isClearButtonHidden: Bool { false }
    
    // MARK: - Lifecycle method's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private
private
extension FilterSearchViewController {
    
    // Properties
    var switchArray: [OLogoSwitch] {
        [titleSwitch, descriptionSwitch, contentSwitch]
    }
    
    // Method's
    func setupUI() {
        setupLabels()
        setupClearButton()
    }
    
    func setupLabels() {
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .sacoBlack
        titleLabel.font = .bold(withSize: 16)
        
        titleParamLabel.backgroundColor = .clear
        titleParamLabel.textColor = .sacoBlack
        titleParamLabel.font = .semiBold(withSize: 14)
        
        descriptionParamLabel.backgroundColor = .clear
        descriptionParamLabel.textColor = .sacoBlack
        descriptionParamLabel.font = .semiBold(withSize: 14)
        
        contentParamLabel.backgroundColor = .clear
        contentParamLabel.textColor = .sacoBlack
        contentParamLabel.font = .semiBold(withSize: 14)
    }
    
    func setupClearButton() {
        onClear = {
            self.switchArray.forEach { $0.setOn(false, animated: true) }
        }
    }
}
