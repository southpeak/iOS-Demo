//
//  WifiService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class HotspotConfigurationService: ListService {
    
    required init() {}
    
    var items: Observable<[ListItem]> {
        get {
            return Observable.just([
                ListItem(title: "Open", coordinator: ListCoordinator<HotspotConfigurationService>()),
                ListItem(title: "WEP & WPA/WPA2 Personal", coordinator: HotspotWEPCoordinator())
            ])
        }
    }
}
