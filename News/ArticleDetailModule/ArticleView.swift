//
//  ArticleView.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import SwiftUI
struct ArticleView: View {
  @ObservedObject var presenter: ArticlePresenter
    @State private var showWebView = false
    
    var body: some View {
      VStack {
        if presenter.urlToImage == nil {
            
        }else {
            
            AsyncImage(url: URL(string: presenter.urlToImage!)!,
                          placeholder: { Text("Loading ...") },
                          image: { Image(uiImage: $0).resizable() })
                .frame(idealHeight: UIScreen.main.bounds.height / 5)
        }
        
        Text(presenter.title ?? "No Title")
            .font(.system(size: 20, weight: .heavy, design: .default))
        Text(presenter.content ?? "No Content")
            .font(.caption)
            .padding(2)
            
        Button {
            showWebView.toggle()
        } label: {
            Text("More Detail")
        }
        .sheet(isPresented: $showWebView) {
            WebDetailView(url: (URL(string: presenter.url ?? "https://www.google.com/")!))
        }
        
        Spacer()
      }
      .multilineTextAlignment(.leading)
      .navigationBarTitle("News", displayMode: .inline)
    }
}
