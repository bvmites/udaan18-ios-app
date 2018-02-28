//
//  fetchJson.swift
//  udaan18
//
//  Created by Admin on 15/02/2018.
//  Copyright © 2018 bvm. All rights reserved.
//

import Foundation
class fetchJson
{
    static var data : Dictionary<String,Any>?
    static let DataUrl = "https://raw.githubusercontent.com/bvmites/udaan17-android-app/master/mock-api/event-data.json"
    static let urls = URL(string: DataUrl)
    
    static var Tech : tech!
    static var Nontech:nonTech!
    static var Cultural:cultural!
    
    // fetch data from github and stores in data variable
    static func fetch()->Dictionary<String,Any>? {
        if let  datas = try? Data(contentsOf: urls!)
        {
            let json = try? JSONSerialization.jsonObject(with: datas,options: []) as! Dictionary<String,Any>
            return json
        }
        else{
            print("error in json fetching")
            return nil
        }
    }
    
    
    
    //Parse from json to objects
    static func parseData(){
        if data == nil {
            data = fetch()
        }
        
        //Tech Parsing
        if let techs:[Dictionary<String,Any>] = data?["tech"] as? [Dictionary<String,Any>]{
            for dicts in techs{
                if Tech==nil {
                    Tech = tech(departments: [Department]())
                }
                Tech.departments.append(Department(name: dicts["name"] as! String, alias: dicts["alias"] as! String, heads: toManagers(rawData: dicts["heads"] as! [Dictionary<String,String>]), coHeads: toManagers(rawData: dicts["coHeads"] as! [Dictionary<String,String>]), events: toEvents(rawData: dicts["events"] as! [Dictionary<String,Any>])))
                
            }
        }
        else {
        print("error in parsing tech")
        }
        
        //Nontech Parsing
        if let nontechs = data?["nonTech"] as? [Dictionary<String,Any>]{
            if Nontech==nil {
                Nontech = nonTech(events: [Event]())
            }
            Nontech.events = toEvents(rawData: nontechs)
            
        }
        else{
            print("error in parsing nontech")
        }
        
        //Cultural Parsing
        if let culturals = data?["cultural"] as? [Dictionary<String,Any>]{
            if Cultural==nil {
                Cultural = cultural(events: [Event]())
            }
            Cultural.events = toEvents(rawData: culturals)
        }
        else{
            print("error in parsing cultural")
        }
        
        
    }
    
    
    
}
    

