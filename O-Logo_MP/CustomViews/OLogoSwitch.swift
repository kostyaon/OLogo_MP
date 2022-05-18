//
//  OLogoSwitch.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 18.05.22.
//

import Foundation
import UIKit

class OLogoSwitch: UISwitch {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = .clear
        self.onTintColor = .sacoBlue
    }
}
