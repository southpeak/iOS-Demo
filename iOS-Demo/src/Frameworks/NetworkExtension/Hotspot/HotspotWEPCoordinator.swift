//
//  HotspotWEPCoordinator.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class HotspotWEPCoordinator: NavigationCoordinator {
    
    override func start(_ dict: [String: AnyObject]? = nil) -> Observable<Void> {
        
        let controller = HotspotWEPViewController(nibName: "HotspotWEPViewController", bundle: nil)
        let viewModel = HotspotWEPViewModel()
        
        controller.viewModel = viewModel
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
}
