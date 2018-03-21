//
//  Validatable.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/16.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift
import Result

enum ValidateError: Swift.Error {
    case empty
    case outofBounds
    case failed(String)
}

protocol Validatable {
    
    func validate() -> Observable<Result<Self, ValidateError>>
}

extension String: Validatable {
    
    func validate() -> Observable<Result<String, ValidateError>> {
        
        if self.count == 0 {
            return Observable.just(.failure(.empty))
        }
        
        return Observable.just(.success(self))
    }
    
    func validateLength(minLength: UInt = 0, maxLength: UInt = 0) -> Observable<Result<String, ValidateError>> {
        
        if minLength > 0 && self.count < minLength {
            return Observable.just(.failure(.failed("too short")))
        }
        
        if maxLength > 0 && self.count > maxLength {
            return Observable.just(.failure(.failed("too long")))
        }
        
        return Observable.just(.success(self))
    }
}
