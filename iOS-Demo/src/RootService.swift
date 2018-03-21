//
//  RootService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift

class RootService: ListService {
    
    required init() {}
    
    var items: Observable<[ListItem]> {
        get {
            
            return Observable.just([
                ListItem(title: "System Frameworks", coordinator: ListCoordinator<FrameworkService>())
            ])
        }
    }
}
