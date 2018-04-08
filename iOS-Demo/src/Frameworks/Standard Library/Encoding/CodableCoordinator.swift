//
//  CodableCoordinator.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/8.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class CodabelCoordinator: NavigationCoordinator {
    
    override func start(_ dict: [String : AnyObject]?) -> Observable<Void> {
        
        let controller = CodableViewController(nibName: "CodableViewController", bundle: nil)
        controller.viewModel = CodableViewModel()
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
}
