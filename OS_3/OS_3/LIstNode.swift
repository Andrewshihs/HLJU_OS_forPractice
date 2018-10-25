//
//  DCT.swift
//  OS_3
//
//  Created by Andrew on 2018/10/24.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import Foundation
class ListNode {
    var name = ""
    var state: Int?
    var next: ListNode?
    var parent: ListNode?
    var queue = [Int]()
    init(_ name: String ){
        self.name = name
        self.state = 0
        self.next = nil
        self.parent = nil
    }
    init(){
        print("list init")
        self.name = "Empty"
        self.state = 0
        self.next = nil
        self.parent = nil
    }
    
}
