//
//  SourcesListView.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import SwiftUI

struct SourcesListView: View {
  @ObservedObject var presenter: SourcesListPresenter
    @State var searchText = ""
    @State var searching = false
  var body: some View {
    
    VStack(alignment: .leading) {
        SearchBar(searchText: $searchText, searching: $searching)
        List {
            ForEach(presenter.sources.filter({ (sources: Sources) -> Bool in
                return sources.name.hasPrefix(searchText) || searchText == ""
            }), id: \.name) { item in
                self.presenter.linkBuilder(for: item) {
                    SourcesListCell(sources: item)
                    .frame(height: 30)
                }
            }
        }
        .toolbar {
            if searching {
                Button("Cancel") {
                    searchText = ""
                    withAnimation {
                       searching = false
                       UIApplication.shared.dismissKeyboard()
                        
                    }
                }
            }
        }
        .navigationBarHidden(false)
        .gesture(DragGesture()
                    .onChanged({ _ in
            UIApplication.shared.dismissKeyboard()
                    })
        )
    }.navigationTitle("Sources")
    .navigationBarItems(leading: EmptyView())
  }
}
struct SourcesListCell: View {
  
  @ObservedObject var sources: Sources


  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .bottomLeading) {
        Text(self.sources.name)
          .font(.system(size: 20))
          .fontWeight(.bold)
            .foregroundColor(.black)
          .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
      }
      .cornerRadius(12)
    }
  }
}


