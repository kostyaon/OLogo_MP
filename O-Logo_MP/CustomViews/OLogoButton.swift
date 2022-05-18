//
//  OLogoButton.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

public typealias Closure = (() -> ())

class OLogoButton: UIButton {
    
    // MARK: - ButtonStyle
    enum ButtonStyle {
        
        case circle
        case circleSelected
        case filledWithOrange
    }
    
    // MARK: - Properties
    var onTap: Closure?
    var style: ButtonStyle = .filledWithOrange {
        didSet {
            setupButton()
        }
    }
    override var isSelected: Bool {
        didSet {
            if style == .circleSelected {
                isSelected ? selectedState() : unselectedState()
            }
        }
    }
    
    // MARK: - Lifecycle method's
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setupButton()
    }
    
    // MARK: - Helper method's
    func configureWith(image: UIImage?, renderingMode: UIImage.RenderingMode) {
        guard let image = image else { return }
        self.setImage(image.withRenderingMode(renderingMode), for: .normal)
    }
}

// MARK: - Private
private
extension OLogoButton {
    
    // Properties
    
    
    // @objc method's
    @objc func onButtonTap() {
        isSelected.toggle()
        print("Buttton is \(isSelected)")
    }
    
    // Method's
    func setupButton() {
        setupTarget()
        switch style {
        case .circle, .circleSelected:
            setupCircleButton()
        case .filledWithOrange:
            setupFilledButton()
        }
    }
    
    func setupTarget() {
        self.addTarget(self, action: #selector(onButtonTap), for: .touchUpInside)
    }
    
    func selectedState() {
        self.backgroundColor = .sacoBlue
        self.tintColor = .white
    }
    
    func unselectedState() {
        self.backgroundColor = .gray247
        self.tintColor = .black
    }
    
    func setupCircleButton() {
        self.layer.cornerRadius = self.bounds.width / 2
        self.contentMode = .center
        self.backgroundColor = .gray247
        self.tintColor = .black
        self.imageView?.contentMode = .scaleAspectFit
        self.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 12), forImageIn: .normal)
    }
    
    func setupFilledButton() {
        self.layer.cornerRadius = self.bounds.height / 2
        self.backgroundColor = .sacoBlue
        self.tintColor = .white
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .bold(withSize: 15)
    }
}
