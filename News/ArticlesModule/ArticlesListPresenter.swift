//
//  ArticlesListPresenter.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import SwiftUI
import Combine

class ArticlesListPresenter: ObservableObject {
  private let interactor : ArticlesListInteractor
    private let router : ArticlesListRouter
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var articles: [Articles] = []
    @Published var source : String = ""
    @Published var query : String = ""
  
  init(interactor: ArticlesListInteractor) {
    self.interactor = interactor
    self.router = ArticlesListRouter()
    
    source = interactor.source
    interactor.model.source = interactor.source

    interactor.model.$articles
        .assign(to: \.articles, on: self)
        .store(in: &cancellables)
  }
    
  func linkBuilder<Content: View>(for articles: Articles, @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeDetailView(for: articles, model: interactor.model)) {
      content()
    }
  }
}

