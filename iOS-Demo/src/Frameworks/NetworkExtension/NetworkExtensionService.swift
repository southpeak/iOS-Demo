//
//  NetworkExtensionService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class NetworkExtensionService: ListService {
    
    required init() {}
    
    var items: Observable<[ListItem]> {
        get {
            return Observable.just([
                ListItem(title: "Hotspot Configuration (iOS 11+)", coordinator: ListCoordinator<HotspotConfigurationService>())
            ])
        }
    }
}
