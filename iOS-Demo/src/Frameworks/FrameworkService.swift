//
//  FrameworkService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/20.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class FrameworkService: ListService {
    
    required init() {}

    var items: Observable<[ListItem]> {
        get {
            return Observable.just([
                ListItem(title: "Safari", coordinator: ListCoordinator<SafariService>()),
                ListItem(title: "Network Extension", coordinator: ListCoordinator<NetworkExtensionService>())
            ])
        }
    }
}
