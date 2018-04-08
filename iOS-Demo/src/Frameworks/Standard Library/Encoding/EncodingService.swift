//
//  EncodingService.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/8.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class EncodingService: ListService {
    required init() {}
    
    var items: Observable<[ListItem]> {
        return Observable.just([
            ListItem(title: "Encoding", coordinator: ListCoordinator<EncodingService>()),
            ListItem(title: "Decoding", coordinator: ListCoordinator<EncodingService>()),
            ListItem(title: "Serialization", coordinator: ListCoordinator<EncodingService>()),
            ListItem(title: "Codable", coordinator: CodabelCoordinator())
        ])
    }
}
