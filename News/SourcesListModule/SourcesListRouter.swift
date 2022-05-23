//
//  SourcesListRouter.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI

class SourcesListRouter {
  func makeDetailView(for trip: Sources, model: SourcesModel) -> some View {
    let presenter = ArticlesListPresenter(interactor: ArticlesListInteractor(source: trip.id, model: ArticlesModel(), apiService: APIService()))
    return ArticlesListView(presenter: presenter)
  }
}
