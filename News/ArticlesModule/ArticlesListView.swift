//
//  ArticlesListView.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import SwiftUI

struct ArticlesListView: View {
  @ObservedObject var presenter: ArticlesListPresenter
    @State var searchText = ""
    @State var searching = false
  var body: some View {
    
    VStack(alignment: .leading) {
        SearchBar(searchText: $searchText, searching: $searching)
        List {
            ForEach(presenter.articles.filter({ (article: Articles) -> Bool in
                return article.title!.hasPrefix(searchText) || searchText == ""
            }), id: \.title) { item in
                self.presenter.linkBuilder(for: item) {
                    ArticlesListCell(articles: item)
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
    }.navigationTitle("Articles")
    .navigationBarItems(leading: EmptyView())
  }
    
}

struct ArticlesListCell: View {
  
  @ObservedObject var articles: Articles


  var body: some View {
    GeometryReader { geometry in
      ZStack(alignment: .bottomLeading) {
        Text(self.articles.title ?? "No Title")
          .font(.system(size: 20))
          .fontWeight(.bold)
            .foregroundColor(.black)
          .padding(EdgeInsets(top: 0, leading: 8, bottom: 4, trailing: 8))
      }
      .cornerRadius(12)
    }
  }
}


struct SearchBar: View {
    
    @Binding var searchText: String
    @Binding var searching: Bool
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchText) { startedEditing in
                    if startedEditing {
                        withAnimation {
                            searching = true
                        }
                    }
                } onCommit: {
                    withAnimation {
                        searching = false
                    }
                }
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
    }
}


extension UIApplication {
     func dismissKeyboard() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: self, from: self, for: nil)
     }
 }
