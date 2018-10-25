//
//  ViewController.swift
//  OS_3
//
//  Created by Andrew on 2018/10/20.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource {
    
    
    
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
        EquM!.second_init()
        SDT.register(AllTableCell.self, forCellReuseIdentifier: cellTableIdentifier)
        DCT.register(AllTableCell.self, forCellReuseIdentifier: cellTableIdentifier)
        COCT.register(AllTableCell.self, forCellReuseIdentifier: cellTableIdentifier)
        CHCT.register(AllTableCell.self, forCellReuseIdentifier: cellTableIdentifier)
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
            return EquM?.DctList?.count() ?? 0
        }else if (tableView == DCT){
            return EquM?.DctList?.count() ?? 0
        }else if (tableView == COCT){
            return EquM?.CoctList?.count() ?? 0
        }else if (tableView == CHCT){
            return EquM?.ChctList?.count() ?? 0
        }else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == DCT){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableCell
            let rowData = EquM!.DctList?.get(indexPath.row)
            cell.name = rowData!.name
            cell.state = "\(rowData!.state!)"
            return cell
        }
        if(tableView == SDT){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableCell
            let rowData = EquM!.DctList?.get(indexPath.row)
            cell.name = rowData!.name
            cell.state = "\(rowData!.state!)"
            return cell
        }
        if(tableView == COCT){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableCell
            let rowData = EquM!.CoctList?.get(indexPath.row)
            cell.name = rowData!.name
            cell.state = "\(rowData!.state!)"
            return cell
        }
        if(tableView == CHCT){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableCell
            let rowData = EquM!.ChctList?.get(indexPath.row)
            cell.name = rowData!.name
            cell.state = "\(rowData!.state!)"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableCell
            return cell
        }
    }
}

