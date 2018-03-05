//
//  developerTableViewController.swift
//  Udaan
//
//  Created by Admin on 05/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit

class developerTableViewController: UITableViewController {
   
    var developers:[developer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.cellLayoutMarginsFollowReadableWidth = true
        tableView.separatorColor = UIColor.black
        tableView.separatorStyle = UITableViewCellSeparatorStyle.singleLine
        if developers.count == 0 {
            setDevelopers()
        }
       
    }
    
    func setDevelopers(){
        let baseUrl = Bundle.main.bundleURL
        let url = baseUrl.appendingPathComponent("developers.json")
        if let data = try? Data(contentsOf: url)
        {
            if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as! [Dictionary<String,String>]{
                for dict in jsonData {
                    let developerr = developer(name: dict["name"]!, title: dict["title"]!, mobile: dict["mobile"]!, email: dict["email"]!, github: dict["github"]!)
                        developers.append(developerr)
                }
                    
            }
        }
    }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    

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
        return developers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "developerCell", for: indexPath) as! developerCell
        cell.developr = developers[indexPath.row]
        // Configure the cell...
        cell.name.text = "  " + developers[indexPath.row].name
        cell.title.text = "  " + developers[indexPath.row].title
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
