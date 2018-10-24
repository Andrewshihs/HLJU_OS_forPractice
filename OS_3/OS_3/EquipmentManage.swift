//
//  EquipmentManage.swift
//  OS_3
//
//  Created by Andrew on 2018/10/24.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import Foundation
class EquipmentManage  {
    var DctList: List?
    var CoctList: List?
    var ChctList: List?
    init() {
        DctList = List()
        CoctList = List()
        ChctList = List()
    }
    func second_init(){
        DctList!.appendToTail("KeyBoard")
        DctList!.appendToTail("Mouse")
        DctList!.appendToTail("Print")
        DctList!.appendToTail("Screen")
        
        CoctList!.appendToTail("Contrl One ")
        CoctList!.appendToTail("Contrl Two ")
        CoctList!.appendToTail("Contrl Three ")
        
        ChctList!.appendToTail("Channel One")
        ChctList!.appendToTail("Channel Two")
        
        DctList!.head!.parent = CoctList!.head
        DctList!.head!.next = CoctList!.head
        DctList!.head!.next!.next! = CoctList!.head!.next!
        DctList!.head!.next!.next!.next = CoctList!.head!.next!.next!
        
        CoctList!.head?.parent = ChctList!.head
        CoctList!.head!.next!.parent = ChctList!.head
        CoctList!.head!.next!.next!.parent = ChctList!.head!.next!
        
        ChctList!.head!.parent = nil
        ChctList!.head!.next!.parent = nil
    }
    
    func AddEquipment (_ name: String){
        
    }
    func AddControl (_ name: String){
        
    }
    func DeleteEquipment(_ name: String ){
        
    }
    func DeleteContrl(_ name: String ){
        
    }
    //分配
    func  Allocation(_ name: String){
        
    }
    //回收
    func Collection(_ name: String){
        
    }
    
}
