//
//  RootCoordinator.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift

class RootCoordinator: Coordinator {
    
    private let _window: UIWindow?
    
    init(window: UIWindow? = nil) {
        self._window = window
    }
    
    override func start() -> Observable<Void> {
        
        let controller = ListViewController(nibName: "ListViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: controller)
        
        var viewModel = ListViewModel(service: RootService())
        viewModel.title = "Home"
        viewModel.didSelectedItem.subscribe(onNext: { [weak self] item in
            
            item.coordinator.navigationController = navigationController
            _ = self?.coordinate(to: item.coordinator)
        }).disposed(by: disposeBag)
        
        // bind navigatioin
//        viewModel.didSelectedItem.subscribe(onNext: { [weak self] item in
//            guard let CoordinatorClass = item.coordinator as? NavigationCoordinator<Void>.Type else {
//                return
//            }
//
//            let nextCoordinator = CoordinatorClass.init(navigationController: navigationController)
//
//            _ = self?.coordinate(to: nextCoordinator)
//        }).disposed(by: disposeBag)
        
        controller.viewModel = viewModel
        
        _window?.rootViewController = navigationController
        _window?.makeKeyAndVisible()
        
        return Observable.never()
    }
}
