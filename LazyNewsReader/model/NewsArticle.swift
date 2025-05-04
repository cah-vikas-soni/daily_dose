//
//  NewsArticle.swift
//  LazyNewsReader
//
//  Created by Vikas Soni on 04/05/25.
//

import Foundation

struct NewsArticle: Codable, Identifiable {
    let id: String
    let title: String
    let description: String?
    let urlToImage: String?
    let content: String?
}
