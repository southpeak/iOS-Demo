//
//  HotspotWEPViewController.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HotspotWEPViewController: UIViewController {
    
    var viewModel: HotspotWEPViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var ssidField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        _bind()
    }
    
    private func _bind() {
        self.ssidField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.ssid)
            .disposed(by: disposeBag)
        
        self.pwdField
            .rx
            .text
            .orEmpty
            .bind(to: viewModel.pwd)
            .disposed(by: disposeBag)
        
        self.button
            .rx
            .tap
            .bind(to: viewModel.buttonTap)
            .disposed(by: disposeBag)
        
        self.button2
            .rx
            .tap
            .bind(to: viewModel.buttonTap2)
            .disposed(by: disposeBag)
    }
}
