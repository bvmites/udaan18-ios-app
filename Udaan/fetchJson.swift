//
//  fetchJson.swift
//  udaan18
//
//  Created by Admin on 15/02/2018.
//  Copyright © 2018 bvm. All rights reserved.
//

import Foundation
import UIKit
import JavaScriptCore
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
        
        
        let ur = Bundle.main.bundleURL
        let urs = ur.appendingPathComponent("event-data.json")
    
        if let dt =  try? Data(contentsOf: urs)
        {
            print( NSData(data: dt).length )
            let js = try? JSONSerialization.jsonObject(with: dt, options: []) as! Dictionary<String,Any>
            

        return js
        }
        else{
            return nil
        }
        
        
   
        
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("datajson")
            
            if let dts:Data? = try Data(contentsOf: fileURL){
            print(dts)
                let json = try? JSONSerialization.jsonObject(with: dts!,options: []) as! Dictionary<String,Any>
            return json
            }
            else{
                print("in else")
                return nil
            }
            
        } catch {
            print(error)
            return  nil
        }
 
        

        
        if let  datas = try? Data(contentsOf: urls!)
        {
            storeJson(dt: datas,filename: "event-data.json")
            let json = try? JSONSerialization.jsonObject(with: datas,options: []) as! Dictionary<String,Any>
            return json
        }
        else{
            print("error in json fetching")
            return nil
        }

    
    }
 static func storeJson(dt:Data,filename:String){
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent(filename)
            
                try dt.write(to: fileURL)
               
            
        } catch {
            print(error)
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
    

