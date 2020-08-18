//
//  valueNameTableViewCell.swift
//  ValuteConverter
//
//  Created by Максим Солнцев on 8/15/20.
//  Copyright © 2020 Максим Солнцев. All rights reserved.
//

import UIKit

class valueNameTableViewCell: UITableViewCell {

   
    @IBOutlet weak var nameButton: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    
    @IBAction func nameButtonAction(_ sender: Any) {
        
        
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
