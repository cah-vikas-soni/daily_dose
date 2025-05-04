//
//  NewsRow.swift
//  LazyNewsReader
//
//  Created by Vikas Soni on 04/05/25.
//

import SwiftUI

struct NewsRow: View {
    let article: NewsArticle

    var body: some View {
        HStack(alignment: .top) {
            if let urlString = article.urlToImage, let url = URL(string: urlString) {
                AsyncImage(url: url) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 80, height: 80)
                .cornerRadius(6)
            } else {
                Rectangle().fill(Color.gray).frame(width: 80, height: 80)
            }

            VStack(alignment: .leading, spacing: 5) {
                Text(article.title)
                    .font(.headline)
                    .lineLimit(2)

                if let desc = article.description {
                    Text(desc)
                        .font(.subheadline)
                        .lineLimit(2)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 8)
    }
}
