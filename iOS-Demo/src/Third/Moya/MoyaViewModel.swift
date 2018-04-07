//
//  MoyaViewModel.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/7.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class MoyaViewModel {
    
    let disposeBag = DisposeBag()
    
    let buttonTap1 = PublishSubject<Void>()
    
    init() {
        
        buttonTap1.asObserver()
            .subscribe(onNext: { (arg) in
                NetworkManager.shared.getNewMovies(page: 1, completion: { (movies) in
                    print(movies)
                })
            })
            .disposed(by: disposeBag)
    }
}
