//
//  +UIFont.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

extension UIFont {
    
    class func bold(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ConfigValues.appFontBold, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func regular(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ConfigValues.appFontRegular, size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    class func semiBold(withSize size: CGFloat) -> UIFont {
        return UIFont(name: ConfigValues.appFontSemiBold, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
