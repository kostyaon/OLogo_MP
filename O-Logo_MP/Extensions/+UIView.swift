//
//  +UIView.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

extension UIView {
    
    func setShadow(offset: CGSize, radius: CGFloat, opacity: Float, shadowRadius: CGFloat = 5, color: UIColor? = nil) {
        layer.masksToBounds = false
        layer.cornerRadius = radius
        layer.shadowOffset = offset
        layer.shadowOpacity = opacity
        layer.shadowColor = color?.cgColor ?? UIColor.black.withAlphaComponent(0.5).cgColor
        layer.shadowRadius = shadowRadius
    }
}
