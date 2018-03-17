//
//  fetchJson.swift
//  udaan18
//
//  Created by Admin on 15/02/2018.
//  Copyright © 2018 bvm. All rights reserved.
//

import Foundation
import UIKit
class fetchJson
{
    static var data : Dictionary<String,Any>?
    static let DataUrl = "https://raw.githubusercontent.com/bvmites/udaan18-ios-app/master/Udaan/event-data.json"
    //static let DataUrl = "https://raw.githubusercontent.com/bvmites/udaan18-website/master/data.js"
    static let urls = URL(string: DataUrl)
    static var Tech : tech!
    static var nontechs = [String:nonTech]()
    static var teamUdaan:[Category] = []
    static let url = ["http://www.youtube.com/watch?v=N__oFtLbHQ0",
               
               "instagram://user?username=teamudaan",
               "fb://profile/teamudaan18",
               "mailto:jvaghani971@gmail.com",
               "tel:91-999-999-9999",
               "sms:91-999-999-9999",
               "http://maps.apple.com/?q=Birla+Vishvakarma+Mahavidyalaya+Anand+Gujarat+india"]
    static let optionalUrl = ["http://www.youtube.com/v/N__oFtLbHQ0",
                       "https://www.instagram.com/teamudaan/",
                       "https://www.facebook.com/teamudaan18/",
                       "mailto:jvaghani971@gmail.com",
                       "tel:1-999-999-9999",
                       "sms:1-999-999-9999",
                       "http://maps.apple.com/?ll=22.5525703,72.9238183"
    ]
    
    // fetch data from github and stores in data variable
    static func dataFromBundle()->Data?{
        let baseUrl = Bundle.main.bundleURL
        let url = baseUrl.appendingPathComponent("event-data.json")
        return  try? Data(contentsOf: url)
    }
    
    static func setTeamUdaan(){
        let baseUrl = Bundle.main.bundleURL
        let url = baseUrl.appendingPathComponent("team-udaan.json")
        if let data = try? Data(contentsOf: url)
        {
            if let jsonData = try? JSONSerialization.jsonObject(with: data, options: []) as! [Dictionary<String,Any>]{
                for dict in jsonData {
                    let members = dict["members"] as! [Dictionary<String,String>]
                    let category = dict["category"] as! String
                    var memberss:[Member] = []
                    for memberDict in members{
                        memberss.append(Member(name: memberDict["name"]!, title: memberDict["title"]!))
                    }
                    teamUdaan.append(Category(name: category, members: memberss))
                }
            }
        }

    }
    
    static func dataFromFiles()->Data?{
        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("eventdata")
            return try? Data(contentsOf: fileURL)
            }
        catch {
            print(error)
            return  nil
        }
    }
    
    static func dataFromApi()->Data?{
        if let  data = try? Data(contentsOf: urls!)
        {
            storeJson(dt: data,filename: "eventdata")
            return data
        }
        else{
            print("error in jsonData fetching")
            return nil
        }
    }
    
    static func setData(){
        /*if let newData = dataFromFiles(){
            data = jsonDataToDictionary(data: newData)
            print("from files")
        }
        else if let newData = dataFromApi(){
            data = jsonDataToDictionary(data: newData)
            print("from api")
        }
        else */if let newData = dataFromBundle(){
            data = jsonDataToDictionary(data: newData)
            print("from bundle")
        }
    }
    
    static func jsonDataToDictionary(data:Data)->Dictionary<String,Any>?{
        if let dict = try? JSONSerialization.jsonObject(with: data, options: []){
            return dict as? Dictionary<String,Any>
        }
        else{
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
            setData()
        }
        
        for (key,value) in data!
        {
            if key=="Technical"{
                if let techs:[Dictionary<String,Any>] = value as? [Dictionary<String,Any>]{
                    for dicts in techs{
                        if Tech==nil {
                            Tech = tech(departments: [Department]())
                        }
                        Tech.departments.append(Department(name: dicts["name"] as! String, heads: toManagers(rawData: dicts["heads"] as! [Dictionary<String,String>]), coHeads: toManagers(rawData: dicts["coHeads"] as! [Dictionary<String,String>]), events: toEvents(rawData: dicts["events"] as! [Dictionary<String,Any>])))
                    }
                }
                else {
                    print("error in parsing tech")
                }
            }
            else{
                if let nontech = value as? [Dictionary<String,Any>]{
                        nontechs.updateValue(nonTech(events: toEvents(rawData: nontech)), forKey: key) 
                }
                else{
                    print("error in parsing \(key)")
                }
            }
        }
    }
//    static func parseData(){
//        if data == nil {
//            setData()
//        }
//
//        //Tech Parsing
//        if let techs:[Dictionary<String,Any>] = data?["tech"] as? [Dictionary<String,Any>]{
//            for dicts in techs{
//                if Tech==nil {
//                    Tech = tech(departments: [Department]())
//                }
//                Tech.departments.append(Department(name: dicts["name"] as! String, alias: dicts["alias"] as! String, heads: toManagers(rawData: dicts["heads"] as! [Dictionary<String,String>]), coHeads: toManagers(rawData: dicts["coHeads"] as! [Dictionary<String,String>]), events: toEvents(rawData: dicts["events"] as! [Dictionary<String,Any>])))
//            }
//        }
//        else {
//        print("error in parsing tech")
//        }
//
//        //Nontech Parsing
//        if let nontechs = data?["nonTech"] as? [Dictionary<String,Any>]{
//            if Nontech==nil {
//                Nontech = nonTech(events: [Event]())
//            }
//            Nontech.events = toEvents(rawData: nontechs)
//        }
//        else{
//            print("error in parsing nontech")
//        }
//
//        //Cultural Parsing
//        if let culturals = data?["cultural"] as? [Dictionary<String,Any>]{
//            if Cultural==nil {
//                Cultural = cultural(events: [Event]())
//            }
//            Cultural.events = toEvents(rawData: culturals)
//        }
//        else{
//            print("error in parsing cultural")
//        }
//    }
    
    
    
}
    

