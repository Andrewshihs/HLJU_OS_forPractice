//
//  List.swift
//  OS_3
//
//  Created by Andrew on 2018/10/24.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import Foundation
class List {
    var head: ListNode?
    var tail: ListNode?
    
    func appendToTail(_ name: String ){
        if tail == nil {
            tail = ListNode(name)
            tail = tail!.next
        }else{
            tail!.next = ListNode(name)
            tail = tail!.next
        }
    }
    func appendToHead(_ name: String ){
        if head == nil{
            head = ListNode(name)
            tail = head
        }else{
            let temp = ListNode(name)
            temp.next = head
            head = temp
            }
        }
        
}

