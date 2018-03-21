//
//  SafariViewCoordinator.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class SafariViewCoordinator: NavigationCoordinator {

    override func start() -> Observable<Void> {
        
        let controller = SafariViewController(nibName: "SafariViewController", bundle: nil)
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
}
