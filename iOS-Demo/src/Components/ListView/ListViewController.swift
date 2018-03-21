//
//  ListViewController.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/20.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: ListViewModel!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        _setupUI()
        _bind()
    }
    
    private func _setupUI() {
        
        self.title = viewModel.title
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ListItemCell")
    }
    
    private func _bind() {
        
        viewModel.items
            .observeOn(MainScheduler.instance)
            .bind(to: tableView.rx.items(cellIdentifier: "ListItemCell", cellType: UITableViewCell.self)) { (_, item, cell) in
                cell.textLabel?.text = item.title
                cell.selectionStyle = .none
            }.disposed(by: disposeBag)

        tableView.rx.modelSelected(ListItem.self)
            .bind(to: viewModel.selectedItem)
            .disposed(by: disposeBag)
    }
}
