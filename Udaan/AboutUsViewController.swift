//
//  AboutUsViewController.swift
//  Udaan
//
//  Created by Admin on 04/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import UIKit
import StoreKit

class AboutUsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var sclView: UIScrollView!
    @IBAction func rateUs(_ sender: UIBarButtonItem) {
       /* custom rate review
         let appID = "959379869"
        let urlStr = "itms-apps://itunes.apple.com/app/id\(appID)"
        //let urlStr = "http://appstore.com/udaan"
        // (Option 1) Open App Page
        //let urlStr = "itms-apps://itunes.apple.com/app/viewContentsUserReviews?id=\(appID)" // (Option 2) Open App Review Tab
        
        
        if let url = URL(string: urlStr), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 11, *) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            } else {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
                //UIApplication.shared.openURL(url)
            }
        }
        */
        SKStoreReviewController.requestReview()
    
    }

    

    @IBAction func connect(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:fetchJson.url[sender.tag])! , options: [:]) { (poss) in
            if poss{
                print("done")
            }
            else{
                    print("error")
                print(fetchJson.url[sender.tag])
                UIApplication.shared.open(URL(string: fetchJson.optionalUrl[sender.tag])! , options: [:],completionHandler: nil)
            }
        }
    }

    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
