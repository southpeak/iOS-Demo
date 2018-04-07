//
//  RxService.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/7.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class RxService: ListService {
    
    required init() {}
    
    var items: Observable<[ListItem]> {
        get {
            return Observable.just([
                ListItem(title: "RxSwift", coordinator: ListCoordinator<RxService>()),
                ListItem(title: "Swift", coordinator: ListCoordinator<RxService>())
            ])
        }
    }
}
