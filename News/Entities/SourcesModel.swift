//
//  SourcesModel.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Foundation
import Combine

final class SourcesModel {
  private let apiService = APIService()
   var category = ""
  @Published var sources: [Sources] = []
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        DispatchQueue.main.async {
            self.load()
        }
    }

  func load() {
    if InternetConnectionManager.isConnectedToNetwork() {
        apiService.requestSources(params: category) { (response) in
            switch response {
            case .success(let result):
                if result.status == "ok" {
                    self.sources = result.sources
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

extension SourcesModel: ObservableObject {}

/// Extension for SwiftUI previews
#if DEBUG
extension SourcesModel {
  static var sample: SourcesModel {
    let model = SourcesModel()
    model.load()
    return model
  }
}
#endif

