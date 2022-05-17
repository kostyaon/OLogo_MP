//
//  BaseViewModel.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 17.05.22.
//

import Foundation

class BaseViewModel: NSObject {
    
    var updateUI: Closure?
    var presentError: ((_ errorMessage: String) -> ())?
    var startLoading: Closure?
}
