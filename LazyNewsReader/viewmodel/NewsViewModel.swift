//
//  NewsViewModel.swift
//  LazyNewsReader
//
//  Created by Vikas Soni on 04/05/25.
//

import Foundation

class NewsViewModel: ObservableObject {
    @Published var articles = [NewsArticle]()
    @Published var isLoading = false

    private var currentPage = 1
    private let service = NewsService()

    func loadMoreArticlesIfNeeded(currentArticle: NewsArticle?) {
        guard let currentArticle = currentArticle else {
            fetchArticles()
            return
        }

        let thresholdIndex = articles.index(articles.endIndex, offsetBy: -3)
        if articles.firstIndex(where: { $0.id == currentArticle.id }) == thresholdIndex {
            fetchArticles()
        }
    }

    func fetchArticles() {
        guard !isLoading else { return }
        isLoading = true

        service.fetchNews(page: currentPage) { [weak self] newArticles in
            DispatchQueue.main.async {
                self?.articles.append(contentsOf: newArticles)
                self?.currentPage += 1
                self?.isLoading = false
            }
        }
    }
}
