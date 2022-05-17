//
//  Router.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 17.05.22.
//

import Foundation
import Alamofire

enum SearchParameters: String {
    
    case description = "description"
    case title = "title"
    case content = "content"
}

enum SearchSort: String {
    
    case uploadDate = "publishedAt"
    case relevance = "relevance"
}

enum Router {
    
    case searchIn(query: String, parameters: [SearchParameters]?, from: String?, to: String?, sortBy: SearchSort?, pageNumber: String?)
}

extension Router: EndpointType {
    
    var baseURL: String {
        return "https://gnews.io/api/v4/search"
    }
    
    var path: String? {
       return nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
    
    var parameters: Parameters? {
        switch self {
        case .searchIn(let query, let parameters, let from, let to, let sortBy, let pageNumber):
            var queryParameters = "title, description, content"
            if let parameters = parameters {
                queryParameters = convertToQuery(parameters: parameters) ?? ""
            }
            return [
                "q": query,
                "max": 50,
                "page": pageNumber ?? "",
                "in": queryParameters,
                "from": from ?? "",
                "to": to ?? "",
                "sortby": sortBy?.rawValue ?? "",
                "token": ConfigValues.token
            ]
        }
    }
    
    var headers: HTTPHeaders? {
        return [
            "Accept": "application/json",
            "Content-Type": "application/json",
        ]
    }
    
    var fullURL: URL? {
        return URL(string: self.baseURL + (self.path ?? ""))
    }
    
    // Method's
    func convertToQuery(parameters: [SearchParameters]?) -> String? {
        guard let parameters = parameters else { return nil}
        let rawParameters = parameters.map {
            return $0.rawValue
        }
        let queryParameters = rawParameters.joined(separator: ",")
        return queryParameters
    }
}
