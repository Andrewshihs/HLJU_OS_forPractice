//
//  BitMap.swift
//  OS_2
//
//  Created by Andrew on 2018/10/13.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import Foundation
class BitMap{
    var ABit = [Int](repeating: 0, count: 32)
    func BitMap(){
        for index  in 0...31 {
            ABit[index] = Int(arc4random()  % 2)
        }
    }
    func display(index: Int)->Int{
        return ABit[index]
    }
    
}
