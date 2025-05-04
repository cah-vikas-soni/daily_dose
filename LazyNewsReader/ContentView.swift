//
//  ContentView.swift
//  LazyNewsReader
//
//  Created by Vikas Soni on 04/05/25.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NewsViewModel()

    var body: some View {
        NavigationView {
            VStack {
                List(viewModel.articles) { article in
                    NewsRow(article: article)
                        .onAppear {
                            viewModel.loadMoreArticlesIfNeeded(currentArticle: article)
                        }
                }
                .listStyle(.plain)
                .navigationTitle("Lazy News")

                if viewModel.isLoading && !viewModel.articles.isEmpty {
                    ProgressView("Loading more...")
                        .padding()
                }
            }
            .overlay(
                Group {
                    if viewModel.isLoading && viewModel.articles.isEmpty {
                        ProgressView("Loading News...")
                            .scaleEffect(1.3)
                            .padding()
                            .background(Color(.systemBackground).opacity(0.9))
                            .cornerRadius(12)
                    }
                }
            )
            .onAppear {
                viewModel.loadMoreArticlesIfNeeded(currentArticle: nil)
            }
        }
    }
}
