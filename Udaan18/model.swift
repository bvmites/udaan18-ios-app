//
//  model.swift
//  udaan18
//
//  Created by Admin on 17/02/2018.
//  Copyright © 2018 bvm. All rights reserved.
//

import Foundation
struct developer{
    var name: String
    var title:String
    var mobile:String
    var email:String
    var github:String
}
public struct Member {
    var name:String
    var title:String
    var mobile:String
}

public struct Category{
    var name:String
    var members:[Member]
}
struct Manager{
    var name:String
    var mobile:String
}
struct Department {
    var name:String
    var alis:String
    var heads:[Manager]
    var coHeads:[Manager]
    var events:[Event]
}
struct Event{
    var name:String
    var participants:String
    var fees:String
    var description:String
    var prizes:[String]
    var rounds:[String]
    var managers:[Manager]
    
}
struct tech{
    var departments:[Department]
}
struct nonTech{
    var events:[Event]
}
func toManagers(rawData:[Dictionary<String,String>])->[Manager]{
    var managers = [Manager]()
    for dicts in rawData{
        managers.append(Manager(name: dicts["name"]!, mobile: dicts["phone"]!))
    }
    return managers
    
}
func toEvents(rawData:[Dictionary<String,Any>])->[Event]{
    var events = [Event]()
    for dicts in rawData{
        events.append(Event(name: dicts["name"] as! String, participants: String(dicts["participants"] as! Int), fees: String(dicts["fees"] as! Int), description: dicts["tagline"] as! String, prizes: (dicts["prizes"] as! [Int]).map{String($0)}, rounds: dicts["rounds"] as! [String], managers: toManagers(rawData: dicts["managers"] as! [Dictionary<String,String>])))
    }
    //dicts["prizes"] as! [Int32]
    return events
}
