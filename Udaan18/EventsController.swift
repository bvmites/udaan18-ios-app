//
//  EventsController.swift
//  Udaan
//
//  Created by Admin on 05/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class EventsController: UITableViewController {
   
    var department:Department? = nil
    var events:[Event]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.autoresizesSubviews = true
        tableView.separatorColor = tableView.backgroundColor
        //tableView.rowHeight = 150
        //navigationItem.rightBarButtonItem!.title = "tails"
        if department != nil {
        let item = UIBarButtonItem(title: "Heads", style: UIBarButtonItemStyle.plain, target: self, action: #selector(displayHead))
            
            //item.tintColor = UIColor.black
            self.navigationItem.rightBarButtonItem = item
            events = department?.events
        }
        //navigationController?.navigationItem.setRightBarButton(item, animated: false)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    @objc func displayHead(){
    let vc = storyboard?.instantiateViewController(withIdentifier: "heads") as! headsController
    vc.title = "heads"
    vc.heads[0] = department?.heads
    vc.heads[1] = department?.coHeads
    self.navigationController?.pushViewController(vc, animated: true)
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
        return (events?.count) ?? 0
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.width*4/7
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath) as! EventCell

     //cell.name.backgroundColor = UIColor(displayP3Red: CGFloat(arc4random()) / CGFloat(UInt32.max), green: CGFloat(arc4random()) / CGFloat(UInt32.max), blue: CGFloat(arc4random()) / CGFloat(UInt32.max), alpha: 0.9)
        
        cell.name.text = events?[indexPath.row].name
        cell.name.frame = CGRect(x: 16, y: 8, width: view.bounds.width-32, height: (view.bounds.width-32)*4/7)
        cell.name.layer.cornerRadius = 10
        cell.name.layer.masksToBounds = true
        
        if cell.layer.sublayers?.count == 2 {
        let gradient = CAGradientLayer()
        
        gradient.frame = CGRect(x: cell.name.frame.minX, y: cell.name.frame.minY, width: cell.name.frame.width, height: cell.name.frame.height) //CGRect(x: cell.name.frame.minX, y: cell.name.frame.minY, width: cell.name.frame.width, height: cell.name.frame.height-55)
        
        
        //gradient.bounds = cell.name.bounds
        gradient.cornerRadius = 10
        gradient.masksToBounds = true
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
            gradient.colors = [color.getcolor1(index: indexPath.row ,alph: 1.0).cgColor,color.getcolor2(index: indexPath.row,alph: 1.0).cgColor]
        cell.layer.insertSublayer(gradient, at:0 )
        }
        else{
            (cell.layer.sublayers![0] as! CAGradientLayer).colors = [color.getcolor1(index: indexPath.row ,alph: 1.0).cgColor,color.getcolor2(index: indexPath.row,alph: 1.0).cgColor]
            cell.layer.sublayers![0].frame = CGRect(x: cell.name.frame.minX, y: cell.name.frame.minY, width: cell.name.frame.width, height: cell.name.frame.height)
        }
      
        
        
     return cell
    }
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        tableView.reloadData()
    }
    override func didRotate(from fromInterfaceOrientation: UIInterfaceOrientation) {
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = storyboard?.instantiateViewController(withIdentifier: "event") as! EventController
        vc.title = events![indexPath.row].name
        vc.event = events![indexPath.row]
        
        /*
        let transition = CATransition()
        transition.duration = 2
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionFade
        self.navigationController?.view.layer.add(transition, forKey: nil)
        */
        let transition:CATransition = CATransition()
        transition.duration = 0.5
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionMoveIn
        transition.subtype = kCATransitionFromTop
        self.navigationController!.view.layer.add(transition, forKey: kCATransition)
        
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
