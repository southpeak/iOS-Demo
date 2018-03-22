//
//  ThirdFrameworksService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/22.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class ThirdFrameworksService: ListService {
    
    required init() {}

    var items: Observable<[ListItem]> {
        get {
            return Observable.just([
                ListItem(title: "Moya", coordinator: ListCoordinator<ThirdFrameworksService>())
            ])
        }
    }
}
