//
//  NewsViewModel.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 17.05.22.
//

import Foundation

class NewsViewModel: BaseViewModel {
    
    // Properties
    var currentPage = 1
    
    var totalHeadlineNews: Int?
    var headlineNews: [NewsResponse.News]?
    
    var searchNews: [NewsResponse.News]?
    var totalSearchNews: Int?
    
    // Method's
    func getHeadlineNews() {
        APIManager.loadFromServer(type: NewsResponse.self, router: Router.topHeadlines(pageNumber: currentPage)) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let response):
                this.totalHeadlineNews = response.totalArticles
                this.headlineNews = response.articles
                this.updateUI?()
            }
        }
    }
    
    func getSearchWith(seqarchQuery text: String, parameters: [SearchParameters]? = nil, from: String? = nil, to: String? = nil, sortBy: SearchSort? = nil) {
        APIManager.loadFromServer(type: NewsResponse.self, router: Router.searchIn(query: text, parameters: parameters
                                                                                   , from: from, to: to, sortBy: sortBy, pageNumber: currentPage)) { [weak self] result in
            guard let this = self else { return }
            switch result {
            case.failure(let error):
                print("Errror: \(error.localizedDescription)")
            case .success(let response):
                this.totalSearchNews = response.totalArticles
                this.searchNews = response.articles
                this.updateUI?()
            }
        }
    }
}
