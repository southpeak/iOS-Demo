//
//  Photo.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/8.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation

enum PhotoType: String, Codable {
    case flower
    case animal
    case fruit
    case vegetable
}

struct Size: Codable {
    var height: Double
    var width: Double
}

struct Photo: Codable {
    var title: String
    var url: URL
    var isSample: Bool
    
    var metaData: [String: String]
    
    var type: PhotoType
    var size: Size
}

struct Photo2 {
    var title: String
    var url: URL
    var isSample: Bool
    
    var metaData: [String: String]
    
    var type: PhotoType
    var size: Size
    var format: String = "png"
}

extension Photo2: Decodable {
    private enum PhotoKeys: String, CodingKey {
        case title = "name"
        case url = "link"
        case isSample
        case metaData
        case type
        case size
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PhotoKeys.self)
        
        title = try container.decode(String.self, forKey: .title)
        url = try container.decode(URL.self, forKey: .url)
        isSample = try container.decode(Bool.self, forKey: .isSample)
        metaData = try container.decode([String: String].self, forKey: .metaData)
        type = try container.decode(PhotoType.self, forKey: .type)
        size = try container.decode(Size.self, forKey: .size)
    }
}
