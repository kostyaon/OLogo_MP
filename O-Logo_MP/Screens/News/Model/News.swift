//
//  News.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 17.05.22.
//

import Foundation

struct NewsResponse: Decodable {
    
    let totalArticles: Int
    let articles: [News]
}

extension NewsResponse {
    
    struct News: Decodable {
        
        let title: String
        let description: String
        let content: String
        let url: String
        let image: String
        let publishedAt: String
        let source: Source
    }
    
    struct Source: Decodable {
        
        let name: String
        let url: String
    }
    
}

