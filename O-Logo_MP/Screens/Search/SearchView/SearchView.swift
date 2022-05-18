//
//  SearchView.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

class SearchView: UIView {
    
    // MARK: - Outlets
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var filterButton: OLogoButton!
    @IBOutlet weak var sortButton: OLogoButton!
    
    // MARK: - Properties
    var onSearch: ((String) -> ())?
    var onFilter: Closure?
    var onSort: Closure?
    var searchQuery: String {
        searchBar.text ?? ""
    }
    private lazy var notifyView: OLogoNotificNumberView = {
        let notifyView = OLogoNotificNumberView()
        notifyView.translatesAutoresizingMaskIntoConstraints = false
        filterButton.addSubview(notifyView)
        NSLayoutConstraint.activate([
            notifyView.trailingAnchor.constraint(equalTo: filterButton.trailingAnchor),
            notifyView.topAnchor.constraint(equalTo: filterButton.topAnchor),
            notifyView.widthAnchor.constraint(equalToConstant: 15),
            notifyView.heightAnchor.constraint(equalToConstant: 15)
        ])
        return notifyView
    }()
    
    // MARK: - Lifecycle method's
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    @IBAction func onFilter(_ sender: Any) {
        print("OnFilter tap")
        onFilter?()
    }
    
    @IBAction func onSort(_ sender: Any) {
        print("OnSort tap")
        onSort?()
    }
    
    // MARK: - Helper method's
    func configureFilterButton(with number: Int) {
        notifyView.configure(centerText: "\(number)")
    }
    
    func searchBarFirstResponder() {
        searchBar.becomeFirstResponder()
    }
    
    func searchBarResignResponder() {
        searchBar.resignFirstResponder()
    }
}

// MARK: - Private
private
extension SearchView {
    
    // Properties
    
    // Method's
    func setupUI() {
        setupContentView()
        setupSearchBar()
        setupButtons()
    }
    
    func setupContentView() {
        contentView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        contentView.setShadow(offset: CGSize(width: 0, height: 5), radius: 20, opacity: 0.1)
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
        
        let searchBarTextField = searchBar.searchTextField
        searchBarTextField.font = .semiBold(withSize: 14)
        searchBarTextField.placeholder = "search_placeholder".localized()
        searchBarTextField.layer.cornerRadius = 17
        searchBarTextField.layer.masksToBounds = true
        
        let firstLayer = searchBarTextField.layer.sublayers?[0] ?? CALayer()
        let ourLayer = firstLayer.sublayers?[0] ?? CALayer()
        ourLayer.backgroundColor = UIColor.red.cgColor
    }
    
    func setupButtons() {
        filterButton.style = .circle
        filterButton.configureWith(image: UIImage(named: "filter_icon"), renderingMode: .alwaysTemplate)
        sortButton.style = .circleSelected
        sortButton.configureWith(image: UIImage(named: "sort_icon"), renderingMode: .alwaysTemplate)
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("SearchView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        setupUI()
    }
}

// MARK: - UISearchBarDelegate
extension SearchView: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text, text.count > 0 else {
            searchBar.resignFirstResponder()
            return
        }
        onSearch?(text)
        searchBar.resignFirstResponder()
    }
}
