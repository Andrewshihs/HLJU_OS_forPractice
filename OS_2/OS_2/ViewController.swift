//
//  ViewController.swift
//  OS_2
//
//  Created by Andrew on 2018/10/12.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource{
    
    var flag = 0;
    var bitmap =  BitMap()
    @IBOutlet weak var AlgorSwitch: UISwitch!
    @IBOutlet weak var Algor: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var Absent: UILabel!
    @IBOutlet weak var bitOne: UILabel!
    @IBOutlet weak var bitTwo: UILabel!
    @IBOutlet weak var bitThree: UILabel!
    @IBOutlet weak var bitFour: UILabel!
    @IBOutlet weak var ADD: UILabel!
    @IBOutlet weak var InText: UITextField!
    @IBOutlet weak var PagePicker:  UIPickerView!
    @IBOutlet weak var MemoryPicker:  UIPickerView!
    @IBOutlet weak var PageTable: UITableView!
    @IBOutlet weak var MemoryTable: UITableView!
    @IBOutlet weak var startButton:UIButton!
    @IBOutlet weak var exitButton:UIButton!
    @IBOutlet weak var ConfirmButton:UIButton!
    var absentCount = 0.0
    var ConfirmCount = 0.0
    let MemoryNumber = ["3","4","5"]
    let PageNumber = ["5","6","7","8"]
    var  pageInfo = [Int]()
    var MemoryInfo = [Int]()
    var Memory = [Int]()
    var back = [Int]()
    var state = [Int]()
    var OPT = [Int]()
    
    @IBAction func Confirm(_ sender: UIButton) {
        let y = hexTodec.hexTodec(number: InText.text!)
        let x = y/1024  //转换为页号
        let row1 = PagePicker.selectedRow(inComponent:0)
        let selectedPage = PageNumber[row1]

        if(x<=Int(selectedPage)!){
            var sflag = 0
            if(!Memory.isEmpty){
                for index in 0..<MemoryInfo.count{
                    if(x == MemoryInfo[index]){
                        sflag = 1 }
                }
                if(sflag==0){
                    pageInfo[x] = Memory.first!
                    state[x] = 1
                    Memory.remove(at: 0)
                    MemoryInfo[Int(absentCount)] = x
                    absentCount += 1
                }
            }else{
                if(flag == 0){
                    let ss=FIFO(page1: x)
                    if(ss == 0){
                        MemoryInfo.remove(at: 0)
                        MemoryInfo.append(x)
                    }
                }else{
                    let rr=LRU(page1: x)
                    if(rr == 1){
                        MemoryInfo.remove(at: 0)
                        MemoryInfo.append(x)
                    }
                }
            }
            let address = pageInfo[x]*1024+y-x*1024
            ADD.text = "\(address)"
            OPT.append(x)
            ConfirmCount += 1
        }else{
            InText.text = "地址越界"
            return
        }
        Absent.text = "\(Int(absentCount))"
        let rat =  String(format: "%.2f",absentCount/ConfirmCount*100)
        print(rat)
        rate.text = "\(rat)%"
        print(ConfirmCount)
        self.PageTable.reloadData()
        self.MemoryTable.reloadData()
        InText.text = ""
    }
    @IBAction func Start(_ sender: UIButton) {
        exitButton.isEnabled = true
        ConfirmButton.isEnabled = true
        startButton.isEnabled = false
        let row1 = PagePicker.selectedRow(inComponent:0)
        let selectedPage = PageNumber[row1]
        let row2 = MemoryPicker.selectedRow(inComponent:0)
        let selectedMemory = MemoryNumber[row2]
        for _ in 0..<Int(selectedPage)!{
                pageInfo.append(-1)
                state.append(0)
        }
        for _ in 0..<Int(selectedMemory)!{
            MemoryInfo.append(-1)
        }
        var count = 0;
        for BitIndex in 0..<bitmap.ABit.count{
            if(bitmap.ABit[BitIndex] == 0){
                Memory.append(BitIndex)
                bitmap.ABit[BitIndex] = 1
                count += 1
                if(count==(Int(selectedMemory)!)){
                    break
                }
            }
        }
        for index in 0..<Memory.count{
            back.append(Memory[index])
        }
        self.PageTable.reloadData()
        self.MemoryTable.reloadData()
        OutputBitMap()
        InText.text = ""
    }
    
    @IBAction func Over(_ sender: UIButton) {
        startButton.isEnabled = true
        for index in 0..<back.count{   //位示图还原
            bitmap.ABit[back[index]] = 0
        }
        Memory.removeAll()
        MemoryInfo.removeAll()
        pageInfo.removeAll()
        state.removeAll()
        absentCount = 0
        ConfirmCount = 0
        rate.text = ""
        Absent.text = ""
        ADD.text = ""
        self.PageTable.reloadData()
        self.MemoryTable.reloadData()
        OutputBitMap()
    }
    @IBAction func Algorithm(_ sender: UISwitch) {
        if(!AlgorSwitch.isOn){
            flag = 1;
            Algor.text = "LRU"
        }else{
            flag = 0;
            Algor.text = "FIFO"
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Algor.text = "FIFO"
        rate.text = "0"
        Absent.text = "0"
        bitOne.text =   "            "
        bitTwo.text =   "            "
        bitThree.text = "            "
        bitFour.text =   "            "
        ADD.text = ""
        bitmap.BitMap()
        OutputBitMap()
        self.PageTable?.tableFooterView = UIView()
        self.MemoryTable?.tableFooterView = UIView()
        exitButton.isEnabled = false
        ConfirmButton.isEnabled = false
        //InText.text = "内存块数"
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfComponents(in pickerView:UIPickerView)->Int{
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(pickerView == PagePicker){
            return PageNumber.count
        }else{
            return MemoryNumber.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(pickerView == PagePicker){
            return PageNumber[row]
        }else{
            return MemoryNumber[row]
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == PageTable){
            let row1 = PagePicker.selectedRow(inComponent:0)
            let selectedPage = PageNumber[row1]
            return Int(selectedPage)!
        }else if(tableView == MemoryTable){
            let row2 = MemoryPicker.selectedRow(inComponent:0)
            let selectedMemory = MemoryNumber[row2]
            return Int(selectedMemory)!
        }else{
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView == PageTable){
            if(pageInfo.count != 0){
                var cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableIdentifier")
                if(cell == nil){
                    cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "SimpleTableIdentifier")
                }
                cell?.textLabel?.text = "\(pageInfo[indexPath.row])           "+"\(state[indexPath.row])  "
                return cell!
            }else{
            return UITableViewCell()
            }
        }else if(tableView == MemoryTable){
            if(MemoryInfo.count != 0){
                var cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableIdentifier")
                if(cell == nil){
                    cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "SimpleTableIdentifier")
                }
                cell?.textLabel?.text = "\(MemoryInfo[indexPath.row])   "
                return cell!
            }else{
            return UITableViewCell()
            }
        }else{
            return UITableViewCell()
        }
    }
    func OutputBitMap(){
        var bitString = String()
        for index in 0...7{
            bitString += "\(bitmap.display(index: index))   "
        }
        bitOne.text = bitString
        bitString = ""
        for index in 8...15{
            bitString += "\(bitmap.display(index: index))   "
        }
        bitTwo.text = bitString
        bitString = ""
        for index in 16...23{
            bitString += "\(bitmap.display(index: index))   "
        }
        bitThree.text = bitString
        bitString = ""
        for index in 24...31{
            bitString += "\(bitmap.display(index: index))   "
        }
        bitFour.text = bitString
        bitString = ""
    }
    func FIFO(page1: Int)->Int{
        for index in 0..<MemoryInfo.count{
            if(page1 == MemoryInfo[index]){
               return 1
                }
        }
        absentCount += 1
        let temp = MemoryInfo[0]
        pageInfo[page1] = pageInfo[temp]
        pageInfo[temp] = -1
        state[page1] = 1
        state[temp] = 0
        return 0
    }
    func LRU(page1: Int)->Int{
        for index in 0..<MemoryInfo.count{
            if(page1 == MemoryInfo[index]){
                MemoryInfo = MemoryInfo.filter{$0 != page1}
                MemoryInfo.append(page1)
                return 0
            }
        }
        absentCount += 1
        let temp = MemoryInfo[0]
        pageInfo[page1] = pageInfo[temp]
        pageInfo[temp] = -1
        state[page1] = 1
        state[temp] = 0
        return 1
        }
    func OPT(OP: [Int]){
        MemoryInfo.removeAll()
        pageInfo.removeAll()
        self.MemoryTable.reloadData()
        self.PageTable.reloadData()
        let row2 = MemoryPicker.selectedRow(inComponent:0)
        let selectedMemory = MemoryNumber[row2]
        var index = 0;
        if(index < Int(selectedMemory)!){
            MemoryInfo[index] = OP[index]
            index += 1
        }
        
        
    }
        
}




