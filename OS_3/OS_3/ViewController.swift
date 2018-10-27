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
    @IBOutlet weak var InputText: UITextField!
    @IBOutlet weak var InputText2: UITextField!
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
                let equName = InputText.text!
                let   conName = Int(InputText2.text!) ?? 0
                EquM!.AddEquipment(equName,conName)
        }else{
            let conName = InputText.text!
            let chName = Int(InputText2.text!) ?? 0
            EquM!.AddControl(conName,chName)
        }
        InputText.text = ""
        InputText2.text = ""
        refreshUI()
    }
    
    @IBAction func EquDelete(_ sender: UIButton) {
        var back = ""
        if TypeFlag == 0{
            let equName = InputText.text!
            back = EquM!.DeleteEquipment(equName)
        }else{
            let conName  = InputText.text!
            back = EquM!.DeleteContrl(conName)
            print(conName)
        }
        InputText.text = back
        InputText2.text = ""
        refreshUI()
    }
    
    @IBAction func EquAllocation(_ sender: UIButton) {
        let equName = InputText.text!
        EquM!.Allocation(equName)
        InputText.text = ""
        refreshUI()
    }
    
    @IBAction func EquCollection(_ sender: UIButton) {
        let equName = InputText.text!
        EquM!.Collection(equName)
        InputText.text = ""
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
        return EquM!.DctList.getSize()
        }else if (tableView == DCT){
        return EquM!.DctList.getSize()
        }else if (tableView == COCT){
        return EquM!.CoctList.getSize()
        }else{
        return EquM!.ChctList.getSize()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == DCT){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableViewCell
            let rowData = EquM!.DctList.get(indexPath.row)
            cell.name  = "\(rowData!.name)"
            cell.state = "\(rowData!.state!)"
            let pp = rowData!.parent?.name ?? " " 
            cell.parent = "\(pp)"
            cell.queue = " "
            return cell
        }else if(tableView == SDT){
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
            return cell
        }else if(tableView == COCT){
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableViewCell
            let rowData = EquM!.CoctList.get(indexPath.row)
            cell.name  = "\(rowData!.name)"
            cell.state = "\(rowData!.state!)"
            let pp = rowData!.parent!.name
            cell.parent = "\(pp)"
            cell.queue = " "
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: cellTableIdentifier, for: indexPath) as! AllTableViewCell
            let rowData = EquM!.ChctList.get(indexPath.row)
            cell.name  = "\(rowData!.name)"
            cell.state = "\(rowData!.state!)"
            cell.queue = " "
            cell.la3.text = ""
            cell.parent = " "
            return cell
        }
    }
}

