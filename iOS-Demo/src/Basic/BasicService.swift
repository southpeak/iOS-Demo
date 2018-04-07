//
//  BasicService.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/7.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class BasicService: ListService {
    
    required init() {}
    
    var items: Observable<[ListItem]> {
        get {
            return Observable.just([
                ListItem(title: "Swift", coordinator: ListCoordinator<BasicService>()),
                ListItem(title: "Objective-C", coordinator: ListCoordinator<BasicService>()),
                ListItem(title: "Algorithm", coordinator: ListCoordinator<BasicService>())
            ])
        }
    }
}
