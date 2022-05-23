//
//  ContentView.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: CategoriesModel

    var body: some View {
      NavigationView {
        CategoriesListView(presenter:
        CategoriesListPresenter(interactor:
          CategoriesListInteractor(model: model)))
      }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    let model = CategoriesModel.sample
    return ContentView()
      .environmentObject(model)
  }
}
#endif

