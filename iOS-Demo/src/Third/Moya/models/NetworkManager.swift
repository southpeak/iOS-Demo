//
//  NetworkManager.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/7.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import Moya
import Result

enum APIEnvironment {
    case staging
    case qa
    case production
}

protocol Networkable {
    var provider: MoyaProvider<MovieApi> { get }
    func getNewMovies(page: Int, completion: @escaping ([Movie]) -> ())
}

struct NetworkManager: Networkable {
    
    static let shared = NetworkManager()
    
    static let MovieAPIKey = "myKey"
    let provider = MoyaProvider<MovieApi>(plugins: [NetworkLoggerPlugin(verbose: true)])
    static let environment: APIEnvironment = .staging
    
    func getNewMovies(page: Int, completion: @escaping ([Movie]) -> ()) {
        provider.request(.newMovies(page: page)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(MovieResults.self, from: response.data)
                    completion(results.movies)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
        }
    }
}
