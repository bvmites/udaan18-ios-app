//
//  developerCell.swift
//  Udaan
//
//  Created by Admin on 05/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class developerCell: UITableViewCell {
    var developr:developer?
    
    @IBOutlet var name: UILabel!
    @IBOutlet var title: UILabel!
    @IBOutlet var call: UIButton!
    @IBOutlet var mail: UIButton!
    @IBOutlet var git: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func contact(_ sender: UIButton) {
        var url:URL?
        switch sender.tag {
        case 0:
            var number = (developr?.mobile) ?? "+910000000000"
//            number.remove(at: number.startIndex)
//            number.insert("-", at: number.index(number.startIndex, offsetBy: 2) )
//            number.insert("-", at: number.index(number.startIndex, offsetBy: 6) )
//            number.insert("-", at: number.index(number.startIndex, offsetBy: 10) )

            url = URL(string: "tel:"+number )
            
            break
        case 1:
            url = URL(string: "mailto:"+(developr?.email)!)
            break
        case 2:
            url = URL(string: (developr?.github)!)
            break
        default:
            return
        }
        print(url!)
        UIApplication.shared.open(url!, options: [:], completionHandler: {print($0)})
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
