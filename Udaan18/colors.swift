//
//  colors.swift
//  Udaan
//
//  Created by Admin on 11/03/2018 .
//  Copyright © 2018 BVM. All rights reserved.
//

import Foundation
import UIKit
class color{
    static let color1:[[CGFloat]] =  [ [0.0,179.0,202.0],[226.0,134.0,142.0],[29.0,78.0,137.0],[210.0,178.0,155.0],[233.0,217.0,137.0],[150.0,82.0,81.0],[128.0,206.0,182.0],[245.0,146.0,86.0]]
    static let color2:[[CGFloat]] =  [ [0.0,225.0,255],[255.0,171.0,178.0],[59.0,147.0,255.0],[255.0,217.0,189.0],[255.0,239.0,156.0],[240.0,138.0,136.0],[158.0,255.0,226.0],[255.0,173.0,122.0]]
    
    
    static let colors1:[[CGFloat]] =  [ [91.0,134.0,229.0],[252.0,203.0,24.0],[54.0,239.0,125.0],[255.0,151.0,101.0]]
    static let colors2:[[CGFloat]] =  [ [62.0,221.0,223.0],[247.0,155.0,47.0],[15.0,154.0,142.0],[255.0,88.0,92.0]]
    
    static let colors15:[[CGFloat]] =  [ [91.0,134.0,229.0],[252.0,203.0,24.0],[54.0,239.0,125.0],[255.0,151.0,101.0]]
    static let colors16:[[CGFloat]] =  [ [62.0,221.0,223.0],[247.0,155.0,47.0],[15.0,154.0,142.0],[255.0,88.0,92.0]]
    
    
    static func getcolor1(index:Int,alph:CGFloat)->UIColor{
        let rgb = color1[index%8]
        let colour = UIColor(displayP3Red: rgb[0]/255.0, green: rgb[1]/255.0, blue: rgb[2]/255.0, alpha: alph)
       return colour
    }
    static func getcolor2(index:Int,alph:CGFloat)->UIColor{
        let rgb = color2[index%8]

        let colour = UIColor(displayP3Red: rgb[0]/255.0, green: rgb[1]/255.0, blue: rgb[2]/255.0, alpha: alph)
        return colour
    }
    static func getcolors1(index:Int,alph:CGFloat)->UIColor{
        let rgb = colors1[index%4]
        let colour = UIColor(displayP3Red: rgb[0]/255.0, green: rgb[1]/255.0, blue: rgb[2]/255.0, alpha: alph)
        return colour
    }
    static func getcolors2(index:Int,alph:CGFloat)->UIColor{
        let rgb = colors2[index%4]
        
        let colour = UIColor(displayP3Red: rgb[0]/255.0, green: rgb[1]/255.0, blue: rgb[2]/255.0, alpha: alph)
        return colour
    }
}
