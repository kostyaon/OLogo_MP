//
//  FilterViewController.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 16.05.22.
//

import Foundation
import UIKit

class FilterViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
//    @IBOutlet weak var fromDateView: DateView!
//    @IBOutlet weak var toDateView: DateView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchInLabel: UILabel!
    
    // MARK: - Properties
    override var isClearButtonHidden: Bool { false }
    
    // MARK: - Lifecycle method's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private
private
extension FilterViewController {
    
    // Properties
    
    // Method's
    func setupUI() {
        setupLabels()
    }
    
    func setupLabels() {
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .black
        titleLabel.font = .bold(withSize: 16)
        titleLabel.text = "filter_title".localized()
        
        dateLabel.backgroundColor = .clear
        dateLabel.textColor = .black
        dateLabel.font = .semiBold(withSize: 14)
        dateLabel.text = "filter_date_title".localized()
        
        searchLabel.backgroundColor = .clear
        searchLabel.textColor = .black
        searchLabel.font = .semiBold(withSize: 14)
        searchLabel.text = "filter_search_title".localized()
        
        searchInLabel.backgroundColor = .clear
        searchInLabel.textColor = .sacoDarkGray
        searchInLabel.font = .semiBold(withSize: 14)
        searchInLabel.text = "search_in_all".localized()
    }
}
