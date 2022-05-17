//
//  ConfigValues.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 11.05.22.
//

import Foundation

class ConfigValues {
    
    // Token
    static let token = UserDefaults.standard.string(forKey: "token")
    
    // Localization
    static let localizationFile = "Localizable"
    
    // Font's
    static let appFontRegular = "OpenSans-Regular"
    static let appFontBold = "OpenSans-Bold"
    static let appFontSemiBold = "OpenSans-SemiBold"
}
