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
        print(" add tail sucess")
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
    func count() -> Int {
        var flag  = 0
        var count = 0
        var tmp = head
        while flag == 0 {
            if (tmp == nil ){
                flag = 1
                return 0
            }else{
                count += 1
                tmp = tmp!.next
            }
        }
        return count
    }
    func get(_ Postion: Int) -> ListNode? {
        var flag = 0
        var count = 0
        var tmp = head
        while flag == 0 {
            if (tmp == nil ){
                flag = 1
                return nil
            }else{
                count += 1
                tmp = tmp!.next
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

