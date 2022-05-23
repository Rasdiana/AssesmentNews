//
//  CategoriesListView.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI

struct CategoriesListView: View {
  @ObservedObject var presenter: CategoriesListPresenter
  
  var body: some View {
    List {
        ForEach (presenter.categories, id: \.id) { item in
            self.presenter.linkBuilder(for: item) {
                CategoriesListCell(categories: item)
                .frame(height: 30)
            }
        }
     
    }
    .navigationBarTitle("News Categories", displayMode: .inline)
  }
}


struct CategoriesListCell: View {
  
  @ObservedObject var categories: Categories


  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .bottomLeading) {
        Text(self.categories.name)
          .font(.system(size: 20))
          .fontWeight(.bold)
            .foregroundColor(.black)
          .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
      }
      .cornerRadius(12)
    }
  }
}
