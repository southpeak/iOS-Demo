//
//  HotspotViewModel.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift
import NetworkExtension

class HotspotWEPViewModel {
    
    let ssid = Variable<String>("")
    let pwd = Variable<String>("")
    
    let disposeBag = DisposeBag()
    
    let buttonTap = PublishSubject<Void>()
    let buttonTap2 = PublishSubject<Void>()
    
    init() {
        let ssidAndPwd = Observable.combineLatest(ssid.asObservable(), pwd.asObservable()) {
            ($0, $1)
        }
        
        buttonTap.asObservable()
            .withLatestFrom(ssidAndPwd)
            .subscribe(onNext: { (arg) in
                print(arg)
                
                let configuration = NEHotspotConfiguration(ssid: arg.0, passphrase: arg.1, isWEP: false)
                NEHotspotConfigurationManager.shared.apply(configuration, completionHandler: { e in
                    print("\(String(describing: e))")
                })
            }).disposed(by: disposeBag)
        
        buttonTap2.asObservable()
            .withLatestFrom(ssidAndPwd)
            .subscribe(onNext: { (item) in
                
                let configuration = NEHotspotConfiguration(ssid: item.0, passphrase: item.1, isWEP: false)
                configuration.joinOnce = true
                NEHotspotConfigurationManager.shared.apply(configuration, completionHandler: { (e) in
                    print("\(String(describing: e))")
                })
            }).disposed(by: disposeBag)
    }
}
