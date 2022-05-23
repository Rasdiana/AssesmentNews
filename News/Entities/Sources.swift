//
//  Sources.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Foundation
import Combine

final class Sources {
    @Published var id : String
    @Published var name : String
    @Published var description : String
    @Published var url :  String
    
    required init(from decoder : Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decode(String.self, forKey: .description)
        url = try container.decode(String.self, forKey: .url)
    }
    
}

extension Sources : Codable {
    enum CodingKeys : CodingKey {
        case id
        case name
        case description
        case url
    }
    
    func encode(to encoder : Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(description, forKey: .description)
        try container.encode(url, forKey: .url)
    }
}

extension Sources : Identifiable {}
extension Sources : ObservableObject {}

struct SourcesResponse: Codable {
    let status : String
  let sources: [Sources]
}
