//
//  techListController.swift
//  Udaan
//
//  Created by Admin on 05/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class techListController: UITableViewController {
    var lableFontSize  = CGFloat(35)
    override func viewDidLoad() {
        super.viewDidLoad()
        lableFontSize = self.view.bounds.width/7
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchJson.Tech.departments.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "techCell", for: indexPath) as! techCell
        
        /*
         cell.BackImage.contentMode = UIViewContentMode.scaleToFill
         cell.BackImage.image =  UIImage(named: eventTypeList[indexPath.row])
         
         cell.layer.cornerRadius = 10
         cell.layer.masksToBounds = true
         */
        /*
        let lab = UILabel(frame: CGRect(x: cell.bounds.minX+8, y: cell.bounds.minY+8, width: cell.bounds.width-16, height: cell.bounds.height-8))
        lab.backgroundColor = UIColor(displayP3Red: CGFloat(arc4random()) / CGFloat(UInt32.max), green: CGFloat(arc4random()) / CGFloat(UInt32.max), blue: CGFloat(arc4random()) / CGFloat(UInt32.max), alpha: 0.5)
        lab.text = "  " + fetchJson.Tech.departments[indexPath.row].name
        lab.textColor = UIColor.black
        
        lab.layer.cornerRadius = 10
        lab.layer.masksToBounds = true
        //lab.font = UIFont(descriptor:UIFontDescriptor.init(name: font, size: lableFontSize),size:lableFontSize)
        //lab.font = UIFont.init(name: font, size: lableFontSize)
        lab.font = UIFont.boldSystemFont(ofSize: lableFontSize)
        cell.addSubview(lab)
        */
        cell.name.backgroundColor = UIColor(displayP3Red: CGFloat(arc4random()) / CGFloat(UInt32.max), green: CGFloat(arc4random()) / CGFloat(UInt32.max), blue: CGFloat(arc4random()) / CGFloat(UInt32.max), alpha: 0.5)
        
        cell.name.text = fetchJson.Tech.departments[indexPath.row].name
        cell.name.layer.cornerRadius = 10
        cell.name.layer.masksToBounds = true
        // Configure the cell...
        
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "events") as! EventsController
        vc.title = fetchJson.Tech.departments[indexPath.row].name
        vc.events = fetchJson.Tech.departments[indexPath.row].events
        navigationController?.pushViewController(vc, animated: true)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
