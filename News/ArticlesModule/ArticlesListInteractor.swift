//
//  ArticlesListInteractor.swift
//  News
//
//  Created by 1-18 Golf on 20/05/22.
//

import Foundation

class ArticlesListInteractor {
    var model : ArticlesModel
    var source : String
    var apiService : APIService
    
    @Published var articles : [Articles] = []

    init (source: String, model : ArticlesModel, apiService : APIService) {
        self.model = model
        self.source = source
        self.apiService = apiService
    }
}
