//
//  Coordinator.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

public class Coordinator: CoordinatorType {
    
    public let disposeBag = DisposeBag()
    
    private let _identifier = UUID()
    private var _children = [UUID : Any]()
    
    private func _store(coordinator: Coordinator) {
        _children[coordinator._identifier] = coordinator
    }
    
    private func _free(coordinator: Coordinator) {
        _children[coordinator._identifier] = nil
    }
    
    public func coordinate(to coordinator: Coordinator, dict: [String: AnyObject]? = nil) -> Observable<Void> {
        _store(coordinator: coordinator)
        
        return coordinator.start(dict).do(onNext: { [weak self] _ in
            self?._free(coordinator: coordinator)
        })
    }
    
    @discardableResult
    public func start(_ dict: [String: AnyObject]? = nil) -> Observable<Void> {
        miAbstractMethod()
    }
}
