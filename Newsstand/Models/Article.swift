//
//  Article.swift
//  Newsstand
//
//  Created by Anika Morris on 7/13/20.
//  Copyright © 2020 Anika Morris. All rights reserved.
//

import Foundation

struct Source: Codable {
    let id: String?
    let name: String?
}

struct Article: Codable {
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct ArticleAPIResponse: Codable {
    let status: String
    let totalResults: Int64
    let articles: [Article]
}
