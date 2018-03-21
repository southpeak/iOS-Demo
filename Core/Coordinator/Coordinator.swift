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
    
//    public typealias E = ResultType
    
    public let disposeBag = DisposeBag()
    
    private let _identifier = UUID()
    private var _children = [UUID : Any]()
    
    private func _store(coordinator: Coordinator) {
        _children[coordinator._identifier] = coordinator
    }
    
    private func _free(coordinator: Coordinator) {
        _children[coordinator._identifier] = nil
    }
    
    public func coordinate(to coordinator: Coordinator) -> Observable<Void> {
        _store(coordinator: coordinator)
        
        return coordinator.start().do(onNext: { [weak self] _ in
            self?._free(coordinator: coordinator)
        })
        
//        do {
//            return try coordinator.start().do(onNext: { [weak self] _ in
//                self?._free(coordinator: coordinator)
//            })
//        } catch let error as NSError {
//            print("Error \(error.domain)")
//            return nil
//        }
    }
    
//    public func start() throws -> Observable<Void> {
//        miAbstractMethod()
//    }
    public func start() -> Observable<Void> {
        miAbstractMethod()
    }
}
