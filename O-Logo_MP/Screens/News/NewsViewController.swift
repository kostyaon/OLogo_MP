//
//  NewsViewController.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 11.05.22.
//

import Foundation
import UIKit

class NewsViewController: BaseViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    private let viewModel = NewsViewModel()
    private var news: [NewsResponse.News] = []
    
    // MARK: - Lifecycle method's
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        setupViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadData()
    }
    
    // MARK: - Helper method's
    
}

// MARK: - Private
private
extension NewsViewController {
    
    // Properties
    var numberOfSections: Int {
        return 1
    }
    
    // Method's
    func setupUI() {
        setupTableView()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.showsVerticalScrollIndicator = false
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.estimatedSectionHeaderHeight = 38
        tableView.separatorStyle = .none
        tableView.contentInset = UIEdgeInsets(top: 32, left: 0, bottom: 0, right: 0)
        tableView.register(nibWithClass: NewsTableViewCell.self)
    }
    
    func setupViewModel() {
        viewModel.updateUI = { [weak self] in
            guard let this = self else { return }
            this.news = self?.viewModel.headlineNews ?? []
            this.tableView.reloadData()
        }
    }
    
    func loadData() {
        viewModel.getHeadlineNews(page: 1)
    }
}

// MARK: - TableView Delegate and DataSource
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return news.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withType: NewsTableViewCell.self, for: indexPath)
        cell.configure(title: news[indexPath.row].title, subtitle: news[indexPath.row].description, image: nil)
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tap on \(indexPath.section) section \(indexPath.row) row")
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let labelHeaderView = LabelHeaderView()
        labelHeaderView.configureLabel(with: "news_title".localized())
        return labelHeaderView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 37
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
