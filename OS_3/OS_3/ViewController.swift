//
//  ViewController.swift
//  OS_3
//
//  Created by Andrew on 2018/10/20.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var EquM:EquipmentManage?
    @IBOutlet weak var SDT: UITableView!
    @IBOutlet weak var DCT: UITableView!
    @IBOutlet weak var COCT: UITableView!
    @IBOutlet weak var CHCT: UITableView!
    @IBOutlet weak var EquipmentType: UILabel!
    @IBOutlet weak var InpurtText: UITextField!
    @IBOutlet weak var TypeSwitch: UISwitch!
    
    var TypeFlag = 0  //设备\控制器开关
    
    @IBAction func EquipmentSwitch(_ sender: UISwitch) {
        if TypeSwitch.isOn{
            TypeFlag = 0
        }else{
            TypeFlag = 1
        }
    }
    
    @IBAction func EquAdd(_ sender: UIButton) {
        
        if TypeFlag == 0{
            EquM!.AddEquipment("test")
        }else{
            EquM!.AddControl("test")
        }
        refreshUI()
    }
    
    @IBAction func EquDelete(_ sender: UIButton) {
        if TypeFlag == 0{
            EquM!.DeleteEquipment("test")
        }else{
            EquM!.DeleteContrl("test")
        }
        refreshUI()
    }
    
    @IBAction func EquAllocation(_ sender: UIButton) {
        EquM!.Allocation("test")
        refreshUI()
    }
    
    @IBAction func EquCollection(_ sender: UIButton) {
        EquM!.Collection("test")
        refreshUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        EquM = EquipmentManage()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func refreshUI(){
        SDT.reloadData()
        DCT.reloadData()
        COCT.reloadData()
        CHCT.reloadData()
    }

}

