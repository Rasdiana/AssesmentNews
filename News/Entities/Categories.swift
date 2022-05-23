//
//  Categories.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Foundation
import Combine

final class Categories {
    @Published var name : String = ""
    
    required init(from decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
    }
}

extension Categories : Codable {
    enum CodingKeys : CodingKey {
        case name
    }
    
    func encode(to encoder : Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
    }
}

extension Categories : Identifiable {}
extension Categories : ObservableObject {}
