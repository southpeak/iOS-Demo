//
//  MovieApi.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/7.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import Moya

enum MovieApi {
    case recommended(id: Int)
    case popular(page: Int)
    case newMovies(page: Int)
    case video(id: Int)
}

extension MovieApi : TargetType {
    var path: String {
        switch self {
        case .recommended:
            return "recommended"
        case .popular:
            return "popular"
        case .newMovies:
            return "newMovies"
        case .video:
            return "video"
        }
    }
    
    var sampleData: Data {
        switch self {
        case .recommended:
            return stubbedResponse("Recommended")
        case .popular:
            return stubbedResponse("Popular")
        case .video:
            return stubbedResponse("Video")
        case .newMovies:
            return stubbedResponse("NewMovies")
        }
    }
    
    var environmentBaseUrl: String {
        switch NetworkManager.environment {
        case .production:
            return "https://api.themoviedb.org/3/movie/"
        case .qa:
            return "https://qa.themoviedb.org/3/movie/"
        case .staging:
            return "https://staging.themoviedb.org/3/movie/"
        }
    }
    
    var baseURL: URL {
        guard let url = URL(string: environmentBaseUrl) else {
            fatalError("baseURL could not be configured.")
        }
        
        return url
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        switch self {
        case .recommended, .video:
            return .requestParameters(parameters: ["api_key": NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
        case .popular(let page), .newMovies(let page):
            return .requestParameters(parameters: ["page": page, "api_key": NetworkManager.MovieAPIKey], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
}

func stubbedResponse(_ filename: String) -> Data! {
    @objc class TestClass: NSObject {}
    
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: filename, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
