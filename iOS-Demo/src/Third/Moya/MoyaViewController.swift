//
//  MoyaViewController.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/7.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift

class MoyaViewController: UIViewController {
    
    var viewModel: MoyaViewModel!
    let disposeBag = DisposeBag()
    
    @IBOutlet weak var button1: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        _bind()
    }
    
    func _bind() {
        
        self.button1
            .rx
            .tap
            .bind(to: viewModel.buttonTap1)
            .disposed(by: disposeBag)
    }
}
