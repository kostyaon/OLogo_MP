//
//  +UITableView.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

extension UITableView {
    
    func register(cellClass: UITableViewCell.Type) {
        let className = String(describing: cellClass)
        register(cellClass, forCellReuseIdentifier: className)
    }
    
    func register(nibWithClass: UITableViewCell.Type) {
        let className = String(describing: nibWithClass)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forCellReuseIdentifier: className)
    }
    
    func register(headerFooterClass aClass: UITableViewHeaderFooterView.Type) {
        let className = String(describing: aClass)
        register(aClass, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func register(headerFooterNib aClass: UITableViewHeaderFooterView.Type) {
        let className = String(describing: aClass)
        let nib = UINib(nibName: className, bundle: nil)
        register(nib, forHeaderFooterViewReuseIdentifier: className)
    }
    
    func dequeueReusableCell<T>(withType type: T.Type, for indexPath: IndexPath) -> T where T: UITableViewCell {
        let id = String(describing: type)
        return dequeueReusableCell(withIdentifier: id, for: indexPath) as! T
    }
    
    func dequeueReusableHeaderFooterView<T>(withType type: T.Type) -> T where T: UITableViewHeaderFooterView {
        let id = String(describing: type)
        return dequeueReusableHeaderFooterView(withIdentifier: id) as! T
    }
}

