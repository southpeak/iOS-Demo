//
//  CoordinatorType.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

public protocol CoordinatorType {

//    associatedtype E
    
    func start() -> Observable<Void>
}
