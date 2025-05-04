//
//  NewsService.swift
//  LazyNewsReader
//
//  Created by Vikas Soni on 04/05/25.
//

import Foundation

class NewsService {
    func fetchNews(page: Int, limit: Int = 10, completion: @escaping ([NewsArticle]) -> Void) {
        guard let url = URL(string: "https://68178c5926a599ae7c3ab907.mockapi.io/api/v1/news?page=\(page)&limit=\(limit)") else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data,
                  let articles = try? JSONDecoder().decode([NewsArticle].self, from: data) else {
                completion([])
                return
            }

            completion(articles)
        }.resume()
    }
}
