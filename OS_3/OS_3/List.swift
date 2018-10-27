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
      //  print(" add tail sucess")
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
       // print(" add head sucess")
    }
    func getSize() -> Int {
        return size
    }
    func get(_ Postion: Int) -> ListNode? {
        var flag = 0
        var tmp = head
        var count = 0
        while (flag == 0 && count != Postion){
            if (tmp == nil ){
                print("nil")
                flag = 1
            }else{
                tmp = tmp!.next
                count += 1
            }
        }
        return tmp
    }
    func find(_ name: String ) -> ListNode?{
        var flag = 0
        var tmp = head
        var back = ListNode()
        if(head!.name == name){
            back = tmp!
        }
        while flag == 0{
            if (tmp == nil ){
                flag = 1
            }else{
                if( tmp!.name == name ){
                    back = tmp!
                }
                tmp = tmp!.next
            }
        }
        return back
    }
    func setType(_ eType: String ){
        tail!.euqType = eType
    }
    func delete(_ name:String ) -> Int{
        var tmp = head
        var rflag = 2
        if(head!.name == name){
            if(head!.state == 0){
                head = head!.next
                size -= 1
                rflag = 0
            }else{
                print("sss")
                rflag =  1
            }
        }else{
            var flag = 0
            while (flag == 0){
                print(" ------")
                if (tmp?.next == nil ){
                    print("it is tail")
                    flag = 1
                }else{
                    print(tmp!.next!.name)
                    if(tmp!.next!.name == name ){
                        if(tmp!.state == 0){
                            tmp!.next = tmp!.next?.next
                            size -= 1
                            rflag = 0
                        }else{
                            print("ssr")
                            rflag =  1
                        }
                    }
                    tmp = tmp!.next
                }
            }
        }
        return rflag
    }
    func findParent(_ name:String ) -> Int {
        var flag = 0
        var tmp = head
        while flag == 0{
            if (tmp == nil ){
                flag = 1
            }else{
                if(tmp!.parent!.name == name ){
                    return 1
                }
                tmp = tmp!.next
            }
        }
        return 0 
    }

    func display()  {
        var flag = 0
        var tmp = head
        while flag == 0{
            if (tmp == nil ){
                    flag = 1
            }else{
                    tmp = tmp!.next
            }
        }
    }
}


