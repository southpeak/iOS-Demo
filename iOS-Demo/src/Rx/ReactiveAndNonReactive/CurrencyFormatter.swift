//
//  CurrencyFormatter.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/10.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation

class CurrencyFormatter {
    static let shared = CurrencyFormatter()
    
    private let formatter: NumberFormatter
    
    private init() {
        formatter = NumberFormatter()
        formatter.numberStyle = .currency
    }
    
    func format(_ number: Float) -> String {
        let num = NSNumber(value: number)
        return formatter.string(from: num)!
    }
}
