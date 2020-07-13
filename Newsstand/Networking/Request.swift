//
//  Request.swift
//  Newsstand
//
//  Created by Anika Morris on 7/13/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case patch = "PATCH"
    case delete = "DELETE"
}

public enum Route: String {
    case topHeadlines = "top-headlines"
    case everything = "everything"
}

struct Request {
    
    static let headers = [
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "\(Constants().apiKey)"
    ]
        
    static func configureRequest(from route: Route, with parameters: [String: Any], and method: HTTPMethod, contains body: Data?) throws -> URLRequest {

        guard let url = URL(string: "https://newsapi.org/v2/\(route.rawValue)?country=us") else { fatalError("Error while unwrapping url")}
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10.0)
        request.httpMethod = method.rawValue
        request.httpBody = body
        try configureParametersAndHeaders(parameters: parameters, headers: headers, request: &request)
        print(request, request.allHTTPHeaderFields ?? "")
        return request
    }
    
    static func configureParametersAndHeaders(parameters: [String: Any]?,
                                                  headers: [String: String]?,
                                                  request: inout URLRequest) throws {
        do {
            if let headers = headers, let parameters = parameters {
                try Encoder.encodeParameters(for: &request, with: parameters)
                try Encoder.setHeaders(for: &request, with: headers)
            }
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}
