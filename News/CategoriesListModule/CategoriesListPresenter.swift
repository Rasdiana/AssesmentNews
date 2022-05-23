//
//  CategoriesListPresenter.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI
import Combine

class CategoriesListPresenter: ObservableObject {
  private let interactor : CategoriesListInteractor
    private let router : CategoriesListRouter
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var categories: [Categories] = []
  
  init(interactor: CategoriesListInteractor) {
    self.interactor = interactor
    self.router = CategoriesListRouter()
    
    interactor.model.$categories
      .assign(to: \.categories, on: self)
      .store(in: &cancellables)
  }
  
  
  func linkBuilder<Content: View>(for categories: Categories, @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeDetailView(for: categories, model: interactor.model)) {
      content()
    }
  }
}
