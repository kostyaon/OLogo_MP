//
//  SearchViewController.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 12.05.22.
//

import Foundation
import UIKit

class SearchViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var searchView: SearchView!
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private var totalNews = 0
    private var searchNews: [NewsResponse.News] = []
    private let newsViewModel = NewsViewModel()
    
    // MARK: - Lifecycle method's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchView.becomeFirstResponder()
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private
private
extension SearchViewController {
    
    // Properties
    var currentPage: Int {
        newsViewModel.currentPage
    }
    
    var numberOfSections: Int {
        return 1
    }
    
    // Method's
    func setupUI() {
        setupTableView()
        setupSearchView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedSectionHeaderHeight = 38
        tableView.separatorColor = .white
        tableView.contentInset = UIEdgeInsets(top: 17, left: 0, bottom: 0, right: 0)
        tableView.register(nibWithClass: NewsTableViewCell.self)
    }
    
    func setupSearchView() {
        searchView.onSearch = { [weak self] searchQuery in
            guard let this = self else { return }
            this.loadData()
        }
        searchView.onFilter = { [weak self] in
            guard let this = self else { return }
            this.navigationController?.pushViewController(FilterViewController(), animated: true)
        }
        searchView.onSort = { [weak self] in
            guard let this = self else { return }
            this.navigationController?.pushViewController(FilterViewController(), animated: true)
        }
    }
    
    func setupViewModel() {
        newsViewModel.updateUI = { [weak self] in
            guard let this = self else { return }
            this.totalNews = this.newsViewModel.totalSearchNews ?? 0
            this.searchNews += this.newsViewModel.searchNews ?? []
            this.tableView.reloadData()
        }
    }
    
    func loadData() {
        newsViewModel.getSearchWith(seqarchQuery: searchView.searchQuery)
    }
    
}

// MARK: - Table View
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return searchNews.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == searchNews.count - 1 && totalNews > searchNews.count {
            newsViewModel.currentPage += 1
            loadData()
        }
        
        if !searchNews.isEmpty {
            let cell = tableView.dequeueReusableCell(withType: NewsTableViewCell.self, for: indexPath)
            let news = searchNews[indexPath.row]
            cell.configure(title: news.title, subtitle: news.description, imageURL: URL(string: news.image))
            cell.selectionStyle = .none
            return cell
        }
        
        let cell = UITableViewCell()
        let label = UILabel()
        label.backgroundColor = .clear
        label.font = .semiBold(withSize: 14)
        label.textColor = .black
        label.text = "Quis trstique"
        label.translatesAutoresizingMaskIntoConstraints = false
        cell.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: cell.centerYAnchor),
            label.leadingAnchor.constraint(equalTo: cell.leadingAnchor, constant: 16)
        ])
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap on \(indexPath.section) section \(indexPath.row) row")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let labelHeaderView = LabelHeaderView()
        labelHeaderView.configureLabel(with: "search_history_title".localized())
        return labelHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 37
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 113
    }
}
