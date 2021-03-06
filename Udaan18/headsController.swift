//
//  headsController.swift
//  Udaan
//
//  Created by Admin on 12/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class headsController: UITableViewController {
    var heads:Dictionary<Int,[Manager]?> = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
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
        return heads.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return heads[section]??.count ?? 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.width/3
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heads", for: indexPath) as! headsCell
        cell.manager.text = (heads[indexPath.section]?![indexPath.row].name)!//"\((heads[indexPath.section]?![indexPath.row].name)!)\n\((heads[indexPath.section]?![indexPath.row].mobile)!)"
        // Configure the cell...
        //cell.manager.backgroundColor = UIColor.white
        //cell.manager.layer.cornerRadius = 10
        //cell.manager.layer.masksToBounds = true
        if cell.subviews.count == 2 {
            let gradient = CAGradientLayer()
            
            gradient.frame = CGRect(x: cell.subviews[0].frame.minX+8 , y: cell.subviews[0].frame.minY+8, width: view.bounds.width-16, height: cell.frame.height-16 ) // -90
            
            gradient.cornerRadius = 10
            gradient.masksToBounds = true
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 1)
            
            gradient.colors = [color.getcolor1(index: indexPath.section ,alph: 1.0).cgColor,color.getcolor2(index: indexPath.section,alph: 1.0).cgColor]
            //gradient.colors = [color.getcolor1(alph: 1.0),color.getcolor2(alph: 1.0)]
            let v = UIView(frame: cell.subviews[0].frame)
            v.layer.insertSublayer(gradient, at: 0)
            cell.insertSubview(v, at: 0)
        }
        else{
            // cell.subviews[0].layer.sublayers![0].frame = CGRect(x: cell.subviews[0].frame.minX+8 , y: cell.subviews[0].frame.minY+8, width: view.bounds.width-16, height: cell.frame.height-16 )
            (cell.subviews[0].layer.sublayers![0] as! CAGradientLayer).colors = [color.getcolor1(index: indexPath.section ,alph: 1.0).cgColor,color.getcolor2(index: indexPath.section,alph: 1.0).cgColor]
        }
        
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section==0{
            return "heads"
        }
        else {
            return "coHeads"
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     let   url = URL(string: "tel:"+(heads[indexPath.section]?![indexPath.row].mobile)! )
    UIApplication.shared.open(url!, options: [:], completionHandler: {print($0)})
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
