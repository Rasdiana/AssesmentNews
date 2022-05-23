//
//  CategoriesModel.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Combine

final class CategoriesModel {
  private let persistence = Persistence()

  @Published var categories: [Categories] = []

  private var cancellables = Set<AnyCancellable>()

  func load() {
    persistence.load()
      .assign(to: \.categories, on: self)
      .store(in: &cancellables)
  }

  func save() {
    persistence.save(categories: categories)
  }

  func loadDefault(synchronous: Bool = false) {
    persistence.loadDefault(synchronous: synchronous)
      .assign(to: \.categories, on: self)
      .store(in: &cancellables)
  }
}

extension CategoriesModel: ObservableObject {}

/// Extension for SwiftUI previews
#if DEBUG
extension CategoriesModel {
  static var sample: CategoriesModel {
    let model = CategoriesModel()
    model.loadDefault(synchronous: true)
    return model
  }
}
#endif

