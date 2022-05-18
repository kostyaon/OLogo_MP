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
    @IBOutlet weak var fromDateView: DateView!
    @IBOutlet weak var toDateView: DateView!
    @IBOutlet weak var searchLabel: UILabel!
    @IBOutlet weak var searchInLabel: UILabel!
    @IBOutlet weak var applyButton: OLogoButton!
    
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
    
    // @objc method's
    @objc func onSearchIn() {
        print("On search in")
    }
    
    // Method's
    func setupUI() {
        setupLabels()
        setupDateViews()
        setupButton()
        setupSearchInAction()
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
        searchInLabel.isUserInteractionEnabled = true
    }
    
    func setupDateViews() {
        fromDateView.configure(title: "filter_from".localized())
        toDateView.configure(title: "filter_to".localized())
    }
    
    func setupButton() {
        applyButton.setTitle("apply_filter_button".localized(), for: .normal)
        applyButton.onTap = { [weak self] in
            guard let this = self else { return }
            print("On Apply Filter button")
            this.navigationController?.pushViewController(FilterSearchViewController(), animated: true)
        }
    }
    
    func setupSearchInAction() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onSearchIn))
        searchInLabel.addGestureRecognizer(tapGesture)
    }
}
