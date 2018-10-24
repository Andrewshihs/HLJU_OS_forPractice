//
//  hexTodec.swift
//  OS_2
//
//  Created by Andrew on 2018/10/14.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import Foundation
class hexTodec{
    static func hexTodec(number num:String) -> Int {
        let str = num.uppercased()
        var sum = 0
        for i in str.utf8 {
            sum = sum * 16 + Int(i) - 48 // 0-9 从48开始
            if i >= 65 {                 // A-Z 从65开始，但有初始值10，所以应该是减去55
                sum -= 7
            }
        }
        return sum
    }
}

