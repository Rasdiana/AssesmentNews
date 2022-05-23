//
//  ArticlePresenter.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import SwiftUI
import Combine

class ArticlePresenter: ObservableObject {
  private let interactor: ArticleInteractor
  private let router: ArticleRouter

  private var cancellables = Set<AnyCancellable>()

    public var test : String?
    @Published var author: String?
    @Published var title : String?
    @Published var description : String?
    @Published var url :  String?
    @Published var urlToImage :  String?
    @Published var publishedAt :  String?
    @Published var content :  String?

  init(interactor: ArticleInteractor) {
    self.interactor = interactor
    self.router = ArticleRouter()

//    setSourceName = Binding<String> (
//        get: { interactor.name },
//        set: { interactor.setSourceName($0) }
//    )
//
//    setDescription = Binding<String> (
//        get: { interactor.description },
//        set: { interactor.setDescription($0) }
//    )
//
//    setUrl = Binding<String> (
//        get: { interactor.url },
//        set: { interactor.setUrl($0) }
//    )
//
    
    interactor.$title
      .assign(to: \.title, on: self)
      .store(in: &cancellables)
    
    interactor.$description
      .assign(to: \.description, on: self)
      .store(in: &cancellables)
    
    interactor.$author
      .assign(to: \.author, on: self)
      .store(in: &cancellables)
    
    interactor.$url
        .assign(to: \.url, on: self)
      .store(in: &cancellables)
    
    interactor.$urlToImage
      .assign(to: \.urlToImage, on: self)
      .store(in: &cancellables)
    
    interactor.$publishedAt
      .assign(to: \.publishedAt, on: self)
      .store(in: &cancellables)
    
    interactor.$content
        .assign(to: \.content, on: self)
      .store(in: &cancellables)
    
//    interactor.$contentFinal
//            .assign(to: \.content, on: self)
//          .store(in: &cancellables)
    
    
  }
}

