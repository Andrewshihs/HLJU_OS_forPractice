//
//  Process.swift
//  OS_3
//
//  Created by Andrew on 2018/10/28.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import Foundation
class Process{
    var Pname: String?
    var Ename: String?
    var State: Int?
    init(_ Pna:String,_ Ena:String) {
        self.Pname = Pna
        self.Ename = Ena
        State =  1
    }
}
