//
//  CodableViewController.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/8.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift

class CodableViewController: UIViewController {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    let disposeBag = DisposeBag()
    
    var viewModel: CodableViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self._bind()
    }
    
    func _bind() {
        self.button1
            .rx
            .tap
            .bind(to: viewModel.buttonTap1)
            .disposed(by: disposeBag)
        
        self.button2
            .rx
            .tap
            .bind(to: viewModel.buttonTap2)
            .disposed(by: disposeBag)
        
        self.button3
            .rx
            .tap
            .bind(to: viewModel.buttonTap3)
            .disposed(by: disposeBag)
    }
}
