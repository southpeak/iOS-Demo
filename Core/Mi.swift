//
//  Mi.swift
//  iOS-Demo
//
//  Created by minya on 2018/3/15.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation

public func miAbstractMethod(file: StaticString = #file, line: UInt = #line) -> Swift.Never {
    miFatalError("Abstract method", file: file, line: line)
}

public func miFatalError(_ message: @autoclosure () -> String, file: StaticString = #file, line: UInt = #line) -> Swift.Never {
    fatalError(message(), file: file, line: line)
}
