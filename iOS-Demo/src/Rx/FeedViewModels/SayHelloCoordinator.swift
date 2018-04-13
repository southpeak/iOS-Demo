//
//  SayHelloCoordinator.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/12.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class SayHelloCoordinator: NavigationCoordinator {
    
    override func start(_ dict: [String : AnyObject]?) -> Observable<Void> {
        
        let controller = SayHelloViewController(nibName: "SayHelloViewController", bundle: nil)
        let viewModel = SayHelloViewModel()
        controller.viewModel = viewModel
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
}
