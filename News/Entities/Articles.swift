//
//  Article.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Foundation
import Combine

final class Articles {
    @Published var author : String?
    @Published var title : String?
    @Published var description : String?
    @Published var url :  String?
    @Published var urlToImage :  String?
    @Published var publishedAt :  String?
    @Published var content :  String?
    
    required init(from decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        author = try container.decode(String?.self, forKey: .author)
        title = try container.decode(String?.self, forKey: .title)
        description = try container.decode(String?.self, forKey: .description)
        url = try container.decode(String?.self, forKey: .url)
        urlToImage = try container.decode(String?.self, forKey: .urlToImage)
        publishedAt = try container.decode(String?.self, forKey: .publishedAt)
        content = try container.decode(String?.self, forKey: .content)
        if url != nil {
            url = url?.trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
    
}

extension Articles : Codable {
    enum CodingKeys : CodingKey {
        case author
        case title
        case description
        case url
        case urlToImage
        case publishedAt
        case content
    }
    
    func encode(to encoder : Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(author, forKey: .author)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(url, forKey: .url)
        
        try container.encode(urlToImage, forKey: .urlToImage)
        try container.encode(publishedAt, forKey: .publishedAt)
        try container.encode(content, forKey: .content)
        
    }
}

extension Articles : Identifiable {}
extension Articles : ObservableObject {}

struct ArticleResponse: Codable {
    let status : String
    let totalResults : Int
  let articles: [Articles]
}

