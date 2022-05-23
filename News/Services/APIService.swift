//
//  APIService.swift
//  News
//
//  Created by 1-18 Golf on 19/05/22.
//

import Foundation
import Combine

class APIService {
    private var apiKey = "71ce28cd69584f8fbb38e87657946df2"
     
    func requestSources<P: Codable>(params:P? = nil, completion: @escaping (Result<SourcesResponse, NetworkError>) -> Void) {
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 300.0
        config.timeoutIntervalForResource = 300.0
        let session = URLSession(configuration: config)
        let param = params as! String
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines/sources?category=\(param)&apiKey=\(apiKey)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.domainError))
                }
                return
            }
            do {
                
                let posts = try JSONDecoder().decode(SourcesResponse.self, from: data)
                completion(.success(posts))
            } catch {
                //                print(response)
                print(error.localizedDescription)
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 404:
                        completion(.failure(.notFound))
                    case 500:
                        completion(.failure(.internalError))
                    default:
                        completion(.failure(.decodingError))
                    };/*print(httpResponse.description)*/
                }
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
    func searchArticles<P: Codable>(params: P? = nil, completion: @escaping (Result<ArticleResponse, NetworkError>)-> Void) {
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 300.0
        config.timeoutIntervalForResource = 300.0
        let session = URLSession(configuration: config)
        let param = params as! String
//        print(param)
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?q=\(param)&apiKey=\(apiKey)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.domainError))
                }
                return
            }
            do {
                
                let posts = try JSONDecoder().decode(ArticleResponse.self, from: data)
                completion(.success(posts))
            } catch {
                //                print(response)
                print(error.localizedDescription)
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 404:
                        completion(.failure(.notFound))
                    case 500:
                        completion(.failure(.internalError))
                    default:
                        completion(.failure(.decodingError))
                    };/*print(httpResponse.description)*/
                }
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
    
    func requestArticles<P: Codable>(params:P? = nil, completion: @escaping (Result<ArticleResponse, NetworkError>) -> Void) {
        
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 300.0
        config.timeoutIntervalForResource = 300.0
        let session = URLSession(configuration: config)
        let param = params as! String
        //print(param)
        var request = URLRequest(url: URL(string: "https://newsapi.org/v2/top-headlines?sources=\(param)&apiKey=\(apiKey)")!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let data = data, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completion(.failure(.domainError))
                }
                return
            }
            do {
                
                let posts = try JSONDecoder().decode(ArticleResponse.self, from: data)
                completion(.success(posts))
            } catch {
                //                print(response)
                print(error.localizedDescription)
                if let httpResponse = response as? HTTPURLResponse {
                    switch httpResponse.statusCode {
                    case 404:
                        completion(.failure(.notFound))
                    case 500:
                        completion(.failure(.internalError))
                    default:
                        completion(.failure(.decodingError))
                    };/*print(httpResponse.description)*/
                }
                completion(.failure(.decodingError))
            }
        }
        task.resume()
    }
}
