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
    var size = 0
    
    func appendToTail(_ name: String ){
        let temp = ListNode(name)
        if(size == 0){
            head = temp
            tail = temp
            size += 1
        }else{
            tail!.next = temp
            tail = temp
            size += 1
        }
        print(" add tail sucess")
    }
    func appendToHead(_ name: String ){
        let temp = ListNode(name)
        if(size == 0){
            head = temp
            tail = temp
            size += 1
        }else{
            temp.next = head
            head = temp
            size += 1
        }
        print(" add head sucess")
    }
    func getSize() -> Int {
        return size
    }
    func get(_ Postion: Int) -> ListNode? {
        var flag = 0
        var count = 0
        var tmp = head
        while flag == 0 {
            if (tmp != nil ){
                tmp = tmp!.next
                count += 1
            }
            if(count == Postion){
                flag = 1
            }
        }
        return tmp
    }
    func display()  {
        print("display")
        var flag = 0
        var tmp = head
        while flag == 0{
            if (tmp == nil ){
                    print("nil")
                    flag = 1
                }else{
                    print("hhh  \(tmp!.name)")
                tmp = tmp!.next
            }
        }
    }
}


