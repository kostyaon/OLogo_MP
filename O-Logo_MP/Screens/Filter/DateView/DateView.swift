//
//  DateView.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 16.05.22.
//

import Foundation
import UIKit

class DateView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var iconImageView: UIImageView!
    
    // MARK: - Properties
    
    // MARK: - Lifecycle method's
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    // MARK: - Helper method's
    func configure(title: String) {
        titleLabel.text = title
    }
    
}

// MARK: - Private
private
extension DateView {
    
    // Properties
    
    // Method's
    func commonInit() {
        Bundle.main.loadNibNamed("DateView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupUI()
    }
    
    func setupUI() {
        setupLabel()
        setupTextField()
        setupImageView()
    }
    
    func setupLabel() {
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .sacoBlue
        titleLabel.font = .semiBold(withSize: 10)
    }
    
    func setupTextField() {
        textField.backgroundColor = .clear
        textField.placeholder = "filter_date_placeholder".localized()
        textField.font = .semiBold(withSize: 14)
        textField.textColor = .sacoBlack
        textField.delegate = self
    }
    
    func setupImageView() {
        iconImageView.tintColor = .sacoBlue
        iconImageView.image = UIImage(named: "calendar_icon")?.withRenderingMode(.alwaysTemplate)
        iconImageView.contentMode = .scaleAspectFill
    }
}

// MARK: - UITextFieldDelegate
extension DateView: UITextFieldDelegate {
    
    
}
