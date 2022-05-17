//
//  EndpointType.swift
//  O-Logo_MP
//
//  Created by Petrykevich, Kanstantsin on 17.05.22.
//

import Foundation
import Alamofire

protocol EndpointType {

    var baseURL: String { get }
    var path: String? { get }
    var httpMethod: HTTPMethod { get }
    var parameters: Parameters? { get }
    var headers: HTTPHeaders? { get }
    var fullURL: URL? { get }
}
