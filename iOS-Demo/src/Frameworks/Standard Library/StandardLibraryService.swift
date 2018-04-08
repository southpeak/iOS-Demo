//
//  StandardLibraryService.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/8.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class StandardLibraryService: ListService {
    
    required init() {}
    
    var items: Observable<[ListItem]> {
        return Observable.just([
            ListItem(title: "Encoding, Decoding, Serialization", coordinator: ListCoordinator<EncodingService>())
        ])
    }
}
