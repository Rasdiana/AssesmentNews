//
//  ArticleInterator.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import Foundation
import Combine

class ArticleInteractor {
    private let articles : Articles
  private let model: ArticlesModel

  private var cancellables = Set<AnyCancellable>()

    @Published var author: String?
    @Published var title : String?
    @Published var description : String?
    @Published var url :  String?
    @Published var urlToImage :  String?
    @Published var publishedAt :  String?
    @Published var content :  String?
//    @Published var contentFinal : String = ""

    init (articles: Articles, model: ArticlesModel) {
        self.articles = articles
        self.model = model
        

        articles.$author.assign(to: \.author, on: self).store(in: &cancellables)
        articles.$title.assign(to: \.title, on: self).store(in: &cancellables)
        articles.$description.assign(to: \.description, on: self).store(in: &cancellables)
        articles.$url.assign(to: \.url, on: self).store(in: &cancellables)
        articles.$urlToImage.assign(to: \.urlToImage, on: self).store(in: &cancellables)
        articles.$publishedAt.assign(to: \.publishedAt, on: self).store(in: &cancellables)
        articles.$content.assign(to: \.content, on: self).store(in: &cancellables)
        
//        articles.$content.assign(to: \.contentFinal, on: self).store(in: &cancellables)
        
    }
        
//    func setSourceName(_ name : String){
//        source.name = name
//    }
//
//    func setDescription(_ description : String)
//    {
//        source.description = description
//    }
//
//    func setUrl(_ url : String){
//        source.url = url
//    }

}

