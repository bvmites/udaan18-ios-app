//
//  EventController.swift
//  Udaan
//
//  Created by Admin on 08/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class EventController: UIViewController {
    var event:Event?
    @IBOutlet var name: UILabel!
    @IBOutlet var Description: UILabel!
    @IBOutlet var Participants: UILabel!
    @IBOutlet var Fees: UILabel!
    @IBOutlet var Rounds: UILabel!
    @IBOutlet var Prizes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = event?.name
        Description.text = event?.description
        Participants.text = "Participants:-" + (event?.participants)!
        Fees.text = "Fees:-" + (event?.fees)!
        var c = 0
        for round in (event?.rounds)! {
            Rounds.text = Rounds.text! + "Round \(c+1):-\(round)\n\n"
            c = c+1
        }
        c = 0
        for prize in (event?.prizes)! {
            Prizes.text = Prizes.text! + "Prize \(c+1):-\(prize)\n\n"
            c = c+1
        }
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
