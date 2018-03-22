//
//  AppCoordinator.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift

class AppCoordinator: Coordinator {
    
    private let _window: UIWindow?
    
    init(window: UIWindow? = nil) {
        self._window = window
    }
    
//    override func start() throws -> Observable<Void>? {
//        let coordinator = RootCoordinator(window: _window)
//        return coordinate(to: coordinator)
//    }
    
    override func start(_ dict: [String: AnyObject]? = nil) -> Observable<Void> {
        let coordinator = RootCoordinator(window: _window)
        return coordinate(to: coordinator)
    }
}
