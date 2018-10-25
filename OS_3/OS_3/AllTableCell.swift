//
//  AllTableCell.swift
//  OS_3
//
//  Created by Andrew on 2018/10/24.
//  Copyright © 2018年 Andrew. All rights reserved.
//

import UIKit

class AllTableCell: UITableViewCell {
    var name: String = ""{
        didSet{
            if (name != oldValue){
                nameLabel.text = name
            }
        }
    }
    var state: String = ""{
        didSet{
            if (state != oldValue){
                stateLabel.text = state 
            }
        }
    }
    var  nameLabel: UILabel!
    var stateLabel: UILabel!
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        print("cell init")
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let nameLabelRect = CGRect(x:0,y:5,width:70,height:15)
        let nameMarker = UILabel(frame: nameLabelRect)
        nameMarker.textAlignment = NSTextAlignment.right
        nameMarker.text = "Name: "
        nameMarker.font = UIFont.boldSystemFont(ofSize: 12)
        contentView.addSubview(nameMarker)
        
        let stateLabelRect = CGRect(x:0,y:26,width:70,height:15)
        let stateMarker = UILabel(frame: stateLabelRect)
        stateMarker.textAlignment = NSTextAlignment.right
        stateMarker.text = "state: "
        stateMarker.font = UIFont.boldSystemFont(ofSize: 12)
        contentView.addSubview(stateMarker)
        
        let nameValueRect = CGRect(x:80,y:5,width:200,height:15)
        nameLabel = UILabel(frame: nameValueRect)
        contentView.addSubview(nameLabel)
        
        let stateValueRect = CGRect(x:80,y:25,width:200,height:15)
        stateLabel = UILabel(frame: stateValueRect)
        contentView.addSubview(stateLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
