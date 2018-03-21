//
//  ListItem.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation

struct ListItem {
    var title: String
    var coordinator: NavigationCoordinator
    
    init(title: String, coordinator: NavigationCoordinator) {
        self.title = title
        self.coordinator = coordinator
    }
}
