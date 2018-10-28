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
    var Pro = [Process]()
    init() {
        DctList = List()
        CoctList = List()
        ChctList = List()
    }
    func second_init(){
        DctList.appendToTail("KeyBoard")
        DctList.setType("In")
        DctList.appendToTail("Mouse")
        DctList.setType("In")
        DctList.appendToTail("Print")
        DctList.setType("Out")
        DctList.appendToTail("Screen")
        DctList.setType("Out")
        
        CoctList.appendToTail("ContrlOne")
        CoctList.appendToTail("ContrlTwo")
        CoctList.appendToTail("ContrlThree")
        
        ChctList.appendToTail("ChannelOne")
        ChctList.appendToTail("ChannelTwo")
    
        DctList.head!.parent = CoctList.head
        DctList.head!.next!.parent = CoctList.head
        DctList.head!.next!.next!.parent = CoctList.head!.next!
        DctList.head!.next!.next!.next!.parent = CoctList.head!.next!.next!
        
        CoctList.head!.parent = ChctList.head
        CoctList.head!.next!.parent = ChctList.head
        CoctList.head!.next!.next!.parent = ChctList.head!.next!
        
        ChctList.head!.parent = nil
        ChctList.head!.next!.parent = nil
    }
    
    func AddEquipment (_ name: String, _ pos: Int ){
        DctList.appendToTail(name)
        DctList.setType("In")
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
    func  Allocation(_ Pname: String,_ Dname:String) -> String{
        var back = DctList.find(Dname)
        var tmpPro = Process(Pname,Dname)
        print(back!.name)
        if(back!.name == "Empty"){
            return "设备不存在"
        }
        print("\(back!.state!)")
        if(back!.state! != 0 ){
            back!.queue.append(Pname)
            Pro.append(tmpPro)
            return "设备被占用，加入队列等待"
        }else{
            back!.state = 1
            var cback = back!.parent
            if(cback!.state! != 0){
                cback!.queue.append(Pname)
                Pro.append(tmpPro)
                return "控制器被占用,等待"
            }else{
                cback!.state = 1
                var ccback = cback!.parent
                if(ccback!.state! != 0){
                    Pro.append(tmpPro)
                    ccback!.queue.append(Pname)
                    print("-----------")
                    print(ccback!.queue.count)
                    return "通道被占用,等待"
                }else{
                    ccback!.state = 1
                }
            }
        }
        Pro.append(tmpPro)
        return ""
    }
    //回收
    func Collection(_ name: String)->String{
        var tmp = Process()
        var flag = 0
        for i in 0..<Pro.count{
            if(Pro[i].Pname! == name){
                tmp = Pro[i]
                flag = 1
            }
        }
        if(flag == 0){
            return "进程不存在"
        }
        let device = tmp.Ename!
        var tmpdec = DctList.find(device)
        if(tmpdec!.state != 0){
            if(tmpdec!.queue.count > 0){
                tmpdec!.queue.remove(at: 0)
            }else{
                tmpdec!.state = 0
                var tmpcon = tmpdec!.parent
                if(tmpcon!.state != 0){
                    if(tmpcon!.queue.count > 0){
                        tmpcon!.queue.remove(at: 0)
                    }else{
                        tmpcon!.state = 0
                        var tmpcha = tmpcon!.parent
                        if(tmpcha!.state != 0){
                            if(tmpcha!.queue.count > 0){
                                tmpcha!.queue.remove(at: 0)
                            }else{
                                tmpcha!.state = 0
                            }
                        }
                    }
                }else{
                }
            }
            tmp.State = 0
        }else{
           return "进程未拥有设备"
        }
        return ""
    }
}
