//
//  EquipmentManage.swift
//  OS_3
//
//  Created by Andrew on 2018/10/24.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import Foundation
class EquipmentManage  {
    var DctList = List()
    var CoctList = List()
    var ChctList = List()
    init() {
        print("Equ init")
        DctList = List()
        CoctList = List()
        ChctList = List()
    }
    func second_init(){
        DctList.appendToTail("KeyBoard")
        DctList.appendToTail("Mouse")
        DctList.appendToTail("Print")
        DctList.appendToTail("Screen")
        
        CoctList.appendToTail("ContrlOne ")
        CoctList.appendToTail("ContrlTwo ")
        CoctList.appendToTail("ContrlThree ")
        
        ChctList.appendToTail("ChannelOne")
        ChctList.appendToTail("ChannelTwo")
        

        DctList.display()
        CoctList.display()
        ChctList.display()
        print("second init")
    
        DctList.head!.parent = CoctList.head
        DctList.head!.next!.parent = CoctList.head
        DctList.head!.next!.next!.parent = CoctList.head!.next!
        DctList.head!.next!.next!.next!.parent = CoctList.head!.next!.next!
        
        CoctList.head!.parent = ChctList.head
        CoctList.head!.next!.parent = ChctList.head
        CoctList.head!.next!.next!.parent = ChctList.head!.next!
        
        ChctList.head!.parent = nil
        ChctList.head!.next!.parent = nil
        print("second init finish")
    }
    
    func AddEquipment (_ name: String, _ pos: Int ){
        DctList.appendToTail(name)
        DctList.tail!.parent = CoctList.get(pos)
    }
    func AddControl (_ name: String, _ pos: Int){
        CoctList.appendToTail(name)
        CoctList.tail!.parent = ChctList.get(pos)
    }
    func DeleteEquipment(_ name: String ) -> String{
        let  sta = DctList.delete(name)
        if(sta == 1){
            return "设备占用"
        }else if (sta == 2){
            return "设备不存在"
        }else{
            return ""
        }
    }
    func DeleteContrl(_ name: String ) -> String{
        if(DctList.findParent(name) != 0){
            print("检查 ")
           return "控制器占用"
        }
        let  sta = CoctList.delete(name)
        if(sta == 1){
            return "控制器占用"
        }else if (sta == 2){
            return "控制器不存在"
        }else{
            return ""
        }
    }
    //分配
    func  Allocation(_ name: String){
        
    }
    //回收
    func Collection(_ name: String){
        
    }
    
}
