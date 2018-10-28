//
//  ProCell.swift
//  OS_3
//
//  Created by Andrew on 2018/10/28.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import UIKit

class ProCell: UITableViewCell {
    var Proce: String = ""{
        didSet{
            if(Proce != oldValue){
                Process.text  = Proce
            }
        }
    }
    var dev: String = ""{
        didSet{
            if(dev != oldValue){
                device.text  = dev
            }
        }
    }
    var stat: String = ""
    /*{
        didSet{
            if(stat != oldValue){
                state.text  = stat
            }
        }
    }*/
    
    
    
    
    
    
    @IBOutlet weak var Process: UILabel!
    @IBOutlet weak var state: UILabel!
    @IBOutlet weak var device: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
