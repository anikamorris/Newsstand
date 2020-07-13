//
//  Encoder.swift
//  Newsstand
//
//  Created by Anika Morris on 7/13/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

public struct Encoder {

    static func encodeParameters(for urlRequest: inout URLRequest, with parameters: [String: Any]) throws {
        guard let url = urlRequest.url else { throw NetworkError.missingURL }

        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()
            for (key,value) in parameters {
                let queryItem = URLQueryItem(name: key, value: "\(value)")
                urlComponents.queryItems?.append(queryItem)
            }
            urlRequest.url = urlComponents.url
        }
        print(urlRequest)
    }

    static func setHeaders(for urlRequest: inout URLRequest, with headers: [String: String]) throws {
        for (key, value) in headers{
            urlRequest.setValue(value, forHTTPHeaderField: key)
        }
        print(urlRequest)
    }
}
