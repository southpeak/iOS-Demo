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
    
    override func start(_ dict: [String: AnyObject]? = nil) -> Observable<Void> {
        
        let tabbarController = UITabBarController()
        let navigationController = UINavigationController(rootViewController: tabbarController)
        
        let controller1 = ListViewController(nibName: "ListViewController", bundle: nil)
        controller1.viewModel = create("Basic", service: BasicService(), navigation: navigationController)
        controller1.tabBarItem.title = "Basic"
        
        let controller2 = ListViewController(nibName: "ListViewController", bundle: nil)
        controller2.viewModel = create("Rx", service: RxService(), navigation: navigationController)
        controller2.tabBarItem.title = "Rx"
        
        let controller3 = ListViewController(nibName: "ListViewController", bundle: nil)
        controller3.viewModel = create("Framework", service: FrameworkService(), navigation: navigationController)
        controller3.tabBarItem.title = "Framework"
        
        let controller4 = ListViewController(nibName: "ListViewController", bundle: nil)
        controller4.viewModel = create("Third", service: ThirdFrameworksService(), navigation: navigationController)
        controller4.tabBarItem.title = "Third"
        
        tabbarController.viewControllers = [
            controller1,
            controller2,
            controller3,
            controller4
        ]
        
        _window?.rootViewController = navigationController
        _window?.makeKeyAndVisible()
        
        return Observable.never()
    }
    
    private func create(_ title: String, service: ListService, navigation: UINavigationController) -> ListViewModel {
        var viewModel = ListViewModel(service: service)
        viewModel.title = title
        viewModel.didSelectedItem.subscribe(onNext: { [weak self] item in
            
            item.coordinator.navigationController = navigation
            _ = self?.coordinate(to: item.coordinator)
        }).disposed(by: disposeBag)
        
        return viewModel
    }
}
