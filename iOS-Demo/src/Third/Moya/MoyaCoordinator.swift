//
//  MoyaCoordinator.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/7.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class MoyaCoordinator: NavigationCoordinator {
    
    override func start(_ dict: [String : AnyObject]?) -> Observable<Void> {
        
        let controller = MoyaViewController(nibName: "MoyaViewController", bundle: nil)
        let viewModel = MoyaViewModel()
        
        controller.viewModel = viewModel
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
}
