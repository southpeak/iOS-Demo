//
//  ListCoordinator.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/20.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class ListCoordinator<S: ListService>: NavigationCoordinator {

    override func start(_ dict: [String: AnyObject]? = nil) -> Observable<Void> {
        
        let controller = ListViewController(nibName: "ListViewController", bundle: nil)
        
        let viewModel = ListViewModel(service: S())
        
        viewModel.didSelectedItem.subscribe(onNext: { [weak self] item in
            
            item.coordinator.navigationController = self?.navigationController
            _ = self?.coordinate(to: item.coordinator)
            
        }).disposed(by: disposeBag)
        
        controller.viewModel = viewModel
        
        self.navigationController?.pushViewController(controller, animated: true)
        
        return Observable.never()
    }
}
