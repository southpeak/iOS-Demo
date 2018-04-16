//
//  ViewModelType.swift
//  iOS-Demo
//
//  Created by hanhui on 2018/4/12.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation

public protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
}
