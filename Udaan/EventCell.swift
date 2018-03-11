//
//  EventCell.swift
//  Udaan
//
//  Created by Admin on 05/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    
    @IBOutlet var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.reloadInputViews()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
