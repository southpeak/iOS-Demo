//
//  TwoMinuteCoordinator.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class TwoMinuteCoordinator: NavigationCoordinator {
    
    override func start(_ dict: [String : AnyObject]?) -> Observable<Void> {
        
        let controller = TwoMinuteViewController()
        self.navigationController?.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
}
