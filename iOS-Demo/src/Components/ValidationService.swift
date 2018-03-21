//
//  ValidationService.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/16.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift
import Result

//enum ValidateError: Swift.Error {
//    case empty
//    case failed(String)
//}

class Validator {
    static let instance = Validator()
    
    private init() {}
    
    func validate(_ value: String) -> Observable<Result<String, ValidateError>> {
        if value.count == 0 {
            return Observable.just(.failure(.empty))
        }
        
        return Observable.just(.success(value))
    }
}
