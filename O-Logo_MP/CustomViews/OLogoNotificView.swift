//
//  OLogoNotificView.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 16.05.22.
//

import Foundation
import UIKit

class OLogoNotificNumberView: UIView {
    
    // MARK: - Properties
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .bold(withSize: 10)
        label.textColor = textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
        return label
    }()
    
    // MARK: - Lifecycle method's
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.width / 2
    }
    
    // MARK: - Helper method's
    func configure(centerText: String) {
        textLabel.text = centerText
    }
}

// MARK: - Private
private
extension OLogoNotificNumberView {
    
    // Properties
    var circleColor: UIColor {
        return .sacoRed
    }
    
    var textColor: UIColor {
        return .white
    }
    
    // Method's
    func commonInit() {
        setupCircleView()
    }
    
    func setupCircleView() {
        self.backgroundColor = circleColor
    }
}
