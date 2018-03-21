//
//  SafariViewController.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/3/21.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import SafariServices

class SafariViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    // TODO: SFSafariViewController delegate
    
    let disposeBag = DisposeBag()
    
    private let url = URL(string: "https://www.baidu.com")

    override func viewDidLoad() {
        super.viewDidLoad()

        _bind()
    }
    
    private func _bind() {
        self.button.rx
            .tap
            .bind { [weak self] _ in
                print("click the button")
                let safariController = SFSafariViewController(url:(self?.url)!)
                safariController.modalPresentationStyle = .overFullScreen
                self?.present(safariController, animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        self.button2.rx
            .tap
            .bind { [weak self] _ in
                let configuration = SFSafariViewController.Configuration()
                configuration.entersReaderIfAvailable = false
                configuration.barCollapsingEnabled = false
                let safariController = SFSafariViewController(url: (self?.url)!, configuration: configuration)
                safariController.modalPresentationStyle = .overFullScreen
                self?.present(safariController, animated: true, completion: nil)
            }.disposed(by: disposeBag)
        
        self.button3.rx
            .tap
            .bind { [weak self] _ in
                let safariController = SFSafariViewController(url: (self?.url)!)
                safariController.modalPresentationStyle = .overFullScreen
                self?.present(safariController, animated: true, completion: {
                    // 这种方法的问题在于浏览器显示后，还能看见navigation bar，过一会才会隐藏
                    var frame = safariController.view.frame
                    let offsety: CGFloat = 44
                    
                    frame.origin = CGPoint(x: frame.origin.x, y: frame.origin.y)
                    frame.size = CGSize(width: frame.width, height: frame.height + offsety)
                    safariController.view.frame = frame
                })
            }.disposed(by: disposeBag)
    }
    
//    override var prefersStatusBarHidden: Bool {
//        get {
//            return true
//        }
//    }
}

extension SFSafariViewController {
    open override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
}
