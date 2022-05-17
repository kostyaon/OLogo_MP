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
    
}

// MARK: - Private
private
extension DateView {
    
    // Properties
    
    // Method's
    func commonInit() {
        Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupUI()
    }
    
    func setupUI() {
        
    }
}
