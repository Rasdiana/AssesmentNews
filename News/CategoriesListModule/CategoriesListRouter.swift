//
//  CategoriesListRouter.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI

class CategoriesListRouter {
  func makeDetailView(for trip: Categories, model: CategoriesModel) -> some View {
    let presenter = SourcesListPresenter(interactor: SourcesListInteractor(name: trip.name, model: SourcesModel(), apiService: APIService()))
    return SourcesListView(presenter: presenter)
  }
}
