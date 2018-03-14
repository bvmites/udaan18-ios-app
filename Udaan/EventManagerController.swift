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
        cell.contactlable.backgroundColor = UIColor.red
        print("cell for row at")
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==0{
            return "Event Managers"
        }
        return nil
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("poping")
        
        self.dismiss(animated: true, completion: nil)
//        let   url = URL(string: "tel:"+(managers![indexPath.row].mobile) )
//        print(url)
//        UIApplication.shared.open(url!, options: [:], completionHandler: {print($0)})
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
