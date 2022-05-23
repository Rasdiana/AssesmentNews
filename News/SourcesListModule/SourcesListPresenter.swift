//
//  SourcesListPresenter.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI
import Combine

class SourcesListPresenter: ObservableObject {
  private let interactor : SourcesListInteractor
    private let router : SourcesListRouter
  
  private var cancellables = Set<AnyCancellable>()
  
  @Published var sources: [Sources] = []
    @Published var name : String = ""
    @Published var query : String = ""
  
  init(interactor: SourcesListInteractor) {
    self.interactor = interactor
    self.router = SourcesListRouter()
    
    name = interactor.name
    interactor.model.category = interactor.name

    interactor.model.$sources
        .assign(to: \.sources, on: self)
        .store(in: &cancellables)
  }
    
  func linkBuilder<Content: View>(for sources: Sources, @ViewBuilder content: () -> Content
  ) -> some View {
    NavigationLink(destination: router.makeDetailView(for: sources, model: interactor.model)) {
      content()
    }
  }
}

