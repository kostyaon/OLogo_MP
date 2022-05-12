//
//  LabelHeaderView.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

class LabelHeaderView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
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
    func configureLabel(with text: String) {
        titleLabel.text = text
    }
}

// MARK: - Private
private
extension LabelHeaderView {
    
    // Label properties
    var labelColor: UIColor {
        return .black
    }
    
    var labelFont: UIFont {
        return .bold(withSize: 16)
    }
    
    // Method's
    func commonInit() {
        Bundle.main.loadNibNamed("LabelHeaderView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupUI()
    }
    
    func setupUI() {
        titleLabel.textColor = labelColor
        titleLabel.font = labelFont
    }
}
