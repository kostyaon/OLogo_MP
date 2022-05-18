//
//  +UIColor.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

extension UIColor {
    
    class func rgba(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat = 1) -> UIColor {
        .init(red: r / 255, green: g / 255, blue: b / 255, alpha: a)
    }
    
    // MARK: - Black
    class var sacoBlack: UIColor {
        .rgba(30, 31, 33)
    }
    
    // MARK: - Gray
    class var gray247: UIColor {
        .rgba(247, 247, 247)
    }
    
    class var sacoDarkGray: UIColor {
        .rgba(147, 157, 174)
    }
    
    // MARK: - Orange
    class var sacoBlue: UIColor {
        .rgba(246, 143, 84)
    }
    
    // MARK: - Red
    class var sacoRed: UIColor {
        .rgba(255, 91, 111)
    }
}
