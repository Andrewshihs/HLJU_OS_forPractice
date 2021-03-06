//
//  AllTableViewCell.swift
//  OS_3
//
//  Created by Andrew on 2018/10/25.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import UIKit

class AllTableViewCell: UITableViewCell {
    
    var name: String = ""{
        didSet{
            if(name != oldValue){
                nameLabel.text  = name
            }
        }
    }
    var state: String = ""{
        didSet{
            if(state != oldValue){
                stateLabel.text  = state
            }
        }
    }
    var parent:String = ""{
        didSet{
            if(parent != oldValue){
                parentLabel.text  = parent
            }
        }
    }
    var queue:String = ""{
        didSet{
                if(parent != oldValue){
                    queueLabel.text  = queue
            }
        }
    }
    @IBOutlet weak var queueLabel: UILabel!
    @IBOutlet weak var parentLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var la2: UILabel!
    @IBOutlet weak var la3: UILabel!
    @IBOutlet weak var la4: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
