//
//  ViewController.swift
//  OS_3
//
//  Created by Andrew on 2018/10/20.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var EquM:EquipmentManage?
    let cellTableIdentifier  = "CellTableIdentifier"
    
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
            EquipmentType.text = "设备"
        }else{
            TypeFlag = 1
            EquipmentType.text = "控制器"
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
        EquM!.second_init()
        SDT.tableFooterView = UIView()
        DCT.tableFooterView = UIView()
        CHCT.tableFooterView = UIView()
        COCT.tableFooterView = UIView()
        let xib = UINib(nibName: "AllTableViewCell", bundle: nil)
        SDT.register(AllTableViewCell.self, forCellReuseIdentifier: cellTableIdentifier)
        SDT.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        SDT.rowHeight = 90
        DCT.register(AllTableViewCell.self, forCellReuseIdentifier: cellTableIdentifier)
        DCT.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        DCT.rowHeight = 90
        COCT.register(AllTableViewCell.self, forCellReuseIdentifier: cellTableIdentifier)
        COCT.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        COCT.rowHeight = 90
        CHCT.register(AllTableViewCell.self, forCellReuseIdentifier: cellTableIdentifier)
        CHCT.register(xib, forCellReuseIdentifier: cellTableIdentifier)
        CHCT.rowHeight = 90
        // Do any additional setup after loading the view, typically from a nib.
    }
    func refreshUI(){
        SDT.reloadData()
        DCT.reloadData()
        COCT.reloadData()
        CHCT.reloadData()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if(tableView == SDT){
            print("sdt count")
        print("\(EquM!.DctList.getSize())")
        return EquM!.DctList.getSize()
        }else if (tableView == DCT){
            print("dct count")
        print("\(EquM!.DctList.getSize())")
        return EquM!.DctList.getSize()
        }else if (tableView == COCT){
            print("coct count")
        print("\(EquM!.CoctList.getSize())")
        return EquM!.CoctList.getSize()
        }else{
            print("chct count")
        print("\(EquM!.ChctList.getSize())")
        return EquM!.ChctList.getSize()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == DCT){
            print("dct value")
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableViewCell
            let rowData = EquM!.DctList.get(indexPath.row)
            cell.name  = "\(rowData!.name)"
            cell.state = "\(rowData!.state!)"
            let pp = rowData!.parent!.name
            cell.parent = "\(pp)"
            cell.queue = " "
            return cell
        }else if(tableView == SDT){
            print("sdt value")
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableViewCell
            let rowData = EquM!.DctList.get(indexPath.row)
            cell.name  = "\(rowData!.name)"
            cell.state = " "
            cell.parent = " "
            cell.la2.text = ""
            cell.la3.text = ""
            cell.la4.text = ""
            cell.parent = ""
            cell.queue = " "
            print ("prepare return sdt ")
            return cell
        }else if(tableView == COCT){
            print("coct value")
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableViewCell
            let rowData = EquM!.CoctList.get(indexPath.row)
            cell.name  = "\(rowData!.name)"
            cell.state = "\(rowData!.state!)"
            let pp = rowData!.parent!.name
            cell.parent = "\(pp)"
            cell.queue = " "
             print ("prepare return coct ")
            return cell
        }else{
            print("chct value")
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableViewCell
            let rowData = EquM!.ChctList.get(indexPath.row)
            cell.name  = "\(rowData!.name)"
            cell.state = "\(rowData!.state!)"
            cell.queue = " "
             print ("prepare return chct ")
            return cell
        }
    }
}

