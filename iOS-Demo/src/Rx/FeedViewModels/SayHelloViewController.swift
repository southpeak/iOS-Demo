//
//  SayHelloViewController.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/12.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

protocol SayHelloViewModelBindable {
    var disposeBag: DisposeBag? { get }
    func bind(to viewModel: SayHelloViewModel)
}

final class TextFieldCell: UITableViewCell, SayHelloViewModelBindable {
    @IBOutlet weak var nameTextField: UITextField!
    var disposeBag: DisposeBag?
    
    func bind(to viewModel: SayHelloViewModel) {
        let bag = DisposeBag()
        nameTextField.rx
            .text
            .orEmpty
            .bind(to: viewModel.input.name)
            .disposed(by: bag)
        disposeBag = bag
    }
}

final class ButtonCell: UITableViewCell, SayHelloViewModelBindable {
    @IBOutlet weak var validateButton: UIButton!
    var disposeBag: DisposeBag?
    
    func bind(to viewModel: SayHelloViewModel) {
        let bag = DisposeBag()
        validateButton.rx
            .tap
            .bind(to: viewModel.input.validate)
            .disposed(by: bag)
        disposeBag = bag
    }
}

final class GreetingCell: UITableViewCell, SayHelloViewModelBindable {
    @IBOutlet weak var greetingLabel: UILabel!
    var disposeBag: DisposeBag?
    
    func bind(to viewModel: SayHelloViewModel) {
        let bag = DisposeBag()
        viewModel.output.greeting
            .drive(greetingLabel.rx.text)
            .disposed(by: bag)
        disposeBag = bag
    }
}

class SayHelloViewController: UIViewController, UITableViewDataSource {
    
    static let cellIdentifiers = [
        "TextFieldCell",
        "ButtonCell",
        "GreetingCell"
    ]
    
    @IBOutlet weak var tableView: UITableView!
    
    public var viewModel: SayHelloViewModel!
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UINib(nibName: "TextFieldCell", bundle: nil), forCellReuseIdentifier: "TextFieldCell")
        tableView.register(UINib(nibName: "ButtonCell", bundle: nil), forCellReuseIdentifier: "ButtonCell")
        tableView.register(UINib(nibName: "GreetingCell", bundle: nil), forCellReuseIdentifier: "GreetingCell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SayHelloViewController.cellIdentifiers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SayHelloViewController.cellIdentifiers[indexPath.row])
        (cell as? SayHelloViewModelBindable)?.bind(to: viewModel)
        return cell!
    }
}
