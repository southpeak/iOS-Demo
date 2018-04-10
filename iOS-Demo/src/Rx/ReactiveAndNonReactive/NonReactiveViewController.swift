//
//  NonReactiveViewController.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/10.
//  Copyright © 2018年 xmu. All rights reserved.
//

import UIKit
import RxSwift

class NonReactiveViewController: UIViewController {
    
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var priceSlider: UISlider!
    
    @IBOutlet var unitLabel: UILabel!
    @IBOutlet var unitSlider: UISlider!
    
    var lastPrice: Float = 0
    var lastUtil: Float = 0
    
    @IBOutlet var priceLabel2: UILabel!
    @IBOutlet var priceSlider2: UISlider!
    
    @IBOutlet var unitLabel2: UILabel!
    @IBOutlet var unitSlider2: UISlider!
    
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupEvent()
        setupObservables()
    }
    
    func setupEvent() {
        priceSlider.addTarget(self, action: #selector(priceSliderChanged), for: .valueChanged)
        unitSlider.addTarget(self, action: #selector(unitlSliderChanged), for: .valueChanged)
    }
    
    @objc
    func priceSliderChanged(_ sender: UISlider) {
        let formattedPrice = CurrencyFormatter.shared.format(sender.value)
        priceLabel.text = formattedPrice
        lastPrice = sender.value
        notifyIfBigSell()
    }
    
    @objc
    func unitlSliderChanged(_ sender: UISlider) {
        unitLabel.text = "\(Int(sender.value)) units"
        lastUtil = sender.value
        notifyIfBigSell()
    }
    
    func notifyIfBigSell() {
        if lastPrice > 50 && lastUtil > 50 {
            let result = lastPrice * lastUtil
            let formatterResult = CurrencyFormatter.shared.format(result)
            
            print("Big Sale! \(lastUtil) units for \(formatterResult)")
        }
    }
    
    func setupObservables() {
        let priceObservable = priceSlider.rx.value.asObservable().share()
        
        priceObservable
            .map { CurrencyFormatter.shared.format($0) }
            .bind(to: priceLabel2.rx.text)
            .disposed(by: disposeBag)
        
        let unitObservable = unitSlider.rx.value.asObservable().share()
        unitObservable
            .map { Int($0) }
            .map { "\($0) units" }
            .bind(to: unitLabel.rx.text)
            .disposed(by: disposeBag)
        
        let combineObservable = Observable.combineLatest(priceObservable, unitObservable) { ($0, $1) }
        
        combineObservable
            .asObservable()
            .filter { $0 > 50 && $1 > 50 }
            .map { ($0 * Float($1), $1) }
            .map { (CurrencyFormatter.shared.format($0), $1) }
            .subscribe(onNext: { message in
                print(message)
            }).disposed(by: disposeBag)
    }
}
