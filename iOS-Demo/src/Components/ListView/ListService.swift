//
//  ListService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/16.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

protocol ListService {
    
    init()

    var items: Observable<[ListItem]> { get }
}
