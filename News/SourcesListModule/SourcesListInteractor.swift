//
//  SourcesListInteractor.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Foundation

class SourcesListInteractor {
    var model : SourcesModel
    var name : String
    var apiService : APIService
    
    @Published var sources : [Sources] = []

    init (name : String, model : SourcesModel, apiService : APIService) {
        self.model = model
        self.name = name
        self.apiService = apiService
    }
}
