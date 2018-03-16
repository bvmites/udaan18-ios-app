//
//  EventManagerController.swift
//  Udaan
//
//  Created by Admin on 14/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class EventManagerController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    var managers:[Manager]?
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0 {
            print("number of rows")
            return (managers?.count)!
        }
        else{
            print("else")
            return 0
        }
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! contactCell
        cell.contactlable.text = managers![indexPath.row].name + "\n" + managers![indexPath.row].mobile
        cell.contactlable.layer.cornerRadius = 10
        cell.contactlable.layer.masksToBounds = true
        
        let gradient = CAGradientLayer()
        
        gradient.frame = cell.contactlable.frame
        gradient.cornerRadius = 10
        gradient.masksToBounds = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        let color1 = UIColor(displayP3Red: CGFloat(arc4random()) / CGFloat(UInt32.max), green: CGFloat(arc4random()) / CGFloat(UInt32.max), blue: CGFloat(arc4random()) / CGFloat(UInt32.max), alpha: 0.5).cgColor
        let color2 = UIColor(displayP3Red: CGFloat(arc4random()) / CGFloat(UInt32.max), green: CGFloat(arc4random()) / CGFloat(UInt32.max), blue: CGFloat(arc4random()) / CGFloat(UInt32.max), alpha: 0.5).cgColor
        gradient.colors = [color1,color2]
        cell.layer.insertSublayer(gradient, at:0 )

        print("cell for row at")
        return cell
    }
    @IBAction func removePopup(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==0{
            return "Event Managers"
        }
        return nil
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("poping")
        
        
        let   url = URL(string: "tel:"+(managers![indexPath.row].mobile) )
        print(url)
        UIApplication.shared.open(url!, options: [:], completionHandler: {print($0)})
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        print("section")
        return 1
    }
    @IBOutlet var Contacts: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Contacts.layer.cornerRadius = 10
        Contacts.layer.masksToBounds = true
        Contacts.bounces = false
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.dismiss(animated: true, completion: nil)
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
