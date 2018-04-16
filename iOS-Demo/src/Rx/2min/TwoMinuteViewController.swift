//
//  TwoMinuteViewController.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift

class TwoMinuteViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var normalInput: UITextField!
    @IBOutlet weak var normalOutput: UILabel!
    
    @IBOutlet weak var rxInput: UITextField!
    @IBOutlet weak var rxOutput: UILabel!
    
    let disposeBag = DisposeBag()
    
    private var normalString: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        rxInput.rx
            .text
            .map { $0?.split(separator: " ") }
            .filter {
                ["a", "e", "i", "o", "u"].contains(String($0!))
            }
            
//            .filter {
//                print("\($0!)")
//                return ["a", "e", "i", "o", "u"].contains($0)
//            }
//            .reduce ("") { "\($0 ?? "")\($1)" }
//            .bind(to: rxOutput.rx.text)
//            .disposed(by: disposeBag)
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ["a", "e", "i", "o", "u"].contains(string.lowercased()) {
            normalString.append(string)
        }
        normalOutput.text = normalString
        return true
    }
}
