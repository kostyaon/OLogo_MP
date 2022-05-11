//
//  +String.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 11.05.22.
//

import Foundation

extension String {
    
    func localized() -> String {
        var localizedString = NSLocalizedString(self, tableName: ConfigValues.localizationFile, comment: "")
        localizedString = localizedString.replacingOccurrences(of: "%s", with: "%@")
        return localizedString
    }
}
