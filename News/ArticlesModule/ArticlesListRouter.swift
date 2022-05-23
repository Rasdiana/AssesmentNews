//
//  ArticlesListRouter.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import SwiftUI

class ArticlesListRouter {
  func makeDetailView(for trip: Articles, model: ArticlesModel) -> some View {
    let presenter = ArticlePresenter(interactor: ArticleInteractor(articles: trip, model: model))
    return ArticleView(presenter: presenter)
  }
}
