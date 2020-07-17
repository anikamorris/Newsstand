//
//  APIClient.swift
//  Newsstand
//
//  Created by Anika Morris on 7/13/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

struct APIClient {
    let session = URLSession(configuration: .default)
    var parameters = [
           "sortBy": "publishedAt",
           "language": "en"
    ]
    
    func getHeadlines(for topic: String, _ completion: @escaping (Result<[Article]>) -> ()) {
        do {
          // Creating the request
            var params = self.parameters
            params["q"] = topic
            let request = try Request.configureRequest(from: .everything, with: params, and: .get, contains: nil)
            session.dataTask(with: request) { (data, response, error) in

                if let response = response as? HTTPURLResponse, let data = data {

                    let result = Response.handleResponse(for: response)
                    switch result {
                    case .success:
                        //Decode if successful
                        let result = try? JSONDecoder().decode(ArticleAPIResponse.self, from: data)
                        guard result != nil else {
                            print("\n" + String(decoding: data, as: UTF8.self))
                            return
                        }
                        completion(Result.success(result!.articles))

                    case .failure:
                        completion(Result.failure(NetworkError.decodingFailed))
                    }
                }
            }.resume()
        } catch {
            completion(Result.failure(NetworkError.badRequest))
        }
    }
}
