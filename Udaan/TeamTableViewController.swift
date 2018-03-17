//
//  TeamTableViewController.swift
//  Udaan
//
//  Created by Admin on 04/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class TeamTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if fetchJson.teamUdaan.count == 0 {
            fetchJson.setTeamUdaan()
            tableView.sectionHeaderHeight = 50
        }
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
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
        return fetchJson.teamUdaan.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return fetchJson.teamUdaan[section].members.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return fetchJson.teamUdaan[section].name
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamUdaan", for: indexPath) as! teamUdaanCell
        cell.title.text = fetchJson.teamUdaan[indexPath.section].members[indexPath.row].title
        cell.name.text = fetchJson.teamUdaan[indexPath.section].members[indexPath.row].name
        
        if cell.subviews.count == 2 {
            let gradient = CAGradientLayer()
            
            gradient.frame = CGRect(x: cell.subviews[0].frame.minX+8 , y: cell.subviews[0].frame.minY+8, width: cell.subviews[0].frame.width-16, height: cell.frame.height-16 ) // -90
            
            //            gradient.cornerRadius = 10
            //            gradient.masksToBounds = true
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            
            gradient.colors = [color.getcolor1(index: indexPath.section ,alph: 1.0).cgColor,color.getcolor2(index: indexPath.section,alph: 1.0).cgColor]
            //gradient.colors = [color.getcolor1(alph: 1.0),color.getcolor2(alph: 1.0)]
            let v = UIView(frame: cell.subviews[0].frame)
            v.layer.insertSublayer(gradient, at: 0)
            cell.insertSubview(v, at: 0)
        }
        else{
            cell.subviews[0].layer.sublayers![0].frame = CGRect(x: cell.subviews[0].frame.minX+8 , y: cell.subviews[0].frame.minY+8, width: cell.subviews[0].frame.width-16, height: cell.frame.height-16 )
            (cell.subviews[0].layer.sublayers![0] as! CAGradientLayer).colors = [color.getcolor1(index: indexPath.section ,alph: 1.0).cgColor,color.getcolor2(index: indexPath.section,alph: 1.0).cgColor]
        }
        //cell.layer.cornerRadius = 10
        //cell.layer.masksToBounds = true
        //cell.layer.backgroundColor = UIColor.lightGray as! CGColor
        // Configure the cell...

        return cell
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
