//
//  NewsViewModel.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 17.05.22.
//

import Foundation

class NewsViewModel: BaseViewModel {
    
    // Properties
    var headlineNews: [NewsResponse.News]?
    
    // Method's
    func getHeadlineNews(page: Int) {
        APIManager.loadFromServer(type: NewsResponse.self, router: Router.topHeadlines(pageNumber: page)) { result in
            switch result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let response):
                self.headlineNews = response.articles
                self.updateUI?()
            }
        }
    }
}
