//
//  SayHelloViewModel.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/12.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class SayHelloViewModel: ViewModelType {
    let input: Input
    let output: Output
    
    struct Input {
        let name: AnyObserver<String>
        let validate: AnyObserver<Void>
    }
    
    struct Output {
        let greeting: Driver<String>
    }
    
    private let nameSubject = ReplaySubject<String>.create(bufferSize: 1)
    private let validateSubject = PublishSubject<Void>()
    
    init() {
        let greeting = validateSubject
            .withLatestFrom(nameSubject)
            .map { name in
                return "Hello \(name)"
            }
            .asDriver(onErrorJustReturn: ":(-")
        
        self.output = Output(greeting: greeting)
        
        self.input = Input(name: nameSubject.asObserver(), validate: validateSubject.asObserver())
    }
}
