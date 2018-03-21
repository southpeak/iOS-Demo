//
//  ListViewModel.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/20.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

struct ListViewModel {
    
    var service: ListService
    
    let items: Observable<[ListItem]>
    let selectedItem: AnyObserver<ListItem>
    let didSelectedItem: Observable<ListItem>
    
    var title: String = ""
    
    init(service: ListService) {
        self.service = service
        self.items = service.items

        let _selectedItem = PublishSubject<ListItem>()
        self.selectedItem = _selectedItem.asObserver()
        self.didSelectedItem = _selectedItem.asObservable()
    }
}
