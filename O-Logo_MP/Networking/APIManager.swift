//
//  APIManager.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 17.05.22.
//

import Foundation
import Alamofire

struct APIManager {
    
    static func loadFromServer<T: Decodable>(type: T.Type, router: EndpointType, completion: @escaping (Result<T, Error>) -> Void) {
        AF.request(router.fullURL ?? "", method: router.httpMethod, parameters: router.parameters, encoding: URLEncoding(destination: .queryString), headers: router.headers).validate().responseDecodable(of: type) { response in
            if let error = response.error {
                completion(.failure(error))
            }
            
            if let decodableModel = response.value {
                completion(.success(decodableModel))
            }
        }
    }
}

