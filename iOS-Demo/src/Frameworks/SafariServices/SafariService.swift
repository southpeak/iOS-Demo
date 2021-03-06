//
//  SafariService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

final class SafariService: ListService {
    
    required init() {}
    
    var items: Observable<[ListItem]> {
        get {
            return Observable.just([
                ListItem(title: "Safari ViewController", coordinator: SafariViewCoordinator())
            ])
        }
    }
}
