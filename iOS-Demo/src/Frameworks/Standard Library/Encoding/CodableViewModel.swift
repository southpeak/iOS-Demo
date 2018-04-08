//
//  CodableViewModel.swift
//  iOS-Demo
//
//  Created by minya on 2018/4/8.
//  Copyright © 2018年 xmu. All rights reserved.
//

import Foundation
import RxSwift

class CodableViewModel {
    
    let buttonTap1 = PublishSubject<Void>()
    let buttonTap2 = PublishSubject<Void>()
    let buttonTap3 = PublishSubject<Void>()
    let disposeBag = DisposeBag()
    
    init() {
        buttonTap1.asObserver()
            .subscribe(onNext: {
                let photoObject = Photo(title: "Hibiscus",
                                        url: URL(string: "https://www.flowers.com/hibiscus")!,
                                        isSample: false,
                                        metaData: ["color": "red"],
                                        type: .flower,
                                        size: Size(height: 200, width: 200))
                let encodedData = try? JSONEncoder().encode(photoObject)
                
                let jsonString = String(data: encodedData!, encoding: .utf8)
                print(jsonString!)
                
//                let json: Codable = Photo(title: "Hibiscus",
//                                          url: URL(string: "https://www.flowers.com/hibiscus")!,
//                                          isSample: false,
//                                          metaData: ["color": "red"],
//                                          type: .flower,
//                                          size: Size(height: 200, width: 200))
//
//                _ = try? JSONEncoder().encode(json)       // Swift 4.1: Cannot invoke 'encode' with an argument list of type (Codable)
            })
            .disposed(by: disposeBag)
        
        buttonTap2.asObserver()
            .subscribe(onNext: {
                
                let jsonString = """
                    {
                        "type":"fruit",
                        "size":{
                                   "width":150,
                                   "height":150
                               },
                        "title":"Apple",
                        "url":"https:\\/\\/www.fruits.com\\/apple",
                        "isSample":true,
                        "metaData":{
                                      "color":"green"
                                   }
                    }
                    """
                if let jsonData = jsonString.data(using: .utf8) {
                    let photoObject = try? JSONDecoder().decode(Photo.self, from: jsonData)
                    print(photoObject!.url)
                }
            })
            .disposed(by: disposeBag)
        
        buttonTap3.asObserver()
            .subscribe(onNext: {
                let jsonString = """
                    {
                        "latitude":"10.0",
                        "longitude":"123.0",
                        "additionalInfo" {
                            "elevation": "359.0"
                        }
                    }
                    """
                if let positionData = jsonString.data(using: .utf8) {
                    let po = try? JSONDecoder().decode(Position.self, from: positionData)
                    print("\(String(describing: po?.elevation))")
                }
                
                let po = Position(latitude: 0.0, longitude: 1.1, elevation: 2.2)
                let pd = try? JSONEncoder().encode(po)
                let ps = String(data: pd!, encoding: .utf8)
                print(ps!)
            })
            .disposed(by: disposeBag)
    }
}
