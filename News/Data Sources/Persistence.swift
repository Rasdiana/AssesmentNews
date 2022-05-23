//
//  Persistence.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Foundation
import Combine

fileprivate struct Envelope: Codable {
  let categories: [Categories]
}

/// This class can be refactored to save/load over a network instead of a local file
class Persistence {
  var localFile: URL {
    let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("categories.json")
    print("In case you need to delete the database: \(fileURL)")
    return fileURL
  }

  var defaultFile: URL {
    return Bundle.main.url(forResource: "default", withExtension: "json")!
  }
  
  private func clear() {
    try? FileManager.default.removeItem(at: localFile)
  }

  func load() -> AnyPublisher<[Categories], Never>  {
    if FileManager.default.fileExists(atPath: localFile.standardizedFileURL.path) {
      return Future<[Categories], Never> { promise in
        self.load(self.localFile) { categories in
          DispatchQueue.main.async {
            promise(.success(categories))
          }
        }
      }.eraseToAnyPublisher()
    } else {
      return loadDefault()
    }
  }

  func save(categories: [Categories]) {
    let envelope = Envelope(categories: categories)
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    let data = try! encoder.encode(envelope)
    try! data.write(to: localFile)
  }

  private func loadSynchronously(_ file: URL) -> [Categories] {
    do {
      let data = try Data(contentsOf: file)
      let envelope = try JSONDecoder().decode(Envelope.self, from: data)
        return envelope.categories
    } catch {
      clear()
      return loadSynchronously(defaultFile)
    }
  }

  private func load(_ file: URL, completion: @escaping ([Categories]) -> Void) {
    DispatchQueue.global(qos: .background).async {
      let categories = self.loadSynchronously(file)
      completion(categories)
    }
  }

  func loadDefault(synchronous: Bool = false) -> AnyPublisher<[Categories], Never> {
    if synchronous {
      return Just<[Categories]>(loadSynchronously(defaultFile)).eraseToAnyPublisher()
    }
    return Future<[Categories], Never> { promise in
      self.load(self.defaultFile) { trips in
        DispatchQueue.main.async {
          promise(.success(trips))
        }
      }
    }.eraseToAnyPublisher()
  }
}
