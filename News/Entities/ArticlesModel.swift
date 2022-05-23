//
//  ArticlesModel.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import Foundation
import Combine

final class ArticlesModel {
  private let apiService = APIService()
   var source = ""
  @Published var articles: [Articles] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        DispatchQueue.main.async {
            self.load()
        }
    }

  func load() {
    if InternetConnectionManager.isConnectedToNetwork() {
        apiService.requestArticles(params: source) { (response) in
            switch response {
            case .success(let result):
                if result.status == "ok" {
                    self.articles = result.articles
                }
            case .failure(let error):
                switch error {
                case .noInternetConnection:
                    print("No Internet connection")
                default:
                    print(error.localizedDescription)
                }
            }
        }
    }else {
        print("No Internet connection")
    }
  }
}
